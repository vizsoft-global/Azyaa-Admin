function shipmentTypeFromClientOrderId(clientOrderId) {
  const id = String(clientOrderId || "");
  if (/-CM(?:-|$)/i.test(id)) {
    return "custom";
  }
  if (/-RM(?:-|$)/i.test(id)) {
    return "ready";
  }
  return "";
}

function baseOrderId(clientOrderId) {
  return String(clientOrderId || "").replace(/-(RM|CM)(?:-.*)?$/i, "");
}

function externalRequestId(clientOrderId) {
  return "PKP-" + String(clientOrderId || "");
}

function logisticsClientOrderId(event) {
  const candidates = [
    event && event.client_order_id,
    event && event.source_order_id,
    String((event && event.external_request_id) || "").replace(
      /^(PKP|INT|RET)-/i,
      "",
    ),
  ];
  return candidates.find((value) => !!value) || "";
}

module.exports = {
  shipmentTypeFromClientOrderId,
  baseOrderId,
  externalRequestId,
  logisticsClientOrderId,
};
