import 'inventory_request_type.dart';

class RestockRequestOrigin {
  RestockRequestOrigin._();

  static const designer = 'designer';
  static const admin = 'admin';

  static bool designerMustAccept({
    required String requestType,
    String raisedBy = '',
    String inventoryRequestId = '',
    DateTime? adminPreferredDate,
  }) {
    if (InventoryRequestType.isReturnToDesigner(requestType)) {
      return false;
    }
    if (requestType != InventoryRequestType.restock) {
      return true;
    }
    final origin = raisedBy.trim().toLowerCase();
    if (origin == designer) {
      return false;
    }
    if (origin == admin) {
      return true;
    }
    if (inventoryRequestId.startsWith('INVRSQ')) {
      return true;
    }
    return adminPreferredDate != null;
  }
}
