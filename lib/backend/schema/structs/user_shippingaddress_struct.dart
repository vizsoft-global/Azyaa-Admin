// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserShippingaddressStruct extends FFFirebaseStruct {
  UserShippingaddressStruct({
    int? relationId,
    String? userName,
    String? relationName,
    UserShippingaddressInfoStruct? shippingAddressInfo,
    bool? isDefault,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _relationId = relationId,
        _userName = userName,
        _relationName = relationName,
        _shippingAddressInfo = shippingAddressInfo,
        _isDefault = isDefault,
        super(firestoreUtilData);

  // "relation_id" field.
  int? _relationId;
  int get relationId => _relationId ?? 0;
  set relationId(int? val) => _relationId = val;

  void incrementRelationId(int amount) => relationId = relationId + amount;

  bool hasRelationId() => _relationId != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "relation_name" field.
  String? _relationName;
  String get relationName => _relationName ?? '';
  set relationName(String? val) => _relationName = val;

  bool hasRelationName() => _relationName != null;

  // "shipping_address_info" field.
  UserShippingaddressInfoStruct? _shippingAddressInfo;
  UserShippingaddressInfoStruct get shippingAddressInfo =>
      _shippingAddressInfo ?? UserShippingaddressInfoStruct();
  set shippingAddressInfo(UserShippingaddressInfoStruct? val) =>
      _shippingAddressInfo = val;

  void updateShippingAddressInfo(
      Function(UserShippingaddressInfoStruct) updateFn) {
    updateFn(_shippingAddressInfo ??= UserShippingaddressInfoStruct());
  }

  bool hasShippingAddressInfo() => _shippingAddressInfo != null;

  // "is_default" field.
  bool? _isDefault;
  bool get isDefault => _isDefault ?? false;
  set isDefault(bool? val) => _isDefault = val;

  bool hasIsDefault() => _isDefault != null;

  static UserShippingaddressStruct fromMap(Map<String, dynamic> data) =>
      UserShippingaddressStruct(
        relationId: castToType<int>(data['relation_id']),
        userName: data['user_name'] as String?,
        relationName: data['relation_name'] as String?,
        shippingAddressInfo:
            data['shipping_address_info'] is UserShippingaddressInfoStruct
                ? data['shipping_address_info']
                : UserShippingaddressInfoStruct.maybeFromMap(
                    data['shipping_address_info']),
        isDefault: data['is_default'] as bool?,
      );

  static UserShippingaddressStruct? maybeFromMap(dynamic data) => data is Map
      ? UserShippingaddressStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'relation_id': _relationId,
        'user_name': _userName,
        'relation_name': _relationName,
        'shipping_address_info': _shippingAddressInfo?.toMap(),
        'is_default': _isDefault,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'relation_id': serializeParam(
          _relationId,
          ParamType.int,
        ),
        'user_name': serializeParam(
          _userName,
          ParamType.String,
        ),
        'relation_name': serializeParam(
          _relationName,
          ParamType.String,
        ),
        'shipping_address_info': serializeParam(
          _shippingAddressInfo,
          ParamType.DataStruct,
        ),
        'is_default': serializeParam(
          _isDefault,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserShippingaddressStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserShippingaddressStruct(
        relationId: deserializeParam(
          data['relation_id'],
          ParamType.int,
          false,
        ),
        userName: deserializeParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        relationName: deserializeParam(
          data['relation_name'],
          ParamType.String,
          false,
        ),
        shippingAddressInfo: deserializeStructParam(
          data['shipping_address_info'],
          ParamType.DataStruct,
          false,
          structBuilder: UserShippingaddressInfoStruct.fromSerializableMap,
        ),
        isDefault: deserializeParam(
          data['is_default'],
          ParamType.bool,
          false,
        ),
      );

  static UserShippingaddressStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserShippingaddressStruct(
        relationId: convertAlgoliaParam(
          data['relation_id'],
          ParamType.int,
          false,
        ),
        userName: convertAlgoliaParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        relationName: convertAlgoliaParam(
          data['relation_name'],
          ParamType.String,
          false,
        ),
        shippingAddressInfo: convertAlgoliaParam(
          data['shipping_address_info'],
          ParamType.DataStruct,
          false,
          structBuilder: UserShippingaddressInfoStruct.fromAlgoliaData,
        ),
        isDefault: convertAlgoliaParam(
          data['is_default'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserShippingaddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserShippingaddressStruct &&
        relationId == other.relationId &&
        userName == other.userName &&
        relationName == other.relationName &&
        shippingAddressInfo == other.shippingAddressInfo &&
        isDefault == other.isDefault;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [relationId, userName, relationName, shippingAddressInfo, isDefault]);
}

UserShippingaddressStruct createUserShippingaddressStruct({
  int? relationId,
  String? userName,
  String? relationName,
  UserShippingaddressInfoStruct? shippingAddressInfo,
  bool? isDefault,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserShippingaddressStruct(
      relationId: relationId,
      userName: userName,
      relationName: relationName,
      shippingAddressInfo: shippingAddressInfo ??
          (clearUnsetFields ? UserShippingaddressInfoStruct() : null),
      isDefault: isDefault,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserShippingaddressStruct? updateUserShippingaddressStruct(
  UserShippingaddressStruct? userShippingaddress, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userShippingaddress
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserShippingaddressStructData(
  Map<String, dynamic> firestoreData,
  UserShippingaddressStruct? userShippingaddress,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userShippingaddress == null) {
    return;
  }
  if (userShippingaddress.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userShippingaddress.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userShippingaddressData =
      getUserShippingaddressFirestoreData(userShippingaddress, forFieldValue);
  final nestedData =
      userShippingaddressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userShippingaddress.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserShippingaddressFirestoreData(
  UserShippingaddressStruct? userShippingaddress, [
  bool forFieldValue = false,
]) {
  if (userShippingaddress == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userShippingaddress.toMap());

  // Handle nested data for "shipping_address_info" field.
  addUserShippingaddressInfoStructData(
    firestoreData,
    userShippingaddress.hasShippingAddressInfo()
        ? userShippingaddress.shippingAddressInfo
        : null,
    'shipping_address_info',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(userShippingaddress.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserShippingaddressListFirestoreData(
  List<UserShippingaddressStruct>? userShippingaddresss,
) =>
    userShippingaddresss
        ?.map((e) => getUserShippingaddressFirestoreData(e, true))
        .toList() ??
    [];
