const functions = require("firebase-functions");
const admin = require("firebase-admin");
const { mergeInventoryCacheDoc } = require("./store_valley_inventory_cache.js");
const {
  syncAvailableForOrder,
} = require("./warehouse_stock_reservation_ops.js");
const {
  isStoredIntakeEvent,
  inventoryMovementRefsFromDelivery,
  restockCompletedPatch,
  restockInventoryClearPatch,
  isOtpVerifiedStatus,
  isDeliveredInventoryEvent,
  isReturnToDesignerRequest,
  nextUnavailable,
  movementOtpVerifiedPatch,
} = require("./store_valley_restock_complete.js");
const {
  patchShopperReturnLogistics,
} = require("./store_valley_shopper_return.js");
const {
  shipmentTypeFromClientOrderId,
  baseOrderId,
  logisticsClientOrderId,
} = require("./store_valley_client_ids.js");
const {
  trackingIdsFrom,
  patchDeliveryInfoList,
  eventStatus,
  verifySignature,
  webhookEventRecord,
} = require("./store_valley_webhook_order.js");

function configValue(key, envName) {
  const fromEnv = process.env[envName];
  if (fromEnv) {
    return fromEnv;
  }
  try {
    const cfg = functions.config().storevalley || {};
    if (cfg[key]) {
      return cfg[key];
    }
  } catch (_) {
    // functions.config() is unset locally
  }
  return "";
}

async function updateByField(collection, field, values, patch) {
  const unique = [...new Set(values.filter((value) => !!value))];
  if (!unique.length) {
    return;
  }
  const db = admin.firestore();
  const chunks = [];
  for (let i = 0; i < unique.length; i += 10) {
    chunks.push(unique.slice(i, i + 10));
  }
  for (const chunk of chunks) {
    const snap =
      chunk.length === 1
        ? await db.collection(collection).where(field, "==", chunk[0]).get()
        : await db.collection(collection).where(field, "in", chunk).get();
    const batch = db.batch();
    snap.forEach((doc) => {
      batch.set(doc.ref, patch, { merge: true });
    });
    if (!snap.empty) {
      await batch.commit();
    }
  }
}

async function queryByField(collection, field, values) {
  const unique = [...new Set(values.filter((value) => !!value))];
  if (!unique.length) {
    return [];
  }
  const db = admin.firestore();
  const docs = [];
  for (let i = 0; i < unique.length; i += 10) {
    const chunk = unique.slice(i, i + 10);
    const snap =
      chunk.length === 1
        ? await db.collection(collection).where(field, "==", chunk[0]).get()
        : await db.collection(collection).where(field, "in", chunk).get();
    snap.forEach((doc) => docs.push(doc));
  }
  return docs;
}

function uniqueDocs(docs) {
  const seen = new Set();
  return docs.filter((doc) => {
    if (seen.has(doc.id)) {
      return false;
    }
    seen.add(doc.id);
    return true;
  });
}

function cartItems(orderData) {
  const items =
    orderData && orderData.order_items && orderData.order_items.cart_items;
  return Array.isArray(items) ? items : [];
}

function applicableShipmentTypes(orderData, deliveryType) {
  const items = cartItems(orderData);
  if (items.length) {
    return {
      hasReady: items.some((item) => item && item.product_main_type === "ready"),
      hasCustom: items.some(
        (item) => item && item.product_main_type !== "ready",
      ),
    };
  }
  return {
    hasReady:
      !!orderData.ready_shipping_request_status || deliveryType === "ready",
    hasCustom:
      !!orderData.custom_shipping_request_status || deliveryType === "custom",
  };
}

function normalizeStatus(status) {
  return String(status || "").toLowerCase();
}

function isDeliveredStatus(status) {
  const value = normalizeStatus(status);
  return value === "delivered" || value === "completed";
}

function isCancelledStatus(status) {
  const value = normalizeStatus(status);
  return value === "cancelled" || value === "canceled";
}

function isTypeComplete(status) {
  return isDeliveredStatus(status) || isCancelledStatus(status);
}

function wholeOrderStatus(hasReady, hasCustom, readyStatus, customStatus, fallback) {
  const checks = [];
  if (hasReady) {
    checks.push(readyStatus);
  }
  if (hasCustom) {
    checks.push(customStatus);
  }
  if (!checks.length) {
    return fallback;
  }
  if (hasReady && hasCustom) {
    if (checks.every(isDeliveredStatus)) {
      return "delivered";
    }
    if (checks.every(isCancelledStatus)) {
      return "cancelled";
    }
    if (checks.every(isTypeComplete)) {
      return checks.some(isDeliveredStatus) ? "delivered" : "cancelled";
    }
    return "processing";
  }
  return checks[0] || fallback;
}

