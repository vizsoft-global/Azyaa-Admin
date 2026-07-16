// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCartStruct extends FFFirebaseStruct {
  UserCartStruct({
    int? cartId,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<UserCartItemsStruct>? cartItems,
    double? subtotal,
    double? total,
    UserCartDiscountsStruct? discounts,
    CouponCartInfoStruct? couponInfo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cartId = cartId,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _cartItems = cartItems,
        _subtotal = subtotal,
        _total = total,
        _discounts = discounts,
        _couponInfo = couponInfo,
        super(firestoreUtilData);

  // "cart_id" field.
  int? _cartId;
  int get cartId => _cartId ?? 0;
  set cartId(int? val) => _cartId = val;

  void incrementCartId(int amount) => cartId = cartId + amount;

  bool hasCartId() => _cartId != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "cart_items" field.
  List<UserCartItemsStruct>? _cartItems;
  List<UserCartItemsStruct> get cartItems => _cartItems ?? const [];
  set cartItems(List<UserCartItemsStruct>? val) => _cartItems = val;

  void updateCartItems(Function(List<UserCartItemsStruct>) updateFn) {
    updateFn(_cartItems ??= []);
  }

  bool hasCartItems() => _cartItems != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  set subtotal(double? val) => _subtotal = val;

  void incrementSubtotal(double amount) => subtotal = subtotal + amount;

  bool hasSubtotal() => _subtotal != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "discounts" field.
  UserCartDiscountsStruct? _discounts;
  UserCartDiscountsStruct get discounts =>
      _discounts ?? UserCartDiscountsStruct();
  set discounts(UserCartDiscountsStruct? val) => _discounts = val;

  void updateDiscounts(Function(UserCartDiscountsStruct) updateFn) {
    updateFn(_discounts ??= UserCartDiscountsStruct());
  }

  bool hasDiscounts() => _discounts != null;

  // "coupon_info" field.
  CouponCartInfoStruct? _couponInfo;
  CouponCartInfoStruct get couponInfo => _couponInfo ?? CouponCartInfoStruct();
  set couponInfo(CouponCartInfoStruct? val) => _couponInfo = val;

  void updateCouponInfo(Function(CouponCartInfoStruct) updateFn) {
    updateFn(_couponInfo ??= CouponCartInfoStruct());
  }

  bool hasCouponInfo() => _couponInfo != null;

  static UserCartStruct fromMap(Map<String, dynamic> data) => UserCartStruct(
        cartId: castToType<int>(data['cart_id']),
        createdAt: data['created_at'] as DateTime?,
        updatedAt: data['updated_at'] as DateTime?,
        cartItems: getStructList(
          data['cart_items'],
          UserCartItemsStruct.fromMap,
        ),
        subtotal: castToType<double>(data['subtotal']),
        total: castToType<double>(data['total']),
        discounts: data['discounts'] is UserCartDiscountsStruct
            ? data['discounts']
            : UserCartDiscountsStruct.maybeFromMap(data['discounts']),
        couponInfo: data['coupon_info'] is CouponCartInfoStruct
            ? data['coupon_info']
            : CouponCartInfoStruct.maybeFromMap(data['coupon_info']),
      );

  static UserCartStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserCartStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'cart_id': _cartId,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'cart_items': _cartItems?.map((e) => e.toMap()).toList(),
        'subtotal': _subtotal,
        'total': _total,
        'discounts': _discounts?.toMap(),
        'coupon_info': _couponInfo?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cart_id': serializeParam(
          _cartId,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'cart_items': serializeParam(
          _cartItems,
          ParamType.DataStruct,
          isList: true,
        ),
        'subtotal': serializeParam(
          _subtotal,
          ParamType.double,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'discounts': serializeParam(
          _discounts,
          ParamType.DataStruct,
        ),
        'coupon_info': serializeParam(
          _couponInfo,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static UserCartStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserCartStruct(
        cartId: deserializeParam(
          data['cart_id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        cartItems: deserializeStructParam<UserCartItemsStruct>(
          data['cart_items'],
          ParamType.DataStruct,
          true,
          structBuilder: UserCartItemsStruct.fromSerializableMap,
        ),
        subtotal: deserializeParam(
          data['subtotal'],
          ParamType.double,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        discounts: deserializeStructParam(
          data['discounts'],
          ParamType.DataStruct,
          false,
          structBuilder: UserCartDiscountsStruct.fromSerializableMap,
        ),
        couponInfo: deserializeStructParam(
          data['coupon_info'],
          ParamType.DataStruct,
          false,
          structBuilder: CouponCartInfoStruct.fromSerializableMap,
        ),
      );

  static UserCartStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserCartStruct(
        cartId: convertAlgoliaParam(
          data['cart_id'],
          ParamType.int,
          false,
        ),
        createdAt: convertAlgoliaParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: convertAlgoliaParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        cartItems: convertAlgoliaParam<UserCartItemsStruct>(
          data['cart_items'],
          ParamType.DataStruct,
          true,
          structBuilder: UserCartItemsStruct.fromAlgoliaData,
        ),
        subtotal: convertAlgoliaParam(
          data['subtotal'],
          ParamType.double,
          false,
        ),
        total: convertAlgoliaParam(
          data['total'],
          ParamType.double,
          false,
        ),
        discounts: convertAlgoliaParam(
          data['discounts'],
          ParamType.DataStruct,
          false,
          structBuilder: UserCartDiscountsStruct.fromAlgoliaData,
        ),
        couponInfo: convertAlgoliaParam(
          data['coupon_info'],
          ParamType.DataStruct,
          false,
          structBuilder: CouponCartInfoStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserCartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserCartStruct &&
        cartId == other.cartId &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        listEquality.equals(cartItems, other.cartItems) &&
        subtotal == other.subtotal &&
        total == other.total &&
        discounts == other.discounts &&
        couponInfo == other.couponInfo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        cartId,
        createdAt,
        updatedAt,
        cartItems,
        subtotal,
        total,
        discounts,
        couponInfo
      ]);
}

UserCartStruct createUserCartStruct({
  int? cartId,
  DateTime? createdAt,
  DateTime? updatedAt,
  double? subtotal,
  double? total,
  UserCartDiscountsStruct? discounts,
  CouponCartInfoStruct? couponInfo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserCartStruct(
      cartId: cartId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      subtotal: subtotal,
      total: total,
      discounts:
          discounts ?? (clearUnsetFields ? UserCartDiscountsStruct() : null),
      couponInfo:
          couponInfo ?? (clearUnsetFields ? CouponCartInfoStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserCartStruct? updateUserCartStruct(
  UserCartStruct? userCart, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userCart
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserCartStructData(
  Map<String, dynamic> firestoreData,
  UserCartStruct? userCart,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userCart == null) {
    return;
  }
  if (userCart.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userCart.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userCartData = getUserCartFirestoreData(userCart, forFieldValue);
  final nestedData = userCartData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userCart.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserCartFirestoreData(
  UserCartStruct? userCart, [
  bool forFieldValue = false,
]) {
  if (userCart == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userCart.toMap());

  // Handle nested data for "discounts" field.
  addUserCartDiscountsStructData(
    firestoreData,
    userCart.hasDiscounts() ? userCart.discounts : null,
    'discounts',
    forFieldValue,
  );

  // Handle nested data for "coupon_info" field.
  addCouponCartInfoStructData(
    firestoreData,
    userCart.hasCouponInfo() ? userCart.couponInfo : null,
    'coupon_info',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(userCart.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserCartListFirestoreData(
  List<UserCartStruct>? userCarts,
) =>
    userCarts?.map((e) => getUserCartFirestoreData(e, true)).toList() ?? [];
