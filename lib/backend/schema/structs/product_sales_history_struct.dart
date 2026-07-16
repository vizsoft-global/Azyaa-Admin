// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductSalesHistoryStruct extends FFFirebaseStruct {
  ProductSalesHistoryStruct({
    DateTime? createdAt,
    String? orderId,
    int? quantity,
    SalesUserInfoStruct? salesUserInfo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdAt = createdAt,
        _orderId = orderId,
        _quantity = quantity,
        _salesUserInfo = salesUserInfo,
        super(firestoreUtilData);

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "order_id" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  set orderId(String? val) => _orderId = val;

  bool hasOrderId() => _orderId != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "sales_user_info" field.
  SalesUserInfoStruct? _salesUserInfo;
  SalesUserInfoStruct get salesUserInfo =>
      _salesUserInfo ?? SalesUserInfoStruct();
  set salesUserInfo(SalesUserInfoStruct? val) => _salesUserInfo = val;

  void updateSalesUserInfo(Function(SalesUserInfoStruct) updateFn) {
    updateFn(_salesUserInfo ??= SalesUserInfoStruct());
  }

  bool hasSalesUserInfo() => _salesUserInfo != null;

  static ProductSalesHistoryStruct fromMap(Map<String, dynamic> data) =>
      ProductSalesHistoryStruct(
        createdAt: data['created_at'] as DateTime?,
        orderId: data['order_id'] as String?,
        quantity: castToType<int>(data['quantity']),
        salesUserInfo: data['sales_user_info'] is SalesUserInfoStruct
            ? data['sales_user_info']
            : SalesUserInfoStruct.maybeFromMap(data['sales_user_info']),
      );

  static ProductSalesHistoryStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductSalesHistoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'created_at': _createdAt,
        'order_id': _orderId,
        'quantity': _quantity,
        'sales_user_info': _salesUserInfo?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'order_id': serializeParam(
          _orderId,
          ParamType.String,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'sales_user_info': serializeParam(
          _salesUserInfo,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ProductSalesHistoryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProductSalesHistoryStruct(
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        orderId: deserializeParam(
          data['order_id'],
          ParamType.String,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        salesUserInfo: deserializeStructParam(
          data['sales_user_info'],
          ParamType.DataStruct,
          false,
          structBuilder: SalesUserInfoStruct.fromSerializableMap,
        ),
      );

  static ProductSalesHistoryStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ProductSalesHistoryStruct(
        createdAt: convertAlgoliaParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        orderId: convertAlgoliaParam(
          data['order_id'],
          ParamType.String,
          false,
        ),
        quantity: convertAlgoliaParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        salesUserInfo: convertAlgoliaParam(
          data['sales_user_info'],
          ParamType.DataStruct,
          false,
          structBuilder: SalesUserInfoStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ProductSalesHistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductSalesHistoryStruct &&
        createdAt == other.createdAt &&
        orderId == other.orderId &&
        quantity == other.quantity &&
        salesUserInfo == other.salesUserInfo;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([createdAt, orderId, quantity, salesUserInfo]);
}

ProductSalesHistoryStruct createProductSalesHistoryStruct({
  DateTime? createdAt,
  String? orderId,
  int? quantity,
  SalesUserInfoStruct? salesUserInfo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductSalesHistoryStruct(
      createdAt: createdAt,
      orderId: orderId,
      quantity: quantity,
      salesUserInfo:
          salesUserInfo ?? (clearUnsetFields ? SalesUserInfoStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductSalesHistoryStruct? updateProductSalesHistoryStruct(
  ProductSalesHistoryStruct? productSalesHistory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productSalesHistory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductSalesHistoryStructData(
  Map<String, dynamic> firestoreData,
  ProductSalesHistoryStruct? productSalesHistory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productSalesHistory == null) {
    return;
  }
  if (productSalesHistory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productSalesHistory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productSalesHistoryData =
      getProductSalesHistoryFirestoreData(productSalesHistory, forFieldValue);
  final nestedData =
      productSalesHistoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      productSalesHistory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductSalesHistoryFirestoreData(
  ProductSalesHistoryStruct? productSalesHistory, [
  bool forFieldValue = false,
]) {
  if (productSalesHistory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productSalesHistory.toMap());

  // Handle nested data for "sales_user_info" field.
  addSalesUserInfoStructData(
    firestoreData,
    productSalesHistory.hasSalesUserInfo()
        ? productSalesHistory.salesUserInfo
        : null,
    'sales_user_info',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(productSalesHistory.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductSalesHistoryListFirestoreData(
  List<ProductSalesHistoryStruct>? productSalesHistorys,
) =>
    productSalesHistorys
        ?.map((e) => getProductSalesHistoryFirestoreData(e, true))
        .toList() ??
    [];
