const admin = require("firebase-admin");
const {
  COLLECTION,
  inventoryCacheDocId,
} = require("./store_valley_inventory_cache.js");
const logic = require("./warehouse_stock_reservation.js");

const DEFAULT_WAREHOUSE_ID = "WH-KWT-MAIN";

function serverTimestamp() {
  try {
    return admin.firestore.FieldValue.serverTimestamp();
  } catch (_) {
    return new Date();
  }
}

function inventoryRefFromValue(db, raw) {
  if (!raw) {
    return null;
  }
  if (typeof raw.path === "string" && raw.path) {
    return db.doc(raw.path);
  }
  if (typeof raw === "string") {
    const path = raw.includes("/") ? raw : "inventory/" + raw;
    return db.doc(path);
  }
  return null;
}

async function findInventoryRef(db, line) {
  const direct = inventoryRefFromValue(db, line.inventoryRef);
  if (direct) {
    return direct;
  }
  if (line.inventoryId) {
    const byId = await db
      .collection("inventory")
      .where("inventory_id", "==", line.inventoryId)
      .limit(1)
      .get();
    if (!byId.empty) {
      return byId.docs[0].ref;
    }
  }
  if (line.productId) {
    const byProduct = await db
      .collection("inventory")
      .where("product_id", "==", line.productId)
      .limit(1)
      .get();
    if (!byProduct.empty) {
      return byProduct.docs[0].ref;
    }
  }
  return null;
}

async function resolveLines(db, lines, warehouseId) {
  const resolved = [];
  for (const line of lines) {
    const invRef = await findInventoryRef(db, line);
    const cacheRef = db
      .collection(COLLECTION)
      .doc(inventoryCacheDocId(line.productId, warehouseId));
    resolved.push({ ...line, invRef, cacheRef });
  }
  return resolved;
}

function inventoryStateFromSnaps(invSnap, cacheSnap) {
  const inv = invSnap.exists ? invSnap.data() || {} : {};
  const cache = cacheSnap.exists ? cacheSnap.data() || {} : {};
  return {
    stored: logic.toInt(cache.stored_quantity),
    reserved: logic.toInt(inv.stock_reserved),
    unavailable: logic.toInt(inv.stock_unavailable),
    previousAvailable: inv.available_for_order,
  };
}

