// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SaleInfoStruct extends FFFirebaseStruct {
  SaleInfoStruct({
    DateTime? saleDate,
    double? saleAmount,
    int? saleQuantity,
    String? saleProductId,
    DocumentReference? saleProductRef,
    String? salePromotionId,
    bool? saleWaitingPeriod,
    bool? salePayoutStatus,
    String? saleOrderStatus,
    String? saleOrderId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _saleDate = saleDate,
        _saleAmount = saleAmount,
        _saleQuantity = saleQuantity,
        _saleProductId = saleProductId,
        _saleProductRef = saleProductRef,
        _salePromotionId = salePromotionId,
        _saleWaitingPeriod = saleWaitingPeriod,
        _salePayoutStatus = salePayoutStatus,
        _saleOrderStatus = saleOrderStatus,
        _saleOrderId = saleOrderId,
        super(firestoreUtilData);

  // "sale_date" field.
  DateTime? _saleDate;
  DateTime? get saleDate => _saleDate;
  set saleDate(DateTime? val) => _saleDate = val;

  bool hasSaleDate() => _saleDate != null;

  // "sale_amount" field.
  double? _saleAmount;
  double get saleAmount => _saleAmount ?? 0.0;
  set saleAmount(double? val) => _saleAmount = val;

  void incrementSaleAmount(double amount) => saleAmount = saleAmount + amount;

  bool hasSaleAmount() => _saleAmount != null;

  // "sale_quantity" field.
  int? _saleQuantity;
  int get saleQuantity => _saleQuantity ?? 0;
  set saleQuantity(int? val) => _saleQuantity = val;

  void incrementSaleQuantity(int amount) =>
      saleQuantity = saleQuantity + amount;

  bool hasSaleQuantity() => _saleQuantity != null;

  // "sale_product_id" field.
  String? _saleProductId;
  String get saleProductId => _saleProductId ?? '';
  set saleProductId(String? val) => _saleProductId = val;

  bool hasSaleProductId() => _saleProductId != null;

  // "sale_product_ref" field.
  DocumentReference? _saleProductRef;
  DocumentReference? get saleProductRef => _saleProductRef;
  set saleProductRef(DocumentReference? val) => _saleProductRef = val;

  bool hasSaleProductRef() => _saleProductRef != null;

  // "sale_promotion_id" field.
  String? _salePromotionId;
  String get salePromotionId => _salePromotionId ?? '';
  set salePromotionId(String? val) => _salePromotionId = val;

  bool hasSalePromotionId() => _salePromotionId != null;

  // "sale_waiting_period" field.
  bool? _saleWaitingPeriod;
  bool get saleWaitingPeriod => _saleWaitingPeriod ?? false;
  set saleWaitingPeriod(bool? val) => _saleWaitingPeriod = val;

  bool hasSaleWaitingPeriod() => _saleWaitingPeriod != null;

  // "sale_payout_status" field.
  bool? _salePayoutStatus;
  bool get salePayoutStatus => _salePayoutStatus ?? false;
  set salePayoutStatus(bool? val) => _salePayoutStatus = val;

  bool hasSalePayoutStatus() => _salePayoutStatus != null;

  // "sale_order_status" field.
  String? _saleOrderStatus;
  String get saleOrderStatus => _saleOrderStatus ?? '';
  set saleOrderStatus(String? val) => _saleOrderStatus = val;

  bool hasSaleOrderStatus() => _saleOrderStatus != null;

  // "sale_order_id" field.
  String? _saleOrderId;
  String get saleOrderId => _saleOrderId ?? '';
  set saleOrderId(String? val) => _saleOrderId = val;

  bool hasSaleOrderId() => _saleOrderId != null;

  static SaleInfoStruct fromMap(Map<String, dynamic> data) => SaleInfoStruct(
        saleDate: data['sale_date'] as DateTime?,
        saleAmount: castToType<double>(data['sale_amount']),
        saleQuantity: castToType<int>(data['sale_quantity']),
        saleProductId: data['sale_product_id'] as String?,
        saleProductRef: data['sale_product_ref'] as DocumentReference?,
        salePromotionId: data['sale_promotion_id'] as String?,
        saleWaitingPeriod: data['sale_waiting_period'] as bool?,
        salePayoutStatus: data['sale_payout_status'] as bool?,
        saleOrderStatus: data['sale_order_status'] as String?,
        saleOrderId: data['sale_order_id'] as String?,
      );

  static SaleInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? SaleInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'sale_date': _saleDate,
        'sale_amount': _saleAmount,
        'sale_quantity': _saleQuantity,
        'sale_product_id': _saleProductId,
        'sale_product_ref': _saleProductRef,
        'sale_promotion_id': _salePromotionId,
        'sale_waiting_period': _saleWaitingPeriod,
        'sale_payout_status': _salePayoutStatus,
        'sale_order_status': _saleOrderStatus,
        'sale_order_id': _saleOrderId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sale_date': serializeParam(
          _saleDate,
          ParamType.DateTime,
        ),
        'sale_amount': serializeParam(
          _saleAmount,
          ParamType.double,
        ),
        'sale_quantity': serializeParam(
          _saleQuantity,
          ParamType.int,
        ),
        'sale_product_id': serializeParam(
          _saleProductId,
          ParamType.String,
        ),
        'sale_product_ref': serializeParam(
          _saleProductRef,
          ParamType.DocumentReference,
        ),
        'sale_promotion_id': serializeParam(
          _salePromotionId,
          ParamType.String,
        ),
        'sale_waiting_period': serializeParam(
          _saleWaitingPeriod,
          ParamType.bool,
        ),
        'sale_payout_status': serializeParam(
          _salePayoutStatus,
          ParamType.bool,
        ),
        'sale_order_status': serializeParam(
          _saleOrderStatus,
          ParamType.String,
        ),
        'sale_order_id': serializeParam(
          _saleOrderId,
          ParamType.String,
        ),
      }.withoutNulls;

  static SaleInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      SaleInfoStruct(
        saleDate: deserializeParam(
          data['sale_date'],
          ParamType.DateTime,
          false,
        ),
        saleAmount: deserializeParam(
          data['sale_amount'],
          ParamType.double,
          false,
        ),
        saleQuantity: deserializeParam(
          data['sale_quantity'],
          ParamType.int,
          false,
        ),
        saleProductId: deserializeParam(
          data['sale_product_id'],
          ParamType.String,
          false,
        ),
        saleProductRef: deserializeParam(
          data['sale_product_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['products'],
        ),
        salePromotionId: deserializeParam(
          data['sale_promotion_id'],
          ParamType.String,
          false,
        ),
        saleWaitingPeriod: deserializeParam(
          data['sale_waiting_period'],
          ParamType.bool,
          false,
        ),
        salePayoutStatus: deserializeParam(
          data['sale_payout_status'],
          ParamType.bool,
          false,
        ),
        saleOrderStatus: deserializeParam(
          data['sale_order_status'],
          ParamType.String,
          false,
        ),
        saleOrderId: deserializeParam(
          data['sale_order_id'],
          ParamType.String,
          false,
        ),
      );

  static SaleInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SaleInfoStruct(
        saleDate: convertAlgoliaParam(
          data['sale_date'],
          ParamType.DateTime,
          false,
        ),
        saleAmount: convertAlgoliaParam(
          data['sale_amount'],
          ParamType.double,
          false,
        ),
        saleQuantity: convertAlgoliaParam(
          data['sale_quantity'],
          ParamType.int,
          false,
        ),
        saleProductId: convertAlgoliaParam(
          data['sale_product_id'],
          ParamType.String,
          false,
        ),
        saleProductRef: convertAlgoliaParam(
          data['sale_product_ref'],
          ParamType.DocumentReference,
          false,
        ),
        salePromotionId: convertAlgoliaParam(
          data['sale_promotion_id'],
          ParamType.String,
          false,
        ),
        saleWaitingPeriod: convertAlgoliaParam(
          data['sale_waiting_period'],
          ParamType.bool,
          false,
        ),
        salePayoutStatus: convertAlgoliaParam(
          data['sale_payout_status'],
          ParamType.bool,
          false,
        ),
        saleOrderStatus: convertAlgoliaParam(
          data['sale_order_status'],
          ParamType.String,
          false,
        ),
        saleOrderId: convertAlgoliaParam(
          data['sale_order_id'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SaleInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SaleInfoStruct &&
        saleDate == other.saleDate &&
        saleAmount == other.saleAmount &&
        saleQuantity == other.saleQuantity &&
        saleProductId == other.saleProductId &&
        saleProductRef == other.saleProductRef &&
        salePromotionId == other.salePromotionId &&
        saleWaitingPeriod == other.saleWaitingPeriod &&
        salePayoutStatus == other.salePayoutStatus &&
        saleOrderStatus == other.saleOrderStatus &&
        saleOrderId == other.saleOrderId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        saleDate,
        saleAmount,
        saleQuantity,
        saleProductId,
        saleProductRef,
        salePromotionId,
        saleWaitingPeriod,
        salePayoutStatus,
        saleOrderStatus,
        saleOrderId
      ]);
}

SaleInfoStruct createSaleInfoStruct({
  DateTime? saleDate,
  double? saleAmount,
  int? saleQuantity,
  String? saleProductId,
  DocumentReference? saleProductRef,
  String? salePromotionId,
  bool? saleWaitingPeriod,
  bool? salePayoutStatus,
  String? saleOrderStatus,
  String? saleOrderId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SaleInfoStruct(
      saleDate: saleDate,
      saleAmount: saleAmount,
      saleQuantity: saleQuantity,
      saleProductId: saleProductId,
      saleProductRef: saleProductRef,
      salePromotionId: salePromotionId,
      saleWaitingPeriod: saleWaitingPeriod,
      salePayoutStatus: salePayoutStatus,
      saleOrderStatus: saleOrderStatus,
      saleOrderId: saleOrderId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SaleInfoStruct? updateSaleInfoStruct(
  SaleInfoStruct? saleInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    saleInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSaleInfoStructData(
  Map<String, dynamic> firestoreData,
  SaleInfoStruct? saleInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (saleInfo == null) {
    return;
  }
  if (saleInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && saleInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final saleInfoData = getSaleInfoFirestoreData(saleInfo, forFieldValue);
  final nestedData = saleInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = saleInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSaleInfoFirestoreData(
  SaleInfoStruct? saleInfo, [
  bool forFieldValue = false,
]) {
  if (saleInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(saleInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(saleInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSaleInfoListFirestoreData(
  List<SaleInfoStruct>? saleInfos,
) =>
    saleInfos?.map((e) => getSaleInfoFirestoreData(e, true)).toList() ?? [];
