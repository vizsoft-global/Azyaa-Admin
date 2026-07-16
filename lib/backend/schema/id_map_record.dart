import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IdMapRecord extends FirestoreRecord {
  IdMapRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  bool hasUserId() => _userId != null;

  // "measurement_id" field.
  int? _measurementId;
  int get measurementId => _measurementId ?? 0;
  bool hasMeasurementId() => _measurementId != null;

  // "relation_id" field.
  int? _relationId;
  int get relationId => _relationId ?? 0;
  bool hasRelationId() => _relationId != null;

  // "address_id" field.
  int? _addressId;
  int get addressId => _addressId ?? 0;
  bool hasAddressId() => _addressId != null;

  // "cart_id" field.
  int? _cartId;
  int get cartId => _cartId ?? 0;
  bool hasCartId() => _cartId != null;

  // "cart_item_id" field.
  int? _cartItemId;
  int get cartItemId => _cartItemId ?? 0;
  bool hasCartItemId() => _cartItemId != null;

  // "wishlist_id" field.
  int? _wishlistId;
  int get wishlistId => _wishlistId ?? 0;
  bool hasWishlistId() => _wishlistId != null;

  // "wishlist_item_id" field.
  int? _wishlistItemId;
  int get wishlistItemId => _wishlistItemId ?? 0;
  bool hasWishlistItemId() => _wishlistItemId != null;

  // "user_referral_id" field.
  int? _userReferralId;
  int get userReferralId => _userReferralId ?? 0;
  bool hasUserReferralId() => _userReferralId != null;

  // "designer_request_id" field.
  int? _designerRequestId;
  int get designerRequestId => _designerRequestId ?? 0;
  bool hasDesignerRequestId() => _designerRequestId != null;

  // "creator_request_id" field.
  int? _creatorRequestId;
  int get creatorRequestId => _creatorRequestId ?? 0;
  bool hasCreatorRequestId() => _creatorRequestId != null;

  // "order_id" field.
  int? _orderId;
  int get orderId => _orderId ?? 0;
  bool hasOrderId() => _orderId != null;

  // "form_id" field.
  int? _formId;
  int get formId => _formId ?? 0;
  bool hasFormId() => _formId != null;

  // "membership_id" field.
  int? _membershipId;
  int get membershipId => _membershipId ?? 0;
  bool hasMembershipId() => _membershipId != null;

  // "subscription_id" field.
  int? _subscriptionId;
  int get subscriptionId => _subscriptionId ?? 0;
  bool hasSubscriptionId() => _subscriptionId != null;

  // "review_id" field.
  int? _reviewId;
  int get reviewId => _reviewId ?? 0;
  bool hasReviewId() => _reviewId != null;

  // "promotion_id" field.
  int? _promotionId;
  int get promotionId => _promotionId ?? 0;
  bool hasPromotionId() => _promotionId != null;

  // "preferences_id" field.
  int? _preferencesId;
  int get preferencesId => _preferencesId ?? 0;
  bool hasPreferencesId() => _preferencesId != null;

  // "designer_id" field.
  int? _designerId;
  int get designerId => _designerId ?? 0;
  bool hasDesignerId() => _designerId != null;

  // "creator_id" field.
  int? _creatorId;
  int get creatorId => _creatorId ?? 0;
  bool hasCreatorId() => _creatorId != null;

  // "product_id" field.
  int? _productId;
  int get productId => _productId ?? 0;
  bool hasProductId() => _productId != null;

  // "role_id" field.
  int? _roleId;
  int get roleId => _roleId ?? 0;
  bool hasRoleId() => _roleId != null;

  // "permission_id" field.
  int? _permissionId;
  int get permissionId => _permissionId ?? 0;
  bool hasPermissionId() => _permissionId != null;

  // "category_id" field.
  int? _categoryId;
  int get categoryId => _categoryId ?? 0;
  bool hasCategoryId() => _categoryId != null;

  // "tag_id" field.
  int? _tagId;
  int get tagId => _tagId ?? 0;
  bool hasTagId() => _tagId != null;

  // "brand_id" field.
  int? _brandId;
  int get brandId => _brandId ?? 0;
  bool hasBrandId() => _brandId != null;

  // "attribute_id" field.
  int? _attributeId;
  int get attributeId => _attributeId ?? 0;
  bool hasAttributeId() => _attributeId != null;

  // "movement_log_id" field.
  int? _movementLogId;
  int get movementLogId => _movementLogId ?? 0;
  bool hasMovementLogId() => _movementLogId != null;

  // "inventory_request_id" field.
  int? _inventoryRequestId;
  int get inventoryRequestId => _inventoryRequestId ?? 0;
  bool hasInventoryRequestId() => _inventoryRequestId != null;

  // "inventory_id" field.
  int? _inventoryId;
  int get inventoryId => _inventoryId ?? 0;
  bool hasInventoryId() => _inventoryId != null;

  // "enquiry_id" field.
  int? _enquiryId;
  int get enquiryId => _enquiryId ?? 0;
  bool hasEnquiryId() => _enquiryId != null;

  // "delivery_id" field.
  int? _deliveryId;
  int get deliveryId => _deliveryId ?? 0;
  bool hasDeliveryId() => _deliveryId != null;

  // "delivery_partner_id" field.
  int? _deliveryPartnerId;
  int get deliveryPartnerId => _deliveryPartnerId ?? 0;
  bool hasDeliveryPartnerId() => _deliveryPartnerId != null;

  // "vto_id" field.
  int? _vtoId;
  int get vtoId => _vtoId ?? 0;
  bool hasVtoId() => _vtoId != null;

  // "coupon_id" field.
  int? _couponId;
  int get couponId => _couponId ?? 0;
  bool hasCouponId() => _couponId != null;

  // "loyalty_history_id" field.
  int? _loyaltyHistoryId;
  int get loyaltyHistoryId => _loyaltyHistoryId ?? 0;
  bool hasLoyaltyHistoryId() => _loyaltyHistoryId != null;

  // "sku_id" field.
  int? _skuId;
  int get skuId => _skuId ?? 0;
  bool hasSkuId() => _skuId != null;

  // "sizechart_id" field.
  int? _sizechartId;
  int get sizechartId => _sizechartId ?? 0;
  bool hasSizechartId() => _sizechartId != null;

  // "theme_id" field.
  int? _themeId;
  int get themeId => _themeId ?? 0;
  bool hasThemeId() => _themeId != null;

  // "transaction_id" field.
  int? _transactionId;
  int get transactionId => _transactionId ?? 0;
  bool hasTransactionId() => _transactionId != null;

  // "sale_history_id" field.
  int? _saleHistoryId;
  int get saleHistoryId => _saleHistoryId ?? 0;
  bool hasSaleHistoryId() => _saleHistoryId != null;

  // "notification_id" field.
  int? _notificationId;
  int get notificationId => _notificationId ?? 0;
  bool hasNotificationId() => _notificationId != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _userId = castToType<int>(snapshotData['user_id']);
    _measurementId = castToType<int>(snapshotData['measurement_id']);
    _relationId = castToType<int>(snapshotData['relation_id']);
    _addressId = castToType<int>(snapshotData['address_id']);
    _cartId = castToType<int>(snapshotData['cart_id']);
    _cartItemId = castToType<int>(snapshotData['cart_item_id']);
    _wishlistId = castToType<int>(snapshotData['wishlist_id']);
    _wishlistItemId = castToType<int>(snapshotData['wishlist_item_id']);
    _userReferralId = castToType<int>(snapshotData['user_referral_id']);
    _designerRequestId = castToType<int>(snapshotData['designer_request_id']);
    _creatorRequestId = castToType<int>(snapshotData['creator_request_id']);
    _orderId = castToType<int>(snapshotData['order_id']);
    _formId = castToType<int>(snapshotData['form_id']);
    _membershipId = castToType<int>(snapshotData['membership_id']);
    _subscriptionId = castToType<int>(snapshotData['subscription_id']);
    _reviewId = castToType<int>(snapshotData['review_id']);
    _promotionId = castToType<int>(snapshotData['promotion_id']);
    _preferencesId = castToType<int>(snapshotData['preferences_id']);
    _designerId = castToType<int>(snapshotData['designer_id']);
    _creatorId = castToType<int>(snapshotData['creator_id']);
    _productId = castToType<int>(snapshotData['product_id']);
    _roleId = castToType<int>(snapshotData['role_id']);
    _permissionId = castToType<int>(snapshotData['permission_id']);
    _categoryId = castToType<int>(snapshotData['category_id']);
    _tagId = castToType<int>(snapshotData['tag_id']);
    _brandId = castToType<int>(snapshotData['brand_id']);
    _attributeId = castToType<int>(snapshotData['attribute_id']);
    _movementLogId = castToType<int>(snapshotData['movement_log_id']);
    _inventoryRequestId = castToType<int>(snapshotData['inventory_request_id']);
    _inventoryId = castToType<int>(snapshotData['inventory_id']);
    _enquiryId = castToType<int>(snapshotData['enquiry_id']);
    _deliveryId = castToType<int>(snapshotData['delivery_id']);
    _deliveryPartnerId = castToType<int>(snapshotData['delivery_partner_id']);
    _vtoId = castToType<int>(snapshotData['vto_id']);
    _couponId = castToType<int>(snapshotData['coupon_id']);
    _loyaltyHistoryId = castToType<int>(snapshotData['loyalty_history_id']);
    _skuId = castToType<int>(snapshotData['sku_id']);
    _sizechartId = castToType<int>(snapshotData['sizechart_id']);
    _themeId = castToType<int>(snapshotData['theme_id']);
    _transactionId = castToType<int>(snapshotData['transaction_id']);
    _saleHistoryId = castToType<int>(snapshotData['sale_history_id']);
    _notificationId = castToType<int>(snapshotData['notification_id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('id_map');

  static Stream<IdMapRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IdMapRecord.fromSnapshot(s));

  static Future<IdMapRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IdMapRecord.fromSnapshot(s));

  static IdMapRecord fromSnapshot(DocumentSnapshot snapshot) => IdMapRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IdMapRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IdMapRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IdMapRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IdMapRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIdMapRecordData({
  String? type,
  int? userId,
  int? measurementId,
  int? relationId,
  int? addressId,
  int? cartId,
  int? cartItemId,
  int? wishlistId,
  int? wishlistItemId,
  int? userReferralId,
  int? designerRequestId,
  int? creatorRequestId,
  int? orderId,
  int? formId,
  int? membershipId,
  int? subscriptionId,
  int? reviewId,
  int? promotionId,
  int? preferencesId,
  int? designerId,
  int? creatorId,
  int? productId,
  int? roleId,
  int? permissionId,
  int? categoryId,
  int? tagId,
  int? brandId,
  int? attributeId,
  int? movementLogId,
  int? inventoryRequestId,
  int? inventoryId,
  int? enquiryId,
  int? deliveryId,
  int? deliveryPartnerId,
  int? vtoId,
  int? couponId,
  int? loyaltyHistoryId,
  int? skuId,
  int? sizechartId,
  int? themeId,
  int? transactionId,
  int? saleHistoryId,
  int? notificationId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'user_id': userId,
      'measurement_id': measurementId,
      'relation_id': relationId,
      'address_id': addressId,
      'cart_id': cartId,
      'cart_item_id': cartItemId,
      'wishlist_id': wishlistId,
      'wishlist_item_id': wishlistItemId,
      'user_referral_id': userReferralId,
      'designer_request_id': designerRequestId,
      'creator_request_id': creatorRequestId,
      'order_id': orderId,
      'form_id': formId,
      'membership_id': membershipId,
      'subscription_id': subscriptionId,
      'review_id': reviewId,
      'promotion_id': promotionId,
      'preferences_id': preferencesId,
      'designer_id': designerId,
      'creator_id': creatorId,
      'product_id': productId,
      'role_id': roleId,
      'permission_id': permissionId,
      'category_id': categoryId,
      'tag_id': tagId,
      'brand_id': brandId,
      'attribute_id': attributeId,
      'movement_log_id': movementLogId,
      'inventory_request_id': inventoryRequestId,
      'inventory_id': inventoryId,
      'enquiry_id': enquiryId,
      'delivery_id': deliveryId,
      'delivery_partner_id': deliveryPartnerId,
      'vto_id': vtoId,
      'coupon_id': couponId,
      'loyalty_history_id': loyaltyHistoryId,
      'sku_id': skuId,
      'sizechart_id': sizechartId,
      'theme_id': themeId,
      'transaction_id': transactionId,
      'sale_history_id': saleHistoryId,
      'notification_id': notificationId,
    }.withoutNulls,
  );

  return firestoreData;
}