async function applyOrderShippingStatus({
  event,
  status,
  otp,
  deliveryDocs,
}) {
  const db = admin.firestore();
  const clientOrderId = logisticsClientOrderId(event);
  const fromIds = shipmentTypeFromClientOrderId(clientOrderId);
  let deliveryType = fromIds;
  const orderRefs = [];
  deliveryDocs.forEach((doc) => {
    const data = doc.data() || {};
    if (data.delivery_type === "ready" || data.delivery_type === "custom") {
      deliveryType = data.delivery_type;
    }
    if (data.order_ref) {
      orderRefs.push(data.order_ref);
    }
  });
  if (deliveryType !== "ready" && deliveryType !== "custom") {
    const customerDeliveries = deliveryDocs.filter((doc) => {
      const data = doc.data() || {};
      return data.type === "order";
    });
    const orderId = baseOrderId(clientOrderId);
    if (customerDeliveries.length && orderId) {
      const trackingIds = trackingIdsFrom(event, deliveryDocs);
      const orderSnaps = await queryByField("orders", "order_id", [
        orderId,
        clientOrderId,
      ]);
      for (const orderDoc of uniqueDocs(orderSnaps)) {
        const data = orderDoc.data() || {};
        const patch = {
          order_status: status,
          updated_at: admin.firestore.FieldValue.serverTimestamp(),
          store_valley_status: status,
          otp_verification_status: otp.status || null,
        };
        const nextList = patchDeliveryInfoList(
          data.delivery_info_list,
          trackingIds,
          status,
        );
        if (nextList !== data.delivery_info_list) {
          patch.delivery_info_list = nextList;
        }
        await orderDoc.ref.set(patch, { merge: true });
      }
    }
    return;
  }

  const orderDocs = [];
  const orderId = baseOrderId(clientOrderId);
  const lookupIds = [...new Set([orderId, clientOrderId].filter(Boolean))];
  if (lookupIds.length) {
    const byOrderId = await queryByField("orders", "order_id", lookupIds);
    orderDocs.push(...byOrderId);
  }
  for (const ref of orderRefs) {
    const snap = await (typeof ref.get === "function" ? ref.get() : db.doc(String(ref)).get());
    if (snap && snap.exists) {
      orderDocs.push(snap);
    }
  }

  const typeField =
    deliveryType === "custom"
      ? "custom_shipping_request_status"
      : "ready_shipping_request_status";

  for (const orderDoc of uniqueDocs(orderDocs)) {
    const data = orderDoc.data() || {};
    const nextReady =
      typeField === "ready_shipping_request_status"
        ? status
        : data.ready_shipping_request_status;
    const nextCustom =
      typeField === "custom_shipping_request_status"
        ? status
        : data.custom_shipping_request_status;
    const { hasReady, hasCustom } = applicableShipmentTypes(data, deliveryType);
    const patch = {
      updated_at: admin.firestore.FieldValue.serverTimestamp(),
      store_valley_status: status,
      otp_verification_status: otp.status || null,
      [typeField]: status,
      order_status: wholeOrderStatus(
        hasReady,
        hasCustom,
        nextReady,
        nextCustom,
        status,
      ),
    };
    const nextList = patchDeliveryInfoList(
      data.delivery_info_list,
      trackingIdsFrom(event, deliveryDocs),
      status,
    );
    if (nextList !== data.delivery_info_list) {
      patch.delivery_info_list = nextList;
    }
    await orderDoc.ref.set(patch, { merge: true });
  }
}

async function applyDeliveryEvent(event) {
  const status = eventStatus(event);
  const otp = (event.data && event.data.otp_verification) || {};
  const proof = (event.data && event.data.proof) || {};
  const patch = {
    status,
    state: status,
    updated_at: admin.firestore.FieldValue.serverTimestamp(),
    original_source_location_id: event.original_source_location_id || null,
    otp_verification_status: otp.status || null,
    otp_failed_attempts: otp.failed_attempts || 0,
    otp_verified_at: otp.verified_at ? new Date(otp.verified_at) : null,
    proof_photo_url: proof.photo_url || null,
    proof_signature_url: proof.signature_url || null,
    proof_id: proof.proof_id || null,
  };
  const ids = [
    event.resource_id,
    event.client_order_id,
    event.delivery_order_id,
  ];
  await updateByField("delivery", "delivery_tracking_id", ids, patch);
  await updateByField("delivery", "delivery_id", ids, patch);
  await updateByField("logistics_response", "swftTrackID", ids, {
    ...patch,
    name: "store_valley",
  });
  const deliveryDocs = uniqueDocs([
    ...(await queryByField("delivery", "delivery_tracking_id", ids)),
    ...(await queryByField("delivery", "delivery_id", ids)),
  ]);
  await applyOrderShippingStatus({
    event,
    status,
    otp,
    deliveryDocs,
  });
  if (isOtpVerifiedStatus(otp)) {
    await markRestockPickupOtpVerified(deliveryDocs);
  }
  if (isDeliveredInventoryEvent({ resource_type: "delivery_order", status })) {
    await completeDesignerReturnOnDelivered(deliveryDocs);
  }
}

