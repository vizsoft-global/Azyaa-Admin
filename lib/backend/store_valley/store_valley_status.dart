class StoreValleyStatus {
  static const intakeCreated = 'intake_created';
  static const requestCreated = 'request_created';
  static const pickupScheduled = 'pickup_scheduled';
  static const pickupCompleted = 'pickup_completed';
  static const verificationPassed = 'verification_passed';
  static const verificationFailed = 'verification_failed';
  static const stored = 'stored';
  static const orderAssigned = 'order_assigned';
  static const outForDelivery = 'out_for_delivery';
  static const delivered = 'delivered';
  static const returnInitiated = 'return_initiated';
  static const returnCompleted = 'return_completed';

  static String displayLabel(String status) {
    switch (status) {
      case 'pending':
      case 'confirmed':
      case 'ready':
      case intakeCreated:
      case requestCreated:
      case returnInitiated:
        return 'REQUESTED';
      case 'assigned':
      case orderAssigned:
      case pickupScheduled:
        return 'assigned';
      case 'outForDelivery':
      case outForDelivery:
        return 'out_for_delivery';
      case delivered:
      case stored:
      case returnCompleted:
        return 'delivered';
      case pickupCompleted:
      case verificationPassed:
        return 'processing';
      case verificationFailed:
      case 'failed':
        return 'failed';
      case 'cancelled':
        return 'cancelled';
      case 'returned':
        return 'returned';
      default:
        return status;
    }
  }
}