async function reserveOrder(db, orderRef, options) {
  const opts = options || {};
  const warehouseId = opts.warehouseId || DEFAULT_WAREHOUSE_ID;
  const orderSnap = await orderRef.get();
  if (!orderSnap.exists) {
    return { ok: false, code: "not_found" };
  }
  const order = orderSnap.data() || {};
  const status = order.inventory_reservation_status;
  const retryFailed = opts.retry === true && status === logic.STATUS.STOCK_FAILED;
  if (logic.shouldSkipReserve(status) && !retryFailed) {
    const skipped = {
      ok: true,
      skipped: true,
      status: order.inventory_reservation_status,
    };
    await enqueueWarehouseAfterReserve(db, orderRef, skipped);
    return skipped;
  }
  const lines = opts.openOnly
    ? logic.openWarehouseLinesFromOrder(order)
    : logic.warehouseLinesFromOrder(order);
  if (!lines.length) {
    if (!order.inventory_reservation_status) {
      await orderRef.update({
        inventory_reservation_status: logic.STATUS.NONE,
        updated_at: serverTimestamp(),
      });
    }
    return { ok: true, skipped: true, status: logic.STATUS.NONE };
  }
  const resolved = await resolveLines(db, lines, warehouseId);
  const result = await db.runTransaction(async (tx) => {
    const freshSnap = await tx.get(orderRef);
    if (!freshSnap.exists) {
      return { ok: false, code: "not_found" };
    }
    const fresh = freshSnap.data() || {};
    const freshStatus = fresh.inventory_reservation_status;
    const retryFresh =
      opts.retry === true && freshStatus === logic.STATUS.STOCK_FAILED;
    if (logic.shouldSkipReserve(freshStatus) && !retryFresh) {
      return {
        ok: true,
        skipped: true,
        status: fresh.inventory_reservation_status,
      };
    }
    const patches = [];
    const failed = [];
    for (const line of resolved) {
      if (!line.invRef) {
        failed.push({ productId: line.productId, code: "inventory_missing" });
        continue;
      }
      const invSnap = await tx.get(line.invRef);
      const cacheSnap = await tx.get(line.cacheRef);
      const state = inventoryStateFromSnaps(invSnap, cacheSnap);
      const result = logic.applyReserve({
        ...state,
        qty: line.qty,
        force: opts.force === true,
      });
      if (!result.ok) {
        failed.push({
          productId: line.productId,
          code: result.code,
          sellable: result.sellable,
        });
        continue;
      }
      patches.push({
        ref: line.invRef,
        productId: line.productId,
        qty: line.qty,
        data: {
          stock_reserved: result.reserved,
          available_for_order: result.availableForOrder,
          updated_at: serverTimestamp(),
        },
      });
    }
    if (failed.length && !opts.force) {
      tx.update(orderRef, {
        inventory_reservation_status: logic.STATUS.STOCK_FAILED,
        inventory_reservation_lines: logic.lineStatusMap(
          lines,
          logic.STATUS.STOCK_FAILED,
        ),
        updated_at: serverTimestamp(),
      });
      return { ok: false, code: "out_of_stock", failed };
    }
    for (const patch of patches) {
      tx.update(patch.ref, patch.data);
    }
    const reservedLines = patches.map((patch) => ({
      productId: patch.productId,
      qty: patch.qty,
    }));
    tx.update(orderRef, {
      inventory_reservation_status: logic.STATUS.RESERVED,
      inventory_reservation_lines: logic.lineStatusMap(
        reservedLines,
        logic.STATUS.RESERVED,
      ),
      updated_at: serverTimestamp(),
    });
    return { ok: true, status: logic.STATUS.RESERVED, lines: reservedLines };
  });
  await enqueueWarehouseAfterReserve(db, orderRef, result);
  return result;
}

async function enqueueWarehouseAfterReserve(db, orderRef, result) {
  if (!result || !result.ok) {
    return;
  }
  if (result.status !== logic.STATUS.RESERVED) {
    return;
  }
  try {
    const {
      enqueueWarehouseDelivery,
    } = require("./store_valley_delivery_jobs_ops.js");
    await enqueueWarehouseDelivery(db, orderRef);
  } catch (error) {
    console.error("enqueue warehouse delivery failed", error.message);
  }
}

