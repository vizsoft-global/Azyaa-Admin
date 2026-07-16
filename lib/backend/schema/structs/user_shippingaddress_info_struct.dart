// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserShippingaddressInfoStruct extends FFFirebaseStruct {
  UserShippingaddressInfoStruct({
    String? shippingEmail,
    String? shippingPhone,
    String? shippingPhoneCountry,
    String? shippingPhoneWithoutDailcode,
    String? shippingName,
    int? addressId,
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    LatLng? latLong,
    String? countryISO,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _shippingEmail = shippingEmail,
        _shippingPhone = shippingPhone,
        _shippingPhoneCountry = shippingPhoneCountry,
        _shippingPhoneWithoutDailcode = shippingPhoneWithoutDailcode,
        _shippingName = shippingName,
        _addressId = addressId,
        _addressLine1 = addressLine1,
        _addressLine2 = addressLine2,
        _city = city,
        _state = state,
        _postalCode = postalCode,
        _country = country,
        _latLong = latLong,
        _countryISO = countryISO,
        super(firestoreUtilData);

  // "shipping_email" field.
  String? _shippingEmail;
  String get shippingEmail => _shippingEmail ?? '';
  set shippingEmail(String? val) => _shippingEmail = val;

  bool hasShippingEmail() => _shippingEmail != null;

  // "shipping_phone" field.
  String? _shippingPhone;
  String get shippingPhone => _shippingPhone ?? '';
  set shippingPhone(String? val) => _shippingPhone = val;

  bool hasShippingPhone() => _shippingPhone != null;

  // "shipping_phone_country" field.
  String? _shippingPhoneCountry;
  String get shippingPhoneCountry => _shippingPhoneCountry ?? '';
  set shippingPhoneCountry(String? val) => _shippingPhoneCountry = val;

  bool hasShippingPhoneCountry() => _shippingPhoneCountry != null;

  // "shipping_phone_without_dailcode" field.
  String? _shippingPhoneWithoutDailcode;
  String get shippingPhoneWithoutDailcode =>
      _shippingPhoneWithoutDailcode ?? '';
  set shippingPhoneWithoutDailcode(String? val) =>
      _shippingPhoneWithoutDailcode = val;

  bool hasShippingPhoneWithoutDailcode() =>
      _shippingPhoneWithoutDailcode != null;

  // "shipping_name" field.
  String? _shippingName;
  String get shippingName => _shippingName ?? '';
  set shippingName(String? val) => _shippingName = val;

  bool hasShippingName() => _shippingName != null;

  // "address_id" field.
  int? _addressId;
  int get addressId => _addressId ?? 0;
  set addressId(int? val) => _addressId = val;

  void incrementAddressId(int amount) => addressId = addressId + amount;

  bool hasAddressId() => _addressId != null;

  // "address_line_1" field.
  String? _addressLine1;
  String get addressLine1 => _addressLine1 ?? '';
  set addressLine1(String? val) => _addressLine1 = val;

  bool hasAddressLine1() => _addressLine1 != null;

  // "address_line_2" field.
  String? _addressLine2;
  String get addressLine2 => _addressLine2 ?? '';
  set addressLine2(String? val) => _addressLine2 = val;

  bool hasAddressLine2() => _addressLine2 != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "postal_code" field.
  String? _postalCode;
  String get postalCode => _postalCode ?? '';
  set postalCode(String? val) => _postalCode = val;

  bool hasPostalCode() => _postalCode != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "lat_long" field.
  LatLng? _latLong;
  LatLng? get latLong => _latLong;
  set latLong(LatLng? val) => _latLong = val;

  bool hasLatLong() => _latLong != null;

  // "countryISO" field.
  String? _countryISO;
  String get countryISO => _countryISO ?? '';
  set countryISO(String? val) => _countryISO = val;

  bool hasCountryISO() => _countryISO != null;

  static UserShippingaddressInfoStruct fromMap(Map<String, dynamic> data) =>
      UserShippingaddressInfoStruct(
        shippingEmail: data['shipping_email'] as String?,
        shippingPhone: data['shipping_phone'] as String?,
        shippingPhoneCountry: data['shipping_phone_country'] as String?,
        shippingPhoneWithoutDailcode:
            data['shipping_phone_without_dailcode'] as String?,
        shippingName: data['shipping_name'] as String?,
        addressId: castToType<int>(data['address_id']),
        addressLine1: data['address_line_1'] as String?,
        addressLine2: data['address_line_2'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        postalCode: data['postal_code'] as String?,
        country: data['country'] as String?,
        latLong: data['lat_long'] as LatLng?,
        countryISO: data['countryISO'] as String?,
      );

  static UserShippingaddressInfoStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? UserShippingaddressInfoStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'shipping_email': _shippingEmail,
        'shipping_phone': _shippingPhone,
        'shipping_phone_country': _shippingPhoneCountry,
        'shipping_phone_without_dailcode': _shippingPhoneWithoutDailcode,
        'shipping_name': _shippingName,
        'address_id': _addressId,
        'address_line_1': _addressLine1,
        'address_line_2': _addressLine2,
        'city': _city,
        'state': _state,
        'postal_code': _postalCode,
        'country': _country,
        'lat_long': _latLong,
        'countryISO': _countryISO,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'shipping_email': serializeParam(
          _shippingEmail,
          ParamType.String,
        ),
        'shipping_phone': serializeParam(
          _shippingPhone,
          ParamType.String,
        ),
        'shipping_phone_country': serializeParam(
          _shippingPhoneCountry,
          ParamType.String,
        ),
        'shipping_phone_without_dailcode': serializeParam(
          _shippingPhoneWithoutDailcode,
          ParamType.String,
        ),
        'shipping_name': serializeParam(
          _shippingName,
          ParamType.String,
        ),
        'address_id': serializeParam(
          _addressId,
          ParamType.int,
        ),
        'address_line_1': serializeParam(
          _addressLine1,
          ParamType.String,
        ),
        'address_line_2': serializeParam(
          _addressLine2,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'postal_code': serializeParam(
          _postalCode,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'lat_long': serializeParam(
          _latLong,
          ParamType.LatLng,
        ),
        'countryISO': serializeParam(
          _countryISO,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserShippingaddressInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserShippingaddressInfoStruct(
        shippingEmail: deserializeParam(
          data['shipping_email'],
          ParamType.String,
          false,
        ),
        shippingPhone: deserializeParam(
          data['shipping_phone'],
          ParamType.String,
          false,
        ),
        shippingPhoneCountry: deserializeParam(
          data['shipping_phone_country'],
          ParamType.String,
          false,
        ),
        shippingPhoneWithoutDailcode: deserializeParam(
          data['shipping_phone_without_dailcode'],
          ParamType.String,
          false,
        ),
        shippingName: deserializeParam(
          data['shipping_name'],
          ParamType.String,
          false,
        ),
        addressId: deserializeParam(
          data['address_id'],
          ParamType.int,
          false,
        ),
        addressLine1: deserializeParam(
          data['address_line_1'],
          ParamType.String,
          false,
        ),
        addressLine2: deserializeParam(
          data['address_line_2'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        postalCode: deserializeParam(
          data['postal_code'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        latLong: deserializeParam(
          data['lat_long'],
          ParamType.LatLng,
          false,
        ),
        countryISO: deserializeParam(
          data['countryISO'],
          ParamType.String,
          false,
        ),
      );

  static UserShippingaddressInfoStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      UserShippingaddressInfoStruct(
        shippingEmail: convertAlgoliaParam(
          data['shipping_email'],
          ParamType.String,
          false,
        ),
        shippingPhone: convertAlgoliaParam(
          data['shipping_phone'],
          ParamType.String,
          false,
        ),
        shippingPhoneCountry: convertAlgoliaParam(
          data['shipping_phone_country'],
          ParamType.String,
          false,
        ),
        shippingPhoneWithoutDailcode: convertAlgoliaParam(
          data['shipping_phone_without_dailcode'],
          ParamType.String,
          false,
        ),
        shippingName: convertAlgoliaParam(
          data['shipping_name'],
          ParamType.String,
          false,
        ),
        addressId: convertAlgoliaParam(
          data['address_id'],
          ParamType.int,
          false,
        ),
        addressLine1: convertAlgoliaParam(
          data['address_line_1'],
          ParamType.String,
          false,
        ),
        addressLine2: convertAlgoliaParam(
          data['address_line_2'],
          ParamType.String,
          false,
        ),
        city: convertAlgoliaParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: convertAlgoliaParam(
          data['state'],
          ParamType.String,
          false,
        ),
        postalCode: convertAlgoliaParam(
          data['postal_code'],
          ParamType.String,
          false,
        ),
        country: convertAlgoliaParam(
          data['country'],
          ParamType.String,
          false,
        ),
        latLong: convertAlgoliaParam(
          data,
          ParamType.LatLng,
          false,
        ),
        countryISO: convertAlgoliaParam(
          data['countryISO'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserShippingaddressInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserShippingaddressInfoStruct &&
        shippingEmail == other.shippingEmail &&
        shippingPhone == other.shippingPhone &&
        shippingPhoneCountry == other.shippingPhoneCountry &&
        shippingPhoneWithoutDailcode == other.shippingPhoneWithoutDailcode &&
        shippingName == other.shippingName &&
        addressId == other.addressId &&
        addressLine1 == other.addressLine1 &&
        addressLine2 == other.addressLine2 &&
        city == other.city &&
        state == other.state &&
        postalCode == other.postalCode &&
        country == other.country &&
        latLong == other.latLong &&
        countryISO == other.countryISO;
  }

  @override
  int get hashCode => const ListEquality().hash([
        shippingEmail,
        shippingPhone,
        shippingPhoneCountry,
        shippingPhoneWithoutDailcode,
        shippingName,
        addressId,
        addressLine1,
        addressLine2,
        city,
        state,
        postalCode,
        country,
        latLong,
        countryISO
      ]);
}

UserShippingaddressInfoStruct createUserShippingaddressInfoStruct({
  String? shippingEmail,
  String? shippingPhone,
  String? shippingPhoneCountry,
  String? shippingPhoneWithoutDailcode,
  String? shippingName,
  int? addressId,
  String? addressLine1,
  String? addressLine2,
  String? city,
  String? state,
  String? postalCode,
  String? country,
  LatLng? latLong,
  String? countryISO,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserShippingaddressInfoStruct(
      shippingEmail: shippingEmail,
      shippingPhone: shippingPhone,
      shippingPhoneCountry: shippingPhoneCountry,
      shippingPhoneWithoutDailcode: shippingPhoneWithoutDailcode,
      shippingName: shippingName,
      addressId: addressId,
      addressLine1: addressLine1,
      addressLine2: addressLine2,
      city: city,
      state: state,
      postalCode: postalCode,
      country: country,
      latLong: latLong,
      countryISO: countryISO,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserShippingaddressInfoStruct? updateUserShippingaddressInfoStruct(
  UserShippingaddressInfoStruct? userShippingaddressInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userShippingaddressInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserShippingaddressInfoStructData(
  Map<String, dynamic> firestoreData,
  UserShippingaddressInfoStruct? userShippingaddressInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userShippingaddressInfo == null) {
    return;
  }
  if (userShippingaddressInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      userShippingaddressInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userShippingaddressInfoData = getUserShippingaddressInfoFirestoreData(
      userShippingaddressInfo, forFieldValue);
  final nestedData =
      userShippingaddressInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userShippingaddressInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserShippingaddressInfoFirestoreData(
  UserShippingaddressInfoStruct? userShippingaddressInfo, [
  bool forFieldValue = false,
]) {
  if (userShippingaddressInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userShippingaddressInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(userShippingaddressInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserShippingaddressInfoListFirestoreData(
  List<UserShippingaddressInfoStruct>? userShippingaddressInfos,
) =>
    userShippingaddressInfos
        ?.map((e) => getUserShippingaddressInfoFirestoreData(e, true))
        .toList() ??
    [];
