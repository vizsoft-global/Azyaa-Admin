// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AddressInfoStruct extends FFFirebaseStruct {
  AddressInfoStruct({
    String? name,
    String? phone1,
    String? phone2,
    String? dailCode,
    String? email,
    String? city,
    String? state,
    String? country,
    int? pincode,
    String? landMark,
    String? street1,
    String? street2,
    String? flatNumber,
    String? gmapLink,
    LatLng? gmapLatLan,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _phone1 = phone1,
        _phone2 = phone2,
        _dailCode = dailCode,
        _email = email,
        _city = city,
        _state = state,
        _country = country,
        _pincode = pincode,
        _landMark = landMark,
        _street1 = street1,
        _street2 = street2,
        _flatNumber = flatNumber,
        _gmapLink = gmapLink,
        _gmapLatLan = gmapLatLan,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "phone1" field.
  String? _phone1;
  String get phone1 => _phone1 ?? '';
  set phone1(String? val) => _phone1 = val;

  bool hasPhone1() => _phone1 != null;

  // "phone2" field.
  String? _phone2;
  String get phone2 => _phone2 ?? '';
  set phone2(String? val) => _phone2 = val;

  bool hasPhone2() => _phone2 != null;

  // "dail_code" field.
  String? _dailCode;
  String get dailCode => _dailCode ?? '';
  set dailCode(String? val) => _dailCode = val;

  bool hasDailCode() => _dailCode != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

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

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "pincode" field.
  int? _pincode;
  int get pincode => _pincode ?? 0;
  set pincode(int? val) => _pincode = val;

  void incrementPincode(int amount) => pincode = pincode + amount;

  bool hasPincode() => _pincode != null;

  // "land_mark" field.
  String? _landMark;
  String get landMark => _landMark ?? '';
  set landMark(String? val) => _landMark = val;

  bool hasLandMark() => _landMark != null;

  // "street1" field.
  String? _street1;
  String get street1 => _street1 ?? '';
  set street1(String? val) => _street1 = val;

  bool hasStreet1() => _street1 != null;

  // "street2" field.
  String? _street2;
  String get street2 => _street2 ?? '';
  set street2(String? val) => _street2 = val;

  bool hasStreet2() => _street2 != null;

  // "flat_number" field.
  String? _flatNumber;
  String get flatNumber => _flatNumber ?? '';
  set flatNumber(String? val) => _flatNumber = val;

  bool hasFlatNumber() => _flatNumber != null;

  // "gmap_link" field.
  String? _gmapLink;
  String get gmapLink => _gmapLink ?? '';
  set gmapLink(String? val) => _gmapLink = val;

  bool hasGmapLink() => _gmapLink != null;

  // "gmap_lat_lan" field.
  LatLng? _gmapLatLan;
  LatLng? get gmapLatLan => _gmapLatLan;
  set gmapLatLan(LatLng? val) => _gmapLatLan = val;

  bool hasGmapLatLan() => _gmapLatLan != null;

  static AddressInfoStruct fromMap(Map<String, dynamic> data) =>
      AddressInfoStruct(
        name: data['name'] as String?,
        phone1: data['phone1'] as String?,
        phone2: data['phone2'] as String?,
        dailCode: data['dail_code'] as String?,
        email: data['email'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        country: data['country'] as String?,
        pincode: castToType<int>(data['pincode']),
        landMark: data['land_mark'] as String?,
        street1: data['street1'] as String?,
        street2: data['street2'] as String?,
        flatNumber: data['flat_number'] as String?,
        gmapLink: data['gmap_link'] as String?,
        gmapLatLan: data['gmap_lat_lan'] as LatLng?,
      );

  static AddressInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? AddressInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'phone1': _phone1,
        'phone2': _phone2,
        'dail_code': _dailCode,
        'email': _email,
        'city': _city,
        'state': _state,
        'country': _country,
        'pincode': _pincode,
        'land_mark': _landMark,
        'street1': _street1,
        'street2': _street2,
        'flat_number': _flatNumber,
        'gmap_link': _gmapLink,
        'gmap_lat_lan': _gmapLatLan,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'phone1': serializeParam(
          _phone1,
          ParamType.String,
        ),
        'phone2': serializeParam(
          _phone2,
          ParamType.String,
        ),
        'dail_code': serializeParam(
          _dailCode,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
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
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'pincode': serializeParam(
          _pincode,
          ParamType.int,
        ),
        'land_mark': serializeParam(
          _landMark,
          ParamType.String,
        ),
        'street1': serializeParam(
          _street1,
          ParamType.String,
        ),
        'street2': serializeParam(
          _street2,
          ParamType.String,
        ),
        'flat_number': serializeParam(
          _flatNumber,
          ParamType.String,
        ),
        'gmap_link': serializeParam(
          _gmapLink,
          ParamType.String,
        ),
        'gmap_lat_lan': serializeParam(
          _gmapLatLan,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static AddressInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressInfoStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        phone1: deserializeParam(
          data['phone1'],
          ParamType.String,
          false,
        ),
        phone2: deserializeParam(
          data['phone2'],
          ParamType.String,
          false,
        ),
        dailCode: deserializeParam(
          data['dail_code'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
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
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        pincode: deserializeParam(
          data['pincode'],
          ParamType.int,
          false,
        ),
        landMark: deserializeParam(
          data['land_mark'],
          ParamType.String,
          false,
        ),
        street1: deserializeParam(
          data['street1'],
          ParamType.String,
          false,
        ),
        street2: deserializeParam(
          data['street2'],
          ParamType.String,
          false,
        ),
        flatNumber: deserializeParam(
          data['flat_number'],
          ParamType.String,
          false,
        ),
        gmapLink: deserializeParam(
          data['gmap_link'],
          ParamType.String,
          false,
        ),
        gmapLatLan: deserializeParam(
          data['gmap_lat_lan'],
          ParamType.LatLng,
          false,
        ),
      );

  static AddressInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      AddressInfoStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        phone1: convertAlgoliaParam(
          data['phone1'],
          ParamType.String,
          false,
        ),
        phone2: convertAlgoliaParam(
          data['phone2'],
          ParamType.String,
          false,
        ),
        dailCode: convertAlgoliaParam(
          data['dail_code'],
          ParamType.String,
          false,
        ),
        email: convertAlgoliaParam(
          data['email'],
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
        country: convertAlgoliaParam(
          data['country'],
          ParamType.String,
          false,
        ),
        pincode: convertAlgoliaParam(
          data['pincode'],
          ParamType.int,
          false,
        ),
        landMark: convertAlgoliaParam(
          data['land_mark'],
          ParamType.String,
          false,
        ),
        street1: convertAlgoliaParam(
          data['street1'],
          ParamType.String,
          false,
        ),
        street2: convertAlgoliaParam(
          data['street2'],
          ParamType.String,
          false,
        ),
        flatNumber: convertAlgoliaParam(
          data['flat_number'],
          ParamType.String,
          false,
        ),
        gmapLink: convertAlgoliaParam(
          data['gmap_link'],
          ParamType.String,
          false,
        ),
        gmapLatLan: convertAlgoliaParam(
          data,
          ParamType.LatLng,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'AddressInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressInfoStruct &&
        name == other.name &&
        phone1 == other.phone1 &&
        phone2 == other.phone2 &&
        dailCode == other.dailCode &&
        email == other.email &&
        city == other.city &&
        state == other.state &&
        country == other.country &&
        pincode == other.pincode &&
        landMark == other.landMark &&
        street1 == other.street1 &&
        street2 == other.street2 &&
        flatNumber == other.flatNumber &&
        gmapLink == other.gmapLink &&
        gmapLatLan == other.gmapLatLan;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        phone1,
        phone2,
        dailCode,
        email,
        city,
        state,
        country,
        pincode,
        landMark,
        street1,
        street2,
        flatNumber,
        gmapLink,
        gmapLatLan
      ]);
}

AddressInfoStruct createAddressInfoStruct({
  String? name,
  String? phone1,
  String? phone2,
  String? dailCode,
  String? email,
  String? city,
  String? state,
  String? country,
  int? pincode,
  String? landMark,
  String? street1,
  String? street2,
  String? flatNumber,
  String? gmapLink,
  LatLng? gmapLatLan,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressInfoStruct(
      name: name,
      phone1: phone1,
      phone2: phone2,
      dailCode: dailCode,
      email: email,
      city: city,
      state: state,
      country: country,
      pincode: pincode,
      landMark: landMark,
      street1: street1,
      street2: street2,
      flatNumber: flatNumber,
      gmapLink: gmapLink,
      gmapLatLan: gmapLatLan,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressInfoStruct? updateAddressInfoStruct(
  AddressInfoStruct? addressInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    addressInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressInfoStructData(
  Map<String, dynamic> firestoreData,
  AddressInfoStruct? addressInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (addressInfo == null) {
    return;
  }
  if (addressInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && addressInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressInfoData =
      getAddressInfoFirestoreData(addressInfo, forFieldValue);
  final nestedData =
      addressInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = addressInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressInfoFirestoreData(
  AddressInfoStruct? addressInfo, [
  bool forFieldValue = false,
]) {
  if (addressInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(addressInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(addressInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressInfoListFirestoreData(
  List<AddressInfoStruct>? addressInfos,
) =>
    addressInfos?.map((e) => getAddressInfoFirestoreData(e, true)).toList() ??
    [];
