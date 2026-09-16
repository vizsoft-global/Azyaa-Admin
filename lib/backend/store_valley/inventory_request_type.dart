class InventoryRequestType {
  InventoryRequestType._();

  static const restock = 'Restock';
  static const returnToDesigner = 'Return to Designer';
  static const deliveryNote = 'return to designer';

  static bool isRestock(String type) => type == restock;

  static bool isReturnToDesigner(String type) => type == returnToDesigner;

  static bool needsSuperadminApprove(String type) =>
      isRestock(type) || isReturnToDesigner(type);

  static bool showLegacyNonRestockShipping(String type) =>
      !isRestock(type) && !isReturnToDesigner(type);

  static String movementStatus(String type) =>
      isReturnToDesigner(type) ? 'outbound' : 'inbound';

  static bool canReturnQty({
    required int qty,
    required int availableForOrder,
  }) {
    return qty > 0 && qty <= availableForOrder;
  }
}