async function applyLogisticsEvent(event) {
  const status = eventStatus(event);
  const otp = (event.data && event.data.otp_verification) || {};
  const proof = (event.data && event.data.proof) || {};
  const patch = {
    status,
    state: status,
    updated_at: admin.firestore.FieldValue.serverTimestamp(),
    request_id: event.resource_id || null,
    external_request_id: event.external_request_id || null,
    delivery_order_id: event.delivery_order_id || null,
    original_source_location_id: event.original_source_location_id || null,
    otp_verification_status: otp.status || null,
    otp_failed_attempts: otp.failed_attempts || 0,
    otp_verified_at: otp.verified_at ? new Date(otp.verified_at) : null,
    proof_photo_url: proof.photo_url || null,
    proof_signature_url: proof.signature_url || null,
    proof_id: proof.proof_id || null,
  };
  const ids = [
    event.resource_id,
    event.external_request_id,
    event.delivery_order_id,
    logisticsClientOrderId(event),
  ];
  await updateByField("delivery", "delivery_tracking_id", ids, patch);
  await updateByField("delivery", "delivery_id", ids, patch);
  await updateByField("logistics_response", "swftTrackID", ids, {
    ...patch,
    name: "store_valley",
  });
  await updateByField(
    "logistics_response",
    "external_request_id",
    [event.external_request_id],
    patch,
  );
  const deliveryDocs = uniqueDocs([
    ...(await queryByField("delivery", "delivery_tracking_id", ids)),
    ...(await queryByField("delivery", "delivery_id", ids)),
  ]);
  await applyOrderShippingStatus({
    event,
    status,
    otp,
    deliveryDocs,
  });
  await patchShopperReturnLogistics(
    deliveryDocs,
    status,
    admin.firestore.FieldValue.serverTimestamp(),
  );
  if (isOtpVerifiedStatus(otp)) {
    await markRestockPickupOtpVerified(deliveryDocs);
  }
  if (isStoredIntakeEvent(event)) {
    await completeRestockOnStored(deliveryDocs);
  }
}

async function markRestockPickupOtpVerified(deliveryDocs) {
  const patch = movementOtpVerifiedPatch();
  for (const deliveryDoc of uniqueDocs(deliveryDocs)) {
    const movementRefs = inventoryMovementRefsFromDelivery(
      deliveryDoc.data() || {},
    );
    for (const movementRef of movementRefs) {
      await movementRef.update(patch);
    }
  }
}

async function completeRestockOnStored(deliveryDocs) {
  for (const deliveryDoc of uniqueDocs(deliveryDocs)) {
    const data = deliveryDoc.data() || {};
    const movementRefs = inventoryMovementRefsFromDelivery(data);
    for (const movementRef of movementRefs) {
      await movementRef.update({
        update_at: admin.firestore.FieldValue.serverTimestamp(),
        ...restockCompletedPatch(),
      });
      const movementSnap = await movementRef.get();
      const inventoryRef =
        movementSnap.exists && movementSnap.data()
          ? movementSnap.data().inventory_ref
          : null;
      if (!inventoryRef) {
        continue;
      }
      await inventoryRef.set(
        {
          updated_at: admin.firestore.FieldValue.serverTimestamp(),
          ...restockInventoryClearPatch(admin.firestore.FieldValue),
        },
        { merge: true },
      );
    }
  }
}