class IdMapRecordDocumentEquality implements Equality<IdMapRecord> {
  const IdMapRecordDocumentEquality();

  @override
  bool equals(IdMapRecord? e1, IdMapRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.userId == e2?.userId &&
        e1?.measurementId == e2?.measurementId &&
        e1?.relationId == e2?.relationId &&
        e1?.addressId == e2?.addressId &&
        e1?.cartId == e2?.cartId &&
        e1?.cartItemId == e2?.cartItemId &&
        e1?.wishlistId == e2?.wishlistId &&
        e1?.wishlistItemId == e2?.wishlistItemId &&
        e1?.userReferralId == e2?.userReferralId &&
        e1?.designerRequestId == e2?.designerRequestId &&
        e1?.creatorRequestId == e2?.creatorRequestId &&
        e1?.orderId == e2?.orderId &&
        e1?.formId == e2?.formId &&
        e1?.membershipId == e2?.membershipId &&
        e1?.subscriptionId == e2?.subscriptionId &&
        e1?.reviewId == e2?.reviewId &&
        e1?.promotionId == e2?.promotionId &&
        e1?.preferencesId == e2?.preferencesId &&
        e1?.designerId == e2?.designerId &&
        e1?.creatorId == e2?.creatorId &&
        e1?.productId == e2?.productId &&
        e1?.roleId == e2?.roleId &&
        e1?.permissionId == e2?.permissionId &&
        e1?.categoryId == e2?.categoryId &&
        e1?.tagId == e2?.tagId &&
        e1?.brandId == e2?.brandId &&
        e1?.attributeId == e2?.attributeId &&
        e1?.movementLogId == e2?.movementLogId &&
        e1?.inventoryRequestId == e2?.inventoryRequestId &&
        e1?.inventoryId == e2?.inventoryId &&
        e1?.enquiryId == e2?.enquiryId &&
        e1?.deliveryId == e2?.deliveryId &&
        e1?.deliveryPartnerId == e2?.deliveryPartnerId &&
        e1?.vtoId == e2?.vtoId &&
        e1?.couponId == e2?.couponId &&
        e1?.loyaltyHistoryId == e2?.loyaltyHistoryId &&
        e1?.skuId == e2?.skuId &&
        e1?.sizechartId == e2?.sizechartId &&
        e1?.themeId == e2?.themeId &&
        e1?.transactionId == e2?.transactionId &&
        e1?.saleHistoryId == e2?.saleHistoryId &&
        e1?.notificationId == e2?.notificationId;
  }

