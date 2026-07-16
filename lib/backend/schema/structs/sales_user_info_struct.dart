// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SalesUserInfoStruct extends FFFirebaseStruct {
  SalesUserInfoStruct({
    String? customerId,
    DocumentReference? customerRef,
    String? customerName,
    String? email,
    String? phoneNumber,
    UserShippingaddressStruct? shippingAddress,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _customerId = customerId,
        _customerRef = customerRef,
        _customerName = customerName,
        _email = email,
        _phoneNumber = phoneNumber,
        _shippingAddress = shippingAddress,
        super(firestoreUtilData);

  // "customer_id" field.
  String? _customerId;
  String get customerId => _customerId ?? '';
  set customerId(String? val) => _customerId = val;

  bool hasCustomerId() => _customerId != null;

  // "customer_ref" field.
  DocumentReference? _customerRef;
  DocumentReference? get customerRef => _customerRef;
  set customerRef(DocumentReference? val) => _customerRef = val;

  bool hasCustomerRef() => _customerRef != null;

  // "customer_name" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  set customerName(String? val) => _customerName = val;

  bool hasCustomerName() => _customerName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "shipping_address" field.
  UserShippingaddressStruct? _shippingAddress;
  UserShippingaddressStruct get shippingAddress =>
      _shippingAddress ?? UserShippingaddressStruct();
  set shippingAddress(UserShippingaddressStruct? val) => _shippingAddress = val;

  void updateShippingAddress(Function(UserShippingaddressStruct) updateFn) {
    updateFn(_shippingAddress ??= UserShippingaddressStruct());
  }

  bool hasShippingAddress() => _shippingAddress != null;

  static SalesUserInfoStruct fromMap(Map<String, dynamic> data) =>
      SalesUserInfoStruct(
        customerId: data['customer_id'] as String?,
        customerRef: data['customer_ref'] as DocumentReference?,
        customerName: data['customer_name'] as String?,
        email: data['email'] as String?,
        phoneNumber: data['phone_number'] as String?,
        shippingAddress: data['shipping_address'] is UserShippingaddressStruct
            ? data['shipping_address']
            : UserShippingaddressStruct.maybeFromMap(data['shipping_address']),
      );

  static SalesUserInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? SalesUserInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'customer_id': _customerId,
        'customer_ref': _customerRef,
        'customer_name': _customerName,
        'email': _email,
        'phone_number': _phoneNumber,
        'shipping_address': _shippingAddress?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'customer_id': serializeParam(
          _customerId,
          ParamType.String,
        ),
        'customer_ref': serializeParam(
          _customerRef,
          ParamType.DocumentReference,
        ),
        'customer_name': serializeParam(
          _customerName,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'shipping_address': serializeParam(
          _shippingAddress,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static SalesUserInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      SalesUserInfoStruct(
        customerId: deserializeParam(
          data['customer_id'],
          ParamType.String,
          false,
        ),
        customerRef: deserializeParam(
          data['customer_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        customerName: deserializeParam(
          data['customer_name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        shippingAddress: deserializeStructParam(
          data['shipping_address'],
          ParamType.DataStruct,
          false,
          structBuilder: UserShippingaddressStruct.fromSerializableMap,
        ),
      );

  static SalesUserInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SalesUserInfoStruct(
        customerId: convertAlgoliaParam(
          data['customer_id'],
          ParamType.String,
          false,
        ),
        customerRef: convertAlgoliaParam(
          data['customer_ref'],
          ParamType.DocumentReference,
          false,
        ),
        customerName: convertAlgoliaParam(
          data['customer_name'],
          ParamType.String,
          false,
        ),
        email: convertAlgoliaParam(
          data['email'],
          ParamType.String,
          false,
        ),
        phoneNumber: convertAlgoliaParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        shippingAddress: convertAlgoliaParam(
          data['shipping_address'],
          ParamType.DataStruct,
          false,
          structBuilder: UserShippingaddressStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SalesUserInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SalesUserInfoStruct &&
        customerId == other.customerId &&
        customerRef == other.customerRef &&
        customerName == other.customerName &&
        email == other.email &&
        phoneNumber == other.phoneNumber &&
        shippingAddress == other.shippingAddress;
  }

  @override
  int get hashCode => const ListEquality().hash([
        customerId,
        customerRef,
        customerName,
        email,
        phoneNumber,
        shippingAddress
      ]);
}

SalesUserInfoStruct createSalesUserInfoStruct({
  String? customerId,
  DocumentReference? customerRef,
  String? customerName,
  String? email,
  String? phoneNumber,
  UserShippingaddressStruct? shippingAddress,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SalesUserInfoStruct(
      customerId: customerId,
      customerRef: customerRef,
      customerName: customerName,
      email: email,
      phoneNumber: phoneNumber,
      shippingAddress: shippingAddress ??
          (clearUnsetFields ? UserShippingaddressStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SalesUserInfoStruct? updateSalesUserInfoStruct(
  SalesUserInfoStruct? salesUserInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    salesUserInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSalesUserInfoStructData(
  Map<String, dynamic> firestoreData,
  SalesUserInfoStruct? salesUserInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (salesUserInfo == null) {
    return;
  }
  if (salesUserInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && salesUserInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final salesUserInfoData =
      getSalesUserInfoFirestoreData(salesUserInfo, forFieldValue);
  final nestedData =
      salesUserInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = salesUserInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSalesUserInfoFirestoreData(
  SalesUserInfoStruct? salesUserInfo, [
  bool forFieldValue = false,
]) {
  if (salesUserInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(salesUserInfo.toMap());

  // Handle nested data for "shipping_address" field.
  addUserShippingaddressStructData(
    firestoreData,
    salesUserInfo.hasShippingAddress() ? salesUserInfo.shippingAddress : null,
    'shipping_address',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(salesUserInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSalesUserInfoListFirestoreData(
  List<SalesUserInfoStruct>? salesUserInfos,
) =>
    salesUserInfos
        ?.map((e) => getSalesUserInfoFirestoreData(e, true))
        .toList() ??
    [];
