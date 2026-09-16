import 'package:flutter_test/flutter_test.dart';

import 'package:azyaa_admin_panel/backend/store_valley/store_valley_intake_tracking.dart';
import 'package:azyaa_admin_panel/backend/store_valley/store_valley_status.dart';

void main() {
  test('intake_created is the first current step', () {
    final steps = StoreValleyIntakeTracking.stepsFor('intake_created');
    expect(steps.map((s) => s.status).toList(), [
      StoreValleyStatus.intakeCreated,
      StoreValleyStatus.pickupScheduled,
      StoreValleyStatus.pickupCompleted,
      StoreValleyStatus.verificationPassed,
      StoreValleyStatus.stored,
    ]);
    expect(StoreValleyIntakeTracking.currentIndex('intake_created'), 0);
    expect(steps[0].label, 'Intake requested');
  });

  test('pickup_completed marks handover and earlier steps done', () {
    expect(StoreValleyIntakeTracking.currentIndex('pickup_completed'), 2);
    expect(
      StoreValleyIntakeTracking.intakeStepLabel('pickup_completed'),
      'Handed to delivery partner',
    );
    expect(StoreValleyIntakeTracking.isStepDone('intake_created', 2), isTrue);
    expect(StoreValleyIntakeTracking.isStepDone('pickup_scheduled', 2), isTrue);
  });

  test('stored completes every intake step', () {
    expect(StoreValleyIntakeTracking.currentIndex('stored'), 4);
    expect(StoreValleyIntakeTracking.isComplete('stored'), isTrue);
  });

  test('fulfill complete is Completed or legacy Received', () {
    expect(StoreValleyIntakeTracking.isFulfillComplete('Completed'), isTrue);
    expect(StoreValleyIntakeTracking.isFulfillComplete('Received'), isTrue);
    expect(
      StoreValleyIntakeTracking.isFulfillComplete('DeliveryPartnerAssigned'),
      isFalse,
    );
  });

  test('verification_failed stops at warehouse QC', () {
    final steps = StoreValleyIntakeTracking.stepsFor('verification_failed');
    expect(steps.last.status, StoreValleyStatus.verificationFailed);
    expect(steps.last.label, 'Warehouse QC failed');
    expect(StoreValleyIntakeTracking.currentIndex('verification_failed'), 3);
  });

  test('OTP row shows code while pending and hides it after verified', () {
    expect(
      StoreValleyIntakeTracking.otpRowLabel(
        pickupOtp: '482193',
        fulfillStatus: 'DeliveryPartnerAssigned',
        otpVerificationStatus: '',
      ),
      'OTP 482193',
    );
    expect(
      StoreValleyIntakeTracking.otpRowLabel(
        pickupOtp: '482193',
        fulfillStatus: 'DeliveryPartnerAssigned',
        otpVerificationStatus: 'verified',
      ),
      'OTP verified',
    );
    expect(
      StoreValleyIntakeTracking.otpRowLabel(
        pickupOtp: '482193',
        fulfillStatus: 'Completed',
        otpVerificationStatus: '',
      ),
      'OTP verified',
    );
    expect(
      StoreValleyIntakeTracking.otpRowLabel(
        pickupOtp: '482193',
        fulfillStatus: 'DeliveryPartnerAssigned',
        intakeStatus: 'pickup_completed',
      ),
      'OTP verified',
    );
  });

  test('OTP resend is allowed only while pending', () {
    expect(
      StoreValleyIntakeTracking.canResendPickupOtp(
        pickupOtp: '482193',
        intakeStatus: 'intake_created',
      ),
      isTrue,
    );
    expect(
      StoreValleyIntakeTracking.canResendPickupOtp(
        pickupOtp: '482193',
        otpVerificationStatus: 'verified',
      ),
      isFalse,
    );
    expect(
      StoreValleyIntakeTracking.canResendPickupOtp(
        pickupOtp: '482193',
        intakeStatus: 'pickup_completed',
      ),
      isFalse,
    );
    expect(
      StoreValleyIntakeTracking.canResendPickupOtp(
        pickupOtp: '',
        intakeStatus: 'intake_created',
      ),
      isFalse,
    );
  });

  test('order details shows OTP code and hides the row after verified', () {
    expect(
      StoreValleyIntakeTracking.customerShipmentOtpLabel(
        pickupOtp: '461832',
        otpVerificationStatus: '',
      ),
      'OTP : 461832',
    );
    expect(
      StoreValleyIntakeTracking.customerShipmentOtpLabel(
        pickupOtp: '461832',
        otpVerificationStatus: 'verified',
      ),
      isNull,
    );
    expect(
      StoreValleyIntakeTracking.customerShipmentOtpLabel(
        pickupOtp: '461832',
        deliveryStatus: 'delivered',
      ),
      isNull,
    );
    expect(
      StoreValleyIntakeTracking.customerShipmentOtpLabel(
        pickupOtp: '',
        otpVerificationStatus: '',
      ),
      isNull,
    );
  });

  test('restock tracking id prefers delivery_tracking_id then INT-request', () {
    expect(
      StoreValleyIntakeTracking.resolveTrackingId(
        deliveryTrackingId: 'yySSwnzskDOZs2IIGVS6',
        inventoryRequestId: 'INVNSQ1038',
      ),
      'yySSwnzskDOZs2IIGVS6',
    );
    expect(
      StoreValleyIntakeTracking.resolveTrackingId(
        deliveryTrackingId: '',
        inventoryRequestId: 'INVNSQ1038',
      ),
      'INT-INVNSQ1038',
    );
  });
}
