function returnRequestRefFromDelivery(data) {
  if (!data || data.type === "inventory") {
    return null;
  }
  return data.return_request_ref || null;
}

function shopperReturnLogisticsPatch(status, now) {
  return {
    logistics_status: status || "",
    updated_at: now,
  };
}

async function patchShopperReturnLogistics(deliveryDocs, status, now) {
  const patch = shopperReturnLogisticsPatch(status, now);
  const unique = [];
  const seen = new Set();
  for (const deliveryDoc of deliveryDocs || []) {
    const id = deliveryDoc && deliveryDoc.id;
    if (id && seen.has(id)) {
      continue;
    }
    if (id) {
      seen.add(id);
    }
    unique.push(deliveryDoc);
  }
  for (const deliveryDoc of unique) {
    const data =
      deliveryDoc && typeof deliveryDoc.data === "function"
        ? deliveryDoc.data() || {}
        : {};
    const ref = returnRequestRefFromDelivery(data);
    if (!ref || typeof ref.set !== "function") {
      continue;
    }
    await ref.set(patch, { merge: true });
  }
}

module.exports = {
  returnRequestRefFromDelivery,
  shopperReturnLogisticsPatch,
  patchShopperReturnLogistics,
};
