import 'store_valley_status.dart';

class IntakeTrackStep {
  const IntakeTrackStep({
    required this.status,
    required this.label,
  });

  final String status;
  final String label;
}

class StoreValleyIntakeTracking {
  StoreValleyIntakeTracking._();

  static const _happyPath = [
    IntakeTrackStep(
      status: StoreValleyStatus.intakeCreated,
      label: 'Intake requested',
    ),
    IntakeTrackStep(
      status: StoreValleyStatus.pickupScheduled,
      label: 'Driver assigned',
    ),
    IntakeTrackStep(
      status: StoreValleyStatus.pickupCompleted,
      label: 'Handed to delivery partner',
    ),
    IntakeTrackStep(
      status: StoreValleyStatus.verificationPassed,
      label: 'Warehouse QC passed',
    ),
    IntakeTrackStep(
      status: StoreValleyStatus.stored,
      label: 'Stored in warehouse',
    ),
  ];

  static const _failedQc = IntakeTrackStep(
    status: StoreValleyStatus.verificationFailed,
    label: 'Warehouse QC failed',
  );

  static String intakeStepLabel(String status) {
    final value = status.trim().toLowerCase();
    if (value == StoreValleyStatus.verificationFailed) {
      return _failedQc.label;
    }
    for (final step in _happyPath) {
      if (step.status == value) {
        return step.label;
      }
    }
    return StoreValleyStatus.displayLabel(status);
  }

  static List<IntakeTrackStep> stepsFor(String status) {
    if (status.trim().toLowerCase() == StoreValleyStatus.verificationFailed) {
      return [..._happyPath.take(3), _failedQc];
    }
    return List<IntakeTrackStep>.from(_happyPath);
  }

  static int currentIndex(String status) {
    final value = status.trim().toLowerCase();
    if (value == StoreValleyStatus.verificationFailed) {
      return 3;
    }
    final index = _happyPath.indexWhere((step) => step.status == value);
    return index < 0 ? 0 : index;
  }

  static bool isStepDone(String stepStatus, int current) {
    final index = _happyPath.indexWhere((step) => step.status == stepStatus);
    if (index < 0) {
      return false;
    }
    return index < current;
  }

  static bool isComplete(String status) {
    return status.trim().toLowerCase() == StoreValleyStatus.stored;
  }

  static bool isFulfillComplete(String fulfillStatus) {
    final fulfill = fulfillStatus.trim();
    return fulfill == 'Completed' || fulfill == 'Received';
  }

  static bool isOtpVerified({
    String otpVerificationStatus = '',
    String fulfillStatus = '',
    String intakeStatus = '',
  }) {
    final otp = otpVerificationStatus.trim().toLowerCase();
    final fulfill = fulfillStatus.trim();
    final intake = intakeStatus.trim().toLowerCase();
    if (otp == 'verified') {
      return true;
    }
    if (fulfill == 'Completed' || fulfill == 'Received') {
      return true;
    }
    return intake == StoreValleyStatus.pickupCompleted ||
        intake == StoreValleyStatus.verificationPassed ||
        intake == StoreValleyStatus.stored ||
        intake == StoreValleyStatus.delivered;
  }

  static String? customerShipmentOtpLabel({
    required String pickupOtp,
    String otpVerificationStatus = '',
    String deliveryStatus = '',
  }) {
    if (isOtpVerified(
      otpVerificationStatus: otpVerificationStatus,
      intakeStatus: deliveryStatus,
    )) {
      return null;
    }
    final otp = pickupOtp.trim();
    if (otp.isEmpty) {
      return null;
    }
    return 'OTP : $otp';
  }

  static String? otpRowLabel({
    required String pickupOtp,
    required String fulfillStatus,
    String otpVerificationStatus = '',
    String intakeStatus = '',
  }) {
    if (pickupOtp.trim().isEmpty &&
        !isFulfillComplete(fulfillStatus) &&
        !isOtpVerified(
          otpVerificationStatus: otpVerificationStatus,
          fulfillStatus: fulfillStatus,
          intakeStatus: intakeStatus,
        )) {
      return null;
    }
    if (isOtpVerified(
      otpVerificationStatus: otpVerificationStatus,
      fulfillStatus: fulfillStatus,
      intakeStatus: intakeStatus,
    )) {
      return 'OTP verified';
    }
    if (fulfillStatus == 'DeliveryPartnerAssigned' &&
        pickupOtp.trim().isNotEmpty) {
      return 'OTP ${pickupOtp.trim()}';
    }
    return null;
  }

  static bool canResendPickupOtp({
    required String pickupOtp,
    String otpVerificationStatus = '',
    String intakeStatus = '',
  }) {
    if (pickupOtp.trim().isEmpty) {
      return false;
    }
    return !isOtpVerified(
      otpVerificationStatus: otpVerificationStatus,
      intakeStatus: intakeStatus,
    );
  }

  static String resolveTrackingId({
    required String deliveryTrackingId,
    required String inventoryRequestId,
  }) {
    final tracking = deliveryTrackingId.trim();
    if (tracking.isNotEmpty) {
      return tracking;
    }
    final requestId = inventoryRequestId.trim();
    if (requestId.isEmpty) {
      return '';
    }
    return requestId.startsWith('INT-') ? requestId : 'INT-$requestId';
  }
}
