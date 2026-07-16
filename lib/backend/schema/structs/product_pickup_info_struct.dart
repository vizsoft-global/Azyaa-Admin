// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductPickupInfoStruct extends FFFirebaseStruct {
  ProductPickupInfoStruct({
    DateTime? createdAt,
    String? status,
    String? deliveryId,
    String? deliveryTrackingId,
    UserShippingaddressInfoStruct? pickupAddress,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdAt = createdAt,
        _status = status,
        _deliveryId = deliveryId,
        _deliveryTrackingId = deliveryTrackingId,
        _pickupAddress = pickupAddress,
        super(firestoreUtilData);

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "delivery_id" field.
  String? _deliveryId;
  String get deliveryId => _deliveryId ?? '';
  set deliveryId(String? val) => _deliveryId = val;

  bool hasDeliveryId() => _deliveryId != null;

  // "delivery_tracking_id" field.
  String? _deliveryTrackingId;
  String get deliveryTrackingId => _deliveryTrackingId ?? '';
  set deliveryTrackingId(String? val) => _deliveryTrackingId = val;

  bool hasDeliveryTrackingId() => _deliveryTrackingId != null;

  // "pickup_address" field.
  UserShippingaddressInfoStruct? _pickupAddress;
  UserShippingaddressInfoStruct get pickupAddress =>
      _pickupAddress ?? UserShippingaddressInfoStruct();
  set pickupAddress(UserShippingaddressInfoStruct? val) => _pickupAddress = val;

  void updatePickupAddress(Function(UserShippingaddressInfoStruct) updateFn) {
    updateFn(_pickupAddress ??= UserShippingaddressInfoStruct());
  }

  bool hasPickupAddress() => _pickupAddress != null;

  static ProductPickupInfoStruct fromMap(Map<String, dynamic> data) =>
      ProductPickupInfoStruct(
        createdAt: data['created_at'] as DateTime?,
        status: data['status'] as String?,
        deliveryId: data['delivery_id'] as String?,
        deliveryTrackingId: data['delivery_tracking_id'] as String?,
        pickupAddress: data['pickup_address'] is UserShippingaddressInfoStruct
            ? data['pickup_address']
            : UserShippingaddressInfoStruct.maybeFromMap(
                data['pickup_address']),
      );

  static ProductPickupInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductPickupInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'created_at': _createdAt,
        'status': _status,
        'delivery_id': _deliveryId,
        'delivery_tracking_id': _deliveryTrackingId,
        'pickup_address': _pickupAddress?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'delivery_id': serializeParam(
          _deliveryId,
          ParamType.String,
        ),
        'delivery_tracking_id': serializeParam(
          _deliveryTrackingId,
          ParamType.String,
        ),
        'pickup_address': serializeParam(
          _pickupAddress,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ProductPickupInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProductPickupInfoStruct(
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        deliveryId: deserializeParam(
          data['delivery_id'],
          ParamType.String,
          false,
        ),
        deliveryTrackingId: deserializeParam(
          data['delivery_tracking_id'],
          ParamType.String,
          false,
        ),
        pickupAddress: deserializeStructParam(
          data['pickup_address'],
          ParamType.DataStruct,
          false,
          structBuilder: UserShippingaddressInfoStruct.fromSerializableMap,
        ),
      );

  static ProductPickupInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ProductPickupInfoStruct(
        createdAt: convertAlgoliaParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        status: convertAlgoliaParam(
          data['status'],
          ParamType.String,
          false,
        ),
        deliveryId: convertAlgoliaParam(
          data['delivery_id'],
          ParamType.String,
          false,
        ),
        deliveryTrackingId: convertAlgoliaParam(
          data['delivery_tracking_id'],
          ParamType.String,
          false,
        ),
        pickupAddress: convertAlgoliaParam(
          data['pickup_address'],
          ParamType.DataStruct,
          false,
          structBuilder: UserShippingaddressInfoStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ProductPickupInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductPickupInfoStruct &&
        createdAt == other.createdAt &&
        status == other.status &&
        deliveryId == other.deliveryId &&
        deliveryTrackingId == other.deliveryTrackingId &&
        pickupAddress == other.pickupAddress;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([createdAt, status, deliveryId, deliveryTrackingId, pickupAddress]);
}

ProductPickupInfoStruct createProductPickupInfoStruct({
  DateTime? createdAt,
  String? status,
  String? deliveryId,
  String? deliveryTrackingId,
  UserShippingaddressInfoStruct? pickupAddress,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductPickupInfoStruct(
      createdAt: createdAt,
      status: status,
      deliveryId: deliveryId,
      deliveryTrackingId: deliveryTrackingId,
      pickupAddress: pickupAddress ??
          (clearUnsetFields ? UserShippingaddressInfoStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductPickupInfoStruct? updateProductPickupInfoStruct(
  ProductPickupInfoStruct? productPickupInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productPickupInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductPickupInfoStructData(
  Map<String, dynamic> firestoreData,
  ProductPickupInfoStruct? productPickupInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productPickupInfo == null) {
    return;
  }
  if (productPickupInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productPickupInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productPickupInfoData =
      getProductPickupInfoFirestoreData(productPickupInfo, forFieldValue);
  final nestedData =
      productPickupInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productPickupInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductPickupInfoFirestoreData(
  ProductPickupInfoStruct? productPickupInfo, [
  bool forFieldValue = false,
]) {
  if (productPickupInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productPickupInfo.toMap());

  // Handle nested data for "pickup_address" field.
  addUserShippingaddressInfoStructData(
    firestoreData,
    productPickupInfo.hasPickupAddress()
        ? productPickupInfo.pickupAddress
        : null,
    'pickup_address',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(productPickupInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductPickupInfoListFirestoreData(
  List<ProductPickupInfoStruct>? productPickupInfos,
) =>
    productPickupInfos
        ?.map((e) => getProductPickupInfoFirestoreData(e, true))
        .toList() ??
    [];