async function releaseOrder(db, orderRef, options) {
  const opts = options || {};
  const reason = opts.reason === "shipped" ? "shipped" : "cancelled";
  const lineStatus =
    reason === "shipped"
      ? logic.STATUS.RELEASED_SHIPPED
      : logic.STATUS.RELEASED_CANCELLED;
  const warehouseId = opts.warehouseId || DEFAULT_WAREHOUSE_ID;
  const orderSnap = await orderRef.get();
  const order = orderSnap.exists
    ? orderSnap.data() || {}
    : opts.orderData || {};
  const linesMap = Object.assign({}, order.inventory_reservation_lines || {});
  const status = order.inventory_reservation_status;
  if (status === logic.STATUS.RELEASED_SHIPPED && reason === "cancelled") {
    return { ok: true, skipped: true, status };
  }
  const sourceLines = logic.warehouseLinesFromOrder(order);
  const requested = logic.filterLinesByProductIds(sourceLines, opts.productIds);
  const toRelease = requested.filter((line) => {
    const current = linesMap[line.productId];
    if (!current) {
      return status === logic.STATUS.RESERVED;
    }
    return current.status === logic.STATUS.RESERVED;
  });
  if (!toRelease.length) {
    return {
      ok: true,
      skipped: true,
      status: status || logic.STATUS.NONE,
    };
  }
  const resolved = await resolveLines(db, toRelease, warehouseId);
  const released = await db.runTransaction(async (tx) => {
    const freshSnap = orderSnap.exists ? await tx.get(orderRef) : null;
    const fresh = freshSnap && freshSnap.exists ? freshSnap.data() || {} : order;
    const nextLines = Object.assign(
      {},
      fresh.inventory_reservation_lines || linesMap,
    );
    for (const line of resolved) {
      if (!line.invRef) {
        continue;
      }
      const current = nextLines[line.productId];
      if (current && current.status !== logic.STATUS.RESERVED) {
        continue;
      }
      const invSnap = await tx.get(line.invRef);
      const cacheSnap = await tx.get(line.cacheRef);
      const state = inventoryStateFromSnaps(invSnap, cacheSnap);
      const result = logic.applyRelease({
        ...state,
        qty: line.qty,
        mode: reason,
      });
      tx.update(line.invRef, {
        stock_reserved: result.reserved,
        available_for_order: result.availableForOrder,
        updated_at: serverTimestamp(),
      });
      nextLines[line.productId] = { qty: line.qty, status: lineStatus };
    }
    if (freshSnap && freshSnap.exists) {
      tx.update(orderRef, {
        inventory_reservation_status: logic.wholeOrderStatus(nextLines),
        inventory_reservation_lines: nextLines,
        updated_at: serverTimestamp(),
      });
    }
    return {
      ok: true,
      status: logic.wholeOrderStatus(nextLines),
      reason,
    };
  });
  if (reason === "cancelled") {
    try {
      const { cancelQueuedJobs } = require("./store_valley_delivery_jobs_ops.js");
      const jobs = require("./store_valley_delivery_jobs.js");
      await cancelQueuedJobs(
        db,
        order.order_id || orderRef.id,
        jobs.KIND.WAREHOUSE,
      );
    } catch (error) {
      console.error("cancel warehouse delivery job failed", error.message);
    }
  }
  return released;
}

async function syncAvailableForOrder(db, productId, stored) {
  if (!productId) {
    return 0;
  }
  const snap = await db
    .collection("inventory")
    .where("product_id", "==", String(productId))
    .limit(10)
    .get();
  let updated = 0;
  for (const doc of snap.docs) {
    const reserved = logic.toInt(doc.get("stock_reserved"));
    const unavailable = logic.toInt(doc.get("stock_unavailable"));
    const available = logic.availableForOrder(stored, reserved, unavailable);
    await doc.ref.update({
      available_for_order: available,
      updated_at: serverTimestamp(),
    });
    updated += 1;
  }
  return updated;
}

async function backfillReservations(db, options) {
  const opts = options || {};
  const pageSize = opts.pageSize || 100;
  let lastDoc = null;
  let reserved = 0;
  let skipped = 0;
  let failed = 0;
  let scanned = 0;
  while (true) {
    let query = db
      .collection("orders")
      .where("payment_status", "==", "CAPTURED")
      .orderBy(admin.firestore.FieldPath.documentId())
      .limit(pageSize);
    if (lastDoc) {
      query = query.startAfter(lastDoc);
    }
    const page = await query.get();
    if (page.empty) {
      break;
    }
    for (const doc of page.docs) {
      scanned += 1;
      const result = await reserveOrder(db, doc.ref, {
        force: true,
        retry: true,
        openOnly: true,
        warehouseId: opts.warehouseId,
      });
      if (result.skipped) {
        skipped += 1;
      } else if (result.ok) {
        reserved += 1;
      } else {
        failed += 1;
      }
    }
    lastDoc = page.docs[page.docs.length - 1];
    if (page.docs.length < pageSize) {
      break;
    }
  }
  return { scanned, reserved, skipped, failed };
}

module.exports = {
  DEFAULT_WAREHOUSE_ID,
  findInventoryRef,
  reserveOrder,
  releaseOrder,
  syncAvailableForOrder,
  backfillReservations,
};
