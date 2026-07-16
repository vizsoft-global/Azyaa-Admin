// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromotionMarketingStruct extends FFFirebaseStruct {
  PromotionMarketingStruct({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? promotionId,
    DocumentReference? creatorRef,
    int? numberOfSales,
    List<DocumentReference>? orderRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdAt = createdAt,
        _updatedAt = updatedAt,
        _promotionId = promotionId,
        _creatorRef = creatorRef,
        _numberOfSales = numberOfSales,
        _orderRef = orderRef,
        super(firestoreUtilData);

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

  // "promotion_id" field.
  String? _promotionId;
  String get promotionId => _promotionId ?? '';
  set promotionId(String? val) => _promotionId = val;

  bool hasPromotionId() => _promotionId != null;

  // "creator_ref" field.
  DocumentReference? _creatorRef;
  DocumentReference? get creatorRef => _creatorRef;
  set creatorRef(DocumentReference? val) => _creatorRef = val;

  bool hasCreatorRef() => _creatorRef != null;

  // "number_of_sales" field.
  int? _numberOfSales;
  int get numberOfSales => _numberOfSales ?? 0;
  set numberOfSales(int? val) => _numberOfSales = val;

  void incrementNumberOfSales(int amount) =>
      numberOfSales = numberOfSales + amount;

  bool hasNumberOfSales() => _numberOfSales != null;

  // "order_ref" field.
  List<DocumentReference>? _orderRef;
  List<DocumentReference> get orderRef => _orderRef ?? const [];
  set orderRef(List<DocumentReference>? val) => _orderRef = val;

  void updateOrderRef(Function(List<DocumentReference>) updateFn) {
    updateFn(_orderRef ??= []);
  }

  bool hasOrderRef() => _orderRef != null;

  static PromotionMarketingStruct fromMap(Map<String, dynamic> data) =>
      PromotionMarketingStruct(
        createdAt: data['created_at'] as DateTime?,
        updatedAt: data['updated_at'] as DateTime?,
        promotionId: data['promotion_id'] as String?,
        creatorRef: data['creator_ref'] as DocumentReference?,
        numberOfSales: castToType<int>(data['number_of_sales']),
        orderRef: getDataList(data['order_ref']),
      );

  static PromotionMarketingStruct? maybeFromMap(dynamic data) => data is Map
      ? PromotionMarketingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'promotion_id': _promotionId,
        'creator_ref': _creatorRef,
        'number_of_sales': _numberOfSales,
        'order_ref': _orderRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'promotion_id': serializeParam(
          _promotionId,
          ParamType.String,
        ),
        'creator_ref': serializeParam(
          _creatorRef,
          ParamType.DocumentReference,
        ),
        'number_of_sales': serializeParam(
          _numberOfSales,
          ParamType.int,
        ),
        'order_ref': serializeParam(
          _orderRef,
          ParamType.DocumentReference,
          isList: true,
        ),
      }.withoutNulls;

  static PromotionMarketingStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PromotionMarketingStruct(
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
        promotionId: deserializeParam(
          data['promotion_id'],
          ParamType.String,
          false,
        ),
        creatorRef: deserializeParam(
          data['creator_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        numberOfSales: deserializeParam(
          data['number_of_sales'],
          ParamType.int,
          false,
        ),
        orderRef: deserializeParam<DocumentReference>(
          data['order_ref'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['orders'],
        ),
      );

  static PromotionMarketingStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PromotionMarketingStruct(
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
        promotionId: convertAlgoliaParam(
          data['promotion_id'],
          ParamType.String,
          false,
        ),
        creatorRef: convertAlgoliaParam(
          data['creator_ref'],
          ParamType.DocumentReference,
          false,
        ),
        numberOfSales: convertAlgoliaParam(
          data['number_of_sales'],
          ParamType.int,
          false,
        ),
        orderRef: convertAlgoliaParam<DocumentReference>(
          data['order_ref'],
          ParamType.DocumentReference,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PromotionMarketingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PromotionMarketingStruct &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        promotionId == other.promotionId &&
        creatorRef == other.creatorRef &&
        numberOfSales == other.numberOfSales &&
        listEquality.equals(orderRef, other.orderRef);
  }

  @override
  int get hashCode => const ListEquality().hash(
      [createdAt, updatedAt, promotionId, creatorRef, numberOfSales, orderRef]);
}

PromotionMarketingStruct createPromotionMarketingStruct({
  DateTime? createdAt,
  DateTime? updatedAt,
  String? promotionId,
  DocumentReference? creatorRef,
  int? numberOfSales,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PromotionMarketingStruct(
      createdAt: createdAt,
      updatedAt: updatedAt,
      promotionId: promotionId,
      creatorRef: creatorRef,
      numberOfSales: numberOfSales,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PromotionMarketingStruct? updatePromotionMarketingStruct(
  PromotionMarketingStruct? promotionMarketing, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    promotionMarketing
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPromotionMarketingStructData(
  Map<String, dynamic> firestoreData,
  PromotionMarketingStruct? promotionMarketing,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (promotionMarketing == null) {
    return;
  }
  if (promotionMarketing.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && promotionMarketing.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final promotionMarketingData =
      getPromotionMarketingFirestoreData(promotionMarketing, forFieldValue);
  final nestedData =
      promotionMarketingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      promotionMarketing.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPromotionMarketingFirestoreData(
  PromotionMarketingStruct? promotionMarketing, [
  bool forFieldValue = false,
]) {
  if (promotionMarketing == null) {
    return {};
  }
  final firestoreData = mapToFirestore(promotionMarketing.toMap());

  // Add any Firestore field values
  mapToFirestore(promotionMarketing.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPromotionMarketingListFirestoreData(
  List<PromotionMarketingStruct>? promotionMarketings,
) =>
    promotionMarketings
        ?.map((e) => getPromotionMarketingFirestoreData(e, true))
        .toList() ??
    [];
