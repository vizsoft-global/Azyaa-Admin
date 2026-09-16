bool storeValleyDeliveryAlreadyOpen(String? status) {
  final value = (status ?? '').trim().toLowerCase();
  if (value.isEmpty ||
      value == 'failed' ||
      value == 'cancelled' ||
      value == 'canceled') {
    return false;
  }
  return true;
}

String warehouseDeliveryBadgeLabel(String? status) {
  switch ((status ?? '').trim().toLowerCase()) {
    case 'queued':
      return 'Warehouse delivery queued';
    case 'requested':
      return 'Warehouse delivery requested';
    case 'failed':
      return 'Warehouse delivery failed';
    default:
      return '';
  }
}

String customDeliveryBadgeLabel(String? status) {
  switch ((status ?? '').trim().toLowerCase()) {
    case 'queued':
      return 'Pickup queued';
    case 'requested':
      return 'Pickup requested';
    case 'failed':
      return 'Pickup request failed';
    default:
      return '';
  }
}
