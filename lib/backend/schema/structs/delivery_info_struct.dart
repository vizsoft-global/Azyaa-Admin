// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeliveryInfoStruct extends FFFirebaseStruct {
  DeliveryInfoStruct({
    String? partnerId,
    String? deliveryId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? status,
    String? deliveryType,
    UserShippingaddressInfoStruct? pickupAddress,
    UserShippingaddressInfoStruct? deliveryAddress,
    DocumentReference? deliveryRef,
    String? deliveryTrackingId,
    List<String>? productIds,
    double? weightofItem,
    double? totalWeight,
    String? weightUnit,
    int? packageCount,
    DateTime? preferedDate,
    String? notes,
    String? pickupOtp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _partnerId = partnerId,
        _deliveryId = deliveryId,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _status = status,
        _deliveryType = deliveryType,
        _pickupAddress = pickupAddress,
        _deliveryAddress = deliveryAddress,
        _deliveryRef = deliveryRef,
        _deliveryTrackingId = deliveryTrackingId,
        _productIds = productIds,
        _weightofItem = weightofItem,
        _totalWeight = totalWeight,
        _weightUnit = weightUnit,
        _packageCount = packageCount,
        _preferedDate = preferedDate,
        _notes = notes,
        _pickupOtp = pickupOtp,
        super(firestoreUtilData);

  // "partner_id" field.
  String? _partnerId;
  String get partnerId => _partnerId ?? '';
  set partnerId(String? val) => _partnerId = val;

  bool hasPartnerId() => _partnerId != null;

  // "delivery_id" field.
  String? _deliveryId;
  String get deliveryId => _deliveryId ?? '';
  set deliveryId(String? val) => _deliveryId = val;

  bool hasDeliveryId() => _deliveryId != null;

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

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "delivery_type" field.
  String? _deliveryType;
  String get deliveryType => _deliveryType ?? '';
  set deliveryType(String? val) => _deliveryType = val;

  bool hasDeliveryType() => _deliveryType != null;

  // "pickup_address" field.
  UserShippingaddressInfoStruct? _pickupAddress;
  UserShippingaddressInfoStruct get pickupAddress =>
      _pickupAddress ?? UserShippingaddressInfoStruct();
  set pickupAddress(UserShippingaddressInfoStruct? val) => _pickupAddress = val;

  void updatePickupAddress(Function(UserShippingaddressInfoStruct) updateFn) {
    updateFn(_pickupAddress ??= UserShippingaddressInfoStruct());
  }

  bool hasPickupAddress() => _pickupAddress != null;

  // "delivery_address" field.
  UserShippingaddressInfoStruct? _deliveryAddress;
  UserShippingaddressInfoStruct get deliveryAddress =>
      _deliveryAddress ?? UserShippingaddressInfoStruct();
  set deliveryAddress(UserShippingaddressInfoStruct? val) =>
      _deliveryAddress = val;

  void updateDeliveryAddress(Function(UserShippingaddressInfoStruct) updateFn) {
    updateFn(_deliveryAddress ??= UserShippingaddressInfoStruct());
  }

  bool hasDeliveryAddress() => _deliveryAddress != null;

  // "delivery_ref" field.
  DocumentReference? _deliveryRef;
  DocumentReference? get deliveryRef => _deliveryRef;
  set deliveryRef(DocumentReference? val) => _deliveryRef = val;

  bool hasDeliveryRef() => _deliveryRef != null;

  // "delivery_tracking_id" field.
  String? _deliveryTrackingId;
  String get deliveryTrackingId => _deliveryTrackingId ?? '';
  set deliveryTrackingId(String? val) => _deliveryTrackingId = val;

  bool hasDeliveryTrackingId() => _deliveryTrackingId != null;

  // "product_ids" field.
  List<String>? _productIds;
  List<String> get productIds => _productIds ?? const [];
  set productIds(List<String>? val) => _productIds = val;

  void updateProductIds(Function(List<String>) updateFn) {
    updateFn(_productIds ??= []);
  }

  bool hasProductIds() => _productIds != null;

  // "weightofItem" field.
  double? _weightofItem;
  double get weightofItem => _weightofItem ?? 0.0;
  set weightofItem(double? val) => _weightofItem = val;

  void incrementWeightofItem(double amount) =>
      weightofItem = weightofItem + amount;

  bool hasWeightofItem() => _weightofItem != null;

  // "totalWeight" field.
  double? _totalWeight;
  double get totalWeight => _totalWeight ?? 0.0;
  set totalWeight(double? val) => _totalWeight = val;

  void incrementTotalWeight(double amount) =>
      totalWeight = totalWeight + amount;

  bool hasTotalWeight() => _totalWeight != null;

  // "weightUnit" field.
  String? _weightUnit;
  String get weightUnit => _weightUnit ?? '';
  set weightUnit(String? val) => _weightUnit = val;

  bool hasWeightUnit() => _weightUnit != null;

  // "packageCount" field.
  int? _packageCount;
  int get packageCount => _packageCount ?? 0;
  set packageCount(int? val) => _packageCount = val;

  void incrementPackageCount(int amount) =>
      packageCount = packageCount + amount;

  bool hasPackageCount() => _packageCount != null;

  // "preferedDate" field.
  DateTime? _preferedDate;
  DateTime? get preferedDate => _preferedDate;
  set preferedDate(DateTime? val) => _preferedDate = val;

  bool hasPreferedDate() => _preferedDate != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;

  bool hasNotes() => _notes != null;

  // "pickup_otp" field.
  String? _pickupOtp;
  String get pickupOtp => _pickupOtp ?? '';
  set pickupOtp(String? val) => _pickupOtp = val;

  bool hasPickupOtp() => _pickupOtp != null;

  static DeliveryInfoStruct fromMap(Map<String, dynamic> data) =>
      DeliveryInfoStruct(
        partnerId: data['partner_id'] as String?,
        deliveryId: data['delivery_id'] as String?,
        createdAt: data['created_at'] as DateTime?,
        updatedAt: data['updated_at'] as DateTime?,
        status: data['status'] as String?,
        deliveryType: data['delivery_type'] as String?,
        pickupAddress: data['pickup_address'] is UserShippingaddressInfoStruct
            ? data['pickup_address']
            : UserShippingaddressInfoStruct.maybeFromMap(
                data['pickup_address']),
        deliveryAddress:
            data['delivery_address'] is UserShippingaddressInfoStruct
                ? data['delivery_address']
                : UserShippingaddressInfoStruct.maybeFromMap(
                    data['delivery_address']),
        deliveryRef: data['delivery_ref'] as DocumentReference?,
        deliveryTrackingId: data['delivery_tracking_id'] as String?,
        productIds: getDataList(data['product_ids']),
        weightofItem: castToType<double>(data['weightofItem']),
        totalWeight: castToType<double>(data['totalWeight']),
        weightUnit: data['weightUnit'] as String?,
        packageCount: castToType<int>(data['packageCount']),
        preferedDate: data['preferedDate'] as DateTime?,
        notes: data['notes'] as String?,
        pickupOtp: data['pickup_otp'] as String?,
      );

  static DeliveryInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? DeliveryInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'partner_id': _partnerId,
        'delivery_id': _deliveryId,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'status': _status,
        'delivery_type': _deliveryType,
        'pickup_address': _pickupAddress?.toMap(),
        'delivery_address': _deliveryAddress?.toMap(),
        'delivery_ref': _deliveryRef,
        'delivery_tracking_id': _deliveryTrackingId,
        'product_ids': _productIds,
        'weightofItem': _weightofItem,
        'totalWeight': _totalWeight,
        'weightUnit': _weightUnit,
        'packageCount': _packageCount,
        'preferedDate': _preferedDate,
        'notes': _notes,
        'pickup_otp': _pickupOtp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'partner_id': serializeParam(
          _partnerId,
          ParamType.String,
        ),
        'delivery_id': serializeParam(
          _deliveryId,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'delivery_type': serializeParam(
          _deliveryType,
          ParamType.String,
        ),
        'pickup_address': serializeParam(
          _pickupAddress,
          ParamType.DataStruct,
        ),
        'delivery_address': serializeParam(
          _deliveryAddress,
          ParamType.DataStruct,
        ),
        'delivery_ref': serializeParam(
          _deliveryRef,
          ParamType.DocumentReference,
        ),
        'delivery_tracking_id': serializeParam(
          _deliveryTrackingId,
          ParamType.String,
        ),
        'product_ids': serializeParam(
          _productIds,
          ParamType.String,
          isList: true,
        ),
        'weightofItem': serializeParam(
          _weightofItem,
          ParamType.double,
        ),
        'totalWeight': serializeParam(
          _totalWeight,
          ParamType.double,
        ),
        'weightUnit': serializeParam(
          _weightUnit,
          ParamType.String,
        ),
        'packageCount': serializeParam(
          _packageCount,
          ParamType.int,
        ),
        'preferedDate': serializeParam(
          _preferedDate,
          ParamType.DateTime,
        ),
        'notes': serializeParam(
          _notes,
          ParamType.String,
        ),
        'pickup_otp': serializeParam(
          _pickupOtp,
          ParamType.String,
        ),
      }.withoutNulls;

  static DeliveryInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeliveryInfoStruct(
        partnerId: deserializeParam(
          data['partner_id'],
          ParamType.String,
          false,
        ),
        deliveryId: deserializeParam(
          data['delivery_id'],
          ParamType.String,
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
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        deliveryType: deserializeParam(
          data['delivery_type'],
          ParamType.String,
          false,
        ),
        pickupAddress: deserializeStructParam(
          data['pickup_address'],
          ParamType.DataStruct,
          false,
          structBuilder: UserShippingaddressInfoStruct.fromSerializableMap,
        ),
        deliveryAddress: deserializeStructParam(
          data['delivery_address'],
          ParamType.DataStruct,
          false,
          structBuilder: UserShippingaddressInfoStruct.fromSerializableMap,
        ),
        deliveryRef: deserializeParam(
          data['delivery_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['delivery'],
        ),
        deliveryTrackingId: deserializeParam(
          data['delivery_tracking_id'],
          ParamType.String,
          false,
        ),
        productIds: deserializeParam<String>(
          data['product_ids'],
          ParamType.String,
          true,
        ),
        weightofItem: deserializeParam(
          data['weightofItem'],
          ParamType.double,
          false,
        ),
        totalWeight: deserializeParam(
          data['totalWeight'],
          ParamType.double,
          false,
        ),
        weightUnit: deserializeParam(
          data['weightUnit'],
          ParamType.String,
          false,
        ),
        packageCount: deserializeParam(
          data['packageCount'],
          ParamType.int,
          false,
        ),
        preferedDate: deserializeParam(
          data['preferedDate'],
          ParamType.DateTime,
          false,
        ),
        notes: deserializeParam(
          data['notes'],
          ParamType.String,
          false,
        ),
        pickupOtp: deserializeParam(
          data['pickup_otp'],
          ParamType.String,
          false,
        ),
      );

  static DeliveryInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DeliveryInfoStruct(
        partnerId: convertAlgoliaParam(
          data['partner_id'],
          ParamType.String,
          false,
        ),
        deliveryId: convertAlgoliaParam(
          data['delivery_id'],
          ParamType.String,
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
        status: convertAlgoliaParam(
          data['status'],
          ParamType.String,
          false,
        ),
        deliveryType: convertAlgoliaParam(
          data['delivery_type'],
          ParamType.String,
          false,
        ),
        pickupAddress: convertAlgoliaParam(
          data['pickup_address'],
          ParamType.DataStruct,
          false,
          structBuilder: UserShippingaddressInfoStruct.fromAlgoliaData,
        ),
        deliveryAddress: convertAlgoliaParam(
          data['delivery_address'],
          ParamType.DataStruct,
          false,
          structBuilder: UserShippingaddressInfoStruct.fromAlgoliaData,
        ),
        deliveryRef: convertAlgoliaParam(
          data['delivery_ref'],
          ParamType.DocumentReference,
          false,
        ),
        deliveryTrackingId: convertAlgoliaParam(
          data['delivery_tracking_id'],
          ParamType.String,
          false,
        ),
        productIds: convertAlgoliaParam<String>(
          data['product_ids'],
          ParamType.String,
          true,
        ),
        weightofItem: convertAlgoliaParam(
          data['weightofItem'],
          ParamType.double,
          false,
        ),
        totalWeight: convertAlgoliaParam(
          data['totalWeight'],
          ParamType.double,
          false,
        ),
        weightUnit: convertAlgoliaParam(
          data['weightUnit'],
          ParamType.String,
          false,
        ),
        packageCount: convertAlgoliaParam(
          data['packageCount'],
          ParamType.int,
          false,
        ),
        preferedDate: convertAlgoliaParam(
          data['preferedDate'],
          ParamType.DateTime,
          false,
        ),
        notes: convertAlgoliaParam(
          data['notes'],
          ParamType.String,
          false,
        ),
        pickupOtp: convertAlgoliaParam(
          data['pickup_otp'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DeliveryInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DeliveryInfoStruct &&
        partnerId == other.partnerId &&
        deliveryId == other.deliveryId &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        status == other.status &&
        deliveryType == other.deliveryType &&
        pickupAddress == other.pickupAddress &&
        deliveryAddress == other.deliveryAddress &&
        deliveryRef == other.deliveryRef &&
        deliveryTrackingId == other.deliveryTrackingId &&
        listEquality.equals(productIds, other.productIds) &&
        weightofItem == other.weightofItem &&
        totalWeight == other.totalWeight &&
        weightUnit == other.weightUnit &&
        packageCount == other.packageCount &&
        preferedDate == other.preferedDate &&
        notes == other.notes &&
        pickupOtp == other.pickupOtp;
  }

  @override
  int get hashCode => const ListEquality().hash([
        partnerId,
        deliveryId,
        createdAt,
        updatedAt,
        status,
        deliveryType,
        pickupAddress,
        deliveryAddress,
        deliveryRef,
        deliveryTrackingId,
        productIds,
        weightofItem,
        totalWeight,
        weightUnit,
        packageCount,
        preferedDate,
        notes,
        pickupOtp,
      ]);
}

DeliveryInfoStruct createDeliveryInfoStruct({
  String? partnerId,
  String? deliveryId,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? status,
  String? deliveryType,
  UserShippingaddressInfoStruct? pickupAddress,
  UserShippingaddressInfoStruct? deliveryAddress,
  DocumentReference? deliveryRef,
  String? deliveryTrackingId,
  double? weightofItem,
  double? totalWeight,
  String? weightUnit,
  int? packageCount,
  DateTime? preferedDate,
  String? notes,
  String? pickupOtp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DeliveryInfoStruct(
      partnerId: partnerId,
      deliveryId: deliveryId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      status: status,
      deliveryType: deliveryType,
      pickupAddress: pickupAddress ??
          (clearUnsetFields ? UserShippingaddressInfoStruct() : null),
      deliveryAddress: deliveryAddress ??
          (clearUnsetFields ? UserShippingaddressInfoStruct() : null),
      deliveryRef: deliveryRef,
      deliveryTrackingId: deliveryTrackingId,
      weightofItem: weightofItem,
      totalWeight: totalWeight,
      weightUnit: weightUnit,
      packageCount: packageCount,
      preferedDate: preferedDate,
      notes: notes,
      pickupOtp: pickupOtp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DeliveryInfoStruct? updateDeliveryInfoStruct(
  DeliveryInfoStruct? deliveryInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    deliveryInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDeliveryInfoStructData(
  Map<String, dynamic> firestoreData,
  DeliveryInfoStruct? deliveryInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (deliveryInfo == null) {
    return;
  }
  if (deliveryInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && deliveryInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final deliveryInfoData =
      getDeliveryInfoFirestoreData(deliveryInfo, forFieldValue);
  final nestedData =
      deliveryInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = deliveryInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDeliveryInfoFirestoreData(
  DeliveryInfoStruct? deliveryInfo, [
  bool forFieldValue = false,
]) {
  if (deliveryInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(deliveryInfo.toMap());

  // Handle nested data for "pickup_address" field.
  addUserShippingaddressInfoStructData(
    firestoreData,
    deliveryInfo.hasPickupAddress() ? deliveryInfo.pickupAddress : null,
    'pickup_address',
    forFieldValue,
  );

  // Handle nested data for "delivery_address" field.
  addUserShippingaddressInfoStructData(
    firestoreData,
    deliveryInfo.hasDeliveryAddress() ? deliveryInfo.deliveryAddress : null,
    'delivery_address',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(deliveryInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDeliveryInfoListFirestoreData(
  List<DeliveryInfoStruct>? deliveryInfos,
) =>
    deliveryInfos?.map((e) => getDeliveryInfoFirestoreData(e, true)).toList() ??
    [];