  @override
  int hash(IdMapRecord? e) => const ListEquality().hash([
        e?.type,
        e?.userId,
        e?.measurementId,
        e?.relationId,
        e?.addressId,
        e?.cartId,
        e?.cartItemId,
        e?.wishlistId,
        e?.wishlistItemId,
        e?.userReferralId,
        e?.designerRequestId,
        e?.creatorRequestId,
        e?.orderId,
        e?.formId,
        e?.membershipId,
        e?.subscriptionId,
        e?.reviewId,
        e?.promotionId,
        e?.preferencesId,
        e?.designerId,
        e?.creatorId,
        e?.productId,
        e?.roleId,
        e?.permissionId,
        e?.categoryId,
        e?.tagId,
        e?.brandId,
        e?.attributeId,
        e?.movementLogId,
        e?.inventoryRequestId,
        e?.inventoryId,
        e?.enquiryId,
        e?.deliveryId,
        e?.deliveryPartnerId,
        e?.vtoId,
        e?.couponId,
        e?.loyaltyHistoryId,
        e?.skuId,
        e?.sizechartId,
        e?.themeId,
        e?.transactionId,
        e?.saleHistoryId,
        e?.notificationId
      ]);

  @override
  bool isValidKey(Object? o) => o is IdMapRecord;
}