async function completeDesignerReturnOnDelivered(deliveryDocs) {
  const db = admin.firestore();
  for (const deliveryDoc of uniqueDocs(deliveryDocs)) {
    const data = deliveryDoc.data() || {};
    const movementRefs = inventoryMovementRefsFromDelivery(data);
    for (const movementRef of movementRefs) {
      const movementSnap = await movementRef.get();
      if (!movementSnap.exists) {
        continue;
      }
      const movement = movementSnap.data() || {};
      if (!isReturnToDesignerRequest(movement)) {
        continue;
      }
      await movementRef.update({
        update_at: admin.firestore.FieldValue.serverTimestamp(),
        ...restockCompletedPatch(),
      });
      const inventoryRef = movement.inventory_ref;
      if (!inventoryRef) {
        continue;
      }
      const invSnap = await inventoryRef.get();
      const inv = invSnap.exists ? invSnap.data() || {} : {};
      const qty = Math.trunc(Number(movement.product_quantity) || 0);
      const unavailable = nextUnavailable(inv.stock_unavailable, qty);
      const productId = String(inv.product_id || movement.product_id || "");
      await inventoryRef.set(
        {
          updated_at: admin.firestore.FieldValue.serverTimestamp(),
          stock_unavailable: unavailable,
          ...restockInventoryClearPatch(admin.firestore.FieldValue),
        },
        { merge: true },
      );
      if (productId) {
        const cacheSnap = await db
          .collection("store_valley_inventory")
          .doc(productId + "_WH-KWT-MAIN")
          .get();
        const stored = cacheSnap.exists
          ? cacheSnap.get("stored_quantity")
          : 0;
        await syncAvailableForOrder(db, productId, stored);
      }
    }
  }
}

async function applyInventoryEvent(event) {
  await mergeInventoryCacheDoc(admin.firestore(), event, {
    updatedAt: admin.firestore.FieldValue.serverTimestamp(),
    availableDelta: event.available_delta,
    reasonCode: event.reason_code || null,
    eventId: event.event_id,
  });
  if (event.product_id != null && event.stored_quantity != null) {
    await syncAvailableForOrder(
      admin.firestore(),
      event.product_id,
      event.stored_quantity,
    );
  }
}

exports.storeValleyWebhook = functions.https.onRequest(async (req, res) => {
  if (req.method !== "POST") {
    res.status(405).send("Method not allowed");
    return;
  }

  const secret = configValue("webhook_secret", "STOREVALLEY_WEBHOOK_SECRET");
  if (!secret) {
    console.error("storeValleyWebhook: webhook secret is not configured");
    res.status(500).send("Webhook secret is not configured");
    return;
  }

  const rawBody = Buffer.isBuffer(req.rawBody)
    ? req.rawBody.toString("utf8")
    : typeof req.rawBody === "string"
      ? req.rawBody
      : JSON.stringify(req.body || {});
  const timestamp =
    req.get("X-StoreValley-Signature-Timestamp") ||
    req.get("x-storevalley-signature-timestamp");
  const signature =
    req.get("X-StoreValley-Signature") ||
    req.get("x-storevalley-signature");

  if (!verifySignature(rawBody, timestamp, signature, secret)) {
    console.error("storeValleyWebhook: signature verification failed", {
      hasTimestamp: !!timestamp,
      hasSignature: !!signature,
    });
    res.status(401).send("Invalid signature");
    return;
  }

  let event;
  try {
    event = typeof req.body === "object" && req.body ? req.body : JSON.parse(rawBody);
  } catch (_) {
    res.status(400).send("Invalid JSON");
    return;
  }

  const eventId = event.event_id;
  if (!eventId) {
    res.status(400).send("Missing event_id");
    return;
  }

  const eventRef = admin
    .firestore()
    .collection("store_valley_webhook_events")
    .doc(eventId);
  const existing = await eventRef.get();
  if (existing.exists) {
    res.status(200).json({ ok: true, duplicate: true });
    return;
  }

  const resourceType = event.resource_type || "";
  if (resourceType === "selftest") {
    // Sent by storeValleyDiagnostics to prove this address accepts a signed
    // update. It is recorded and nothing else is touched.
    await eventRef.set({
      ...webhookEventRecord(event),
      received_at: admin.firestore.FieldValue.serverTimestamp(),
    });
    res.status(200).json({ ok: true, selftest: true });
    return;
  }
  if (resourceType === "delivery_order") {
    await applyDeliveryEvent(event);
  } else if (resourceType === "inventory") {
    await applyInventoryEvent(event);
  } else {
    await applyLogisticsEvent(event);
  }

  await eventRef.set({
    ...webhookEventRecord(event),
    event_id: eventId,
    event_type: event.event_type || "",
    resource_type: resourceType,
    received_at: admin.firestore.FieldValue.serverTimestamp(),
  });

  res.status(200).json({ ok: true });
});
