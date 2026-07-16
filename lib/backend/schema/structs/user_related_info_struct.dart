// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserRelatedInfoStruct extends FFFirebaseStruct {
  UserRelatedInfoStruct({
    String? userId,
    String? firstName,
    String? lastName,
    String? gender,
    DateTime? dateOfBirth,
    int? age,
    String? email,
    bool? isEmailVerificationStatus,
    String? phoneNumberCountry,
    String? phoneNumberDailCode,
    String? phoneNumber,
    String? phoneNumberWithoutDailcode,
    String? alternatePhoneNumber,
    bool? isPhoneVerificationStatus,
    bool? isPofileCompleteStatus,
    bool? isStep1Status,
    bool? isStep2Status,
    bool? isStep3Status,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userId = userId,
        _firstName = firstName,
        _lastName = lastName,
        _gender = gender,
        _dateOfBirth = dateOfBirth,
        _age = age,
        _email = email,
        _isEmailVerificationStatus = isEmailVerificationStatus,
        _phoneNumberCountry = phoneNumberCountry,
        _phoneNumberDailCode = phoneNumberDailCode,
        _phoneNumber = phoneNumber,
        _phoneNumberWithoutDailcode = phoneNumberWithoutDailcode,
        _alternatePhoneNumber = alternatePhoneNumber,
        _isPhoneVerificationStatus = isPhoneVerificationStatus,
        _isPofileCompleteStatus = isPofileCompleteStatus,
        _isStep1Status = isStep1Status,
        _isStep2Status = isStep2Status,
        _isStep3Status = isStep3Status,
        super(firestoreUtilData);

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "date_of_birth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  set dateOfBirth(DateTime? val) => _dateOfBirth = val;

  bool hasDateOfBirth() => _dateOfBirth != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  set age(int? val) => _age = val;

  void incrementAge(int amount) => age = age + amount;

  bool hasAge() => _age != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "is_email_verification_status" field.
  bool? _isEmailVerificationStatus;
  bool get isEmailVerificationStatus => _isEmailVerificationStatus ?? false;
  set isEmailVerificationStatus(bool? val) => _isEmailVerificationStatus = val;

  bool hasIsEmailVerificationStatus() => _isEmailVerificationStatus != null;

  // "phone_number_country" field.
  String? _phoneNumberCountry;
  String get phoneNumberCountry => _phoneNumberCountry ?? '';
  set phoneNumberCountry(String? val) => _phoneNumberCountry = val;

  bool hasPhoneNumberCountry() => _phoneNumberCountry != null;

  // "phone_number_dail_code" field.
  String? _phoneNumberDailCode;
  String get phoneNumberDailCode => _phoneNumberDailCode ?? '';
  set phoneNumberDailCode(String? val) => _phoneNumberDailCode = val;

  bool hasPhoneNumberDailCode() => _phoneNumberDailCode != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "phone_number_without_dailcode" field.
  String? _phoneNumberWithoutDailcode;
  String get phoneNumberWithoutDailcode => _phoneNumberWithoutDailcode ?? '';
  set phoneNumberWithoutDailcode(String? val) =>
      _phoneNumberWithoutDailcode = val;

  bool hasPhoneNumberWithoutDailcode() => _phoneNumberWithoutDailcode != null;

  // "alternate_phone_number" field.
  String? _alternatePhoneNumber;
  String get alternatePhoneNumber => _alternatePhoneNumber ?? '';
  set alternatePhoneNumber(String? val) => _alternatePhoneNumber = val;

  bool hasAlternatePhoneNumber() => _alternatePhoneNumber != null;

  // "is_phone_verification_status" field.
  bool? _isPhoneVerificationStatus;
  bool get isPhoneVerificationStatus => _isPhoneVerificationStatus ?? false;
  set isPhoneVerificationStatus(bool? val) => _isPhoneVerificationStatus = val;

  bool hasIsPhoneVerificationStatus() => _isPhoneVerificationStatus != null;

  // "is_pofile_complete_status" field.
  bool? _isPofileCompleteStatus;
  bool get isPofileCompleteStatus => _isPofileCompleteStatus ?? false;
  set isPofileCompleteStatus(bool? val) => _isPofileCompleteStatus = val;

  bool hasIsPofileCompleteStatus() => _isPofileCompleteStatus != null;

  // "is_step1_status" field.
  bool? _isStep1Status;
  bool get isStep1Status => _isStep1Status ?? false;
  set isStep1Status(bool? val) => _isStep1Status = val;

  bool hasIsStep1Status() => _isStep1Status != null;

  // "is_step2_status" field.
  bool? _isStep2Status;
  bool get isStep2Status => _isStep2Status ?? false;
  set isStep2Status(bool? val) => _isStep2Status = val;

  bool hasIsStep2Status() => _isStep2Status != null;

  // "is_step3_status" field.
  bool? _isStep3Status;
  bool get isStep3Status => _isStep3Status ?? false;
  set isStep3Status(bool? val) => _isStep3Status = val;

  bool hasIsStep3Status() => _isStep3Status != null;

  static UserRelatedInfoStruct fromMap(Map<String, dynamic> data) =>
      UserRelatedInfoStruct(
        userId: data['user_id'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        gender: data['gender'] as String?,
        dateOfBirth: data['date_of_birth'] as DateTime?,
        age: castToType<int>(data['age']),
        email: data['email'] as String?,
        isEmailVerificationStatus:
            data['is_email_verification_status'] as bool?,
        phoneNumberCountry: data['phone_number_country'] as String?,
        phoneNumberDailCode: data['phone_number_dail_code'] as String?,
        phoneNumber: data['phone_number'] as String?,
        phoneNumberWithoutDailcode:
            data['phone_number_without_dailcode'] as String?,
        alternatePhoneNumber: data['alternate_phone_number'] as String?,
        isPhoneVerificationStatus:
            data['is_phone_verification_status'] as bool?,
        isPofileCompleteStatus: data['is_pofile_complete_status'] as bool?,
        isStep1Status: data['is_step1_status'] as bool?,
        isStep2Status: data['is_step2_status'] as bool?,
        isStep3Status: data['is_step3_status'] as bool?,
      );

  static UserRelatedInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? UserRelatedInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_id': _userId,
        'first_name': _firstName,
        'last_name': _lastName,
        'gender': _gender,
        'date_of_birth': _dateOfBirth,
        'age': _age,
        'email': _email,
        'is_email_verification_status': _isEmailVerificationStatus,
        'phone_number_country': _phoneNumberCountry,
        'phone_number_dail_code': _phoneNumberDailCode,
        'phone_number': _phoneNumber,
        'phone_number_without_dailcode': _phoneNumberWithoutDailcode,
        'alternate_phone_number': _alternatePhoneNumber,
        'is_phone_verification_status': _isPhoneVerificationStatus,
        'is_pofile_complete_status': _isPofileCompleteStatus,
        'is_step1_status': _isStep1Status,
        'is_step2_status': _isStep2Status,
        'is_step3_status': _isStep3Status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'date_of_birth': serializeParam(
          _dateOfBirth,
          ParamType.DateTime,
        ),
        'age': serializeParam(
          _age,
          ParamType.int,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'is_email_verification_status': serializeParam(
          _isEmailVerificationStatus,
          ParamType.bool,
        ),
        'phone_number_country': serializeParam(
          _phoneNumberCountry,
          ParamType.String,
        ),
        'phone_number_dail_code': serializeParam(
          _phoneNumberDailCode,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'phone_number_without_dailcode': serializeParam(
          _phoneNumberWithoutDailcode,
          ParamType.String,
        ),
        'alternate_phone_number': serializeParam(
          _alternatePhoneNumber,
          ParamType.String,
        ),
        'is_phone_verification_status': serializeParam(
          _isPhoneVerificationStatus,
          ParamType.bool,
        ),
        'is_pofile_complete_status': serializeParam(
          _isPofileCompleteStatus,
          ParamType.bool,
        ),
        'is_step1_status': serializeParam(
          _isStep1Status,
          ParamType.bool,
        ),
        'is_step2_status': serializeParam(
          _isStep2Status,
          ParamType.bool,
        ),
        'is_step3_status': serializeParam(
          _isStep3Status,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserRelatedInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserRelatedInfoStruct(
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        dateOfBirth: deserializeParam(
          data['date_of_birth'],
          ParamType.DateTime,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.int,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        isEmailVerificationStatus: deserializeParam(
          data['is_email_verification_status'],
          ParamType.bool,
          false,
        ),
        phoneNumberCountry: deserializeParam(
          data['phone_number_country'],
          ParamType.String,
          false,
        ),
        phoneNumberDailCode: deserializeParam(
          data['phone_number_dail_code'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        phoneNumberWithoutDailcode: deserializeParam(
          data['phone_number_without_dailcode'],
          ParamType.String,
          false,
        ),
        alternatePhoneNumber: deserializeParam(
          data['alternate_phone_number'],
          ParamType.String,
          false,
        ),
        isPhoneVerificationStatus: deserializeParam(
          data['is_phone_verification_status'],
          ParamType.bool,
          false,
        ),
        isPofileCompleteStatus: deserializeParam(
          data['is_pofile_complete_status'],
          ParamType.bool,
          false,
        ),
        isStep1Status: deserializeParam(
          data['is_step1_status'],
          ParamType.bool,
          false,
        ),
        isStep2Status: deserializeParam(
          data['is_step2_status'],
          ParamType.bool,
          false,
        ),
        isStep3Status: deserializeParam(
          data['is_step3_status'],
          ParamType.bool,
          false,
        ),
      );

  static UserRelatedInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserRelatedInfoStruct(
        userId: convertAlgoliaParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        firstName: convertAlgoliaParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: convertAlgoliaParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        gender: convertAlgoliaParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        dateOfBirth: convertAlgoliaParam(
          data['date_of_birth'],
          ParamType.DateTime,
          false,
        ),
        age: convertAlgoliaParam(
          data['age'],
          ParamType.int,
          false,
        ),
        email: convertAlgoliaParam(
          data['email'],
          ParamType.String,
          false,
        ),
        isEmailVerificationStatus: convertAlgoliaParam(
          data['is_email_verification_status'],
          ParamType.bool,
          false,
        ),
        phoneNumberCountry: convertAlgoliaParam(
          data['phone_number_country'],
          ParamType.String,
          false,
        ),
        phoneNumberDailCode: convertAlgoliaParam(
          data['phone_number_dail_code'],
          ParamType.String,
          false,
        ),
        phoneNumber: convertAlgoliaParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        phoneNumberWithoutDailcode: convertAlgoliaParam(
          data['phone_number_without_dailcode'],
          ParamType.String,
          false,
        ),
        alternatePhoneNumber: convertAlgoliaParam(
          data['alternate_phone_number'],
          ParamType.String,
          false,
        ),
        isPhoneVerificationStatus: convertAlgoliaParam(
          data['is_phone_verification_status'],
          ParamType.bool,
          false,
        ),
        isPofileCompleteStatus: convertAlgoliaParam(
          data['is_pofile_complete_status'],
          ParamType.bool,
          false,
        ),
        isStep1Status: convertAlgoliaParam(
          data['is_step1_status'],
          ParamType.bool,
          false,
        ),
        isStep2Status: convertAlgoliaParam(
          data['is_step2_status'],
          ParamType.bool,
          false,
        ),
        isStep3Status: convertAlgoliaParam(
          data['is_step3_status'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserRelatedInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserRelatedInfoStruct &&
        userId == other.userId &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        gender == other.gender &&
        dateOfBirth == other.dateOfBirth &&
        age == other.age &&
        email == other.email &&
        isEmailVerificationStatus == other.isEmailVerificationStatus &&
        phoneNumberCountry == other.phoneNumberCountry &&
        phoneNumberDailCode == other.phoneNumberDailCode &&
        phoneNumber == other.phoneNumber &&
        phoneNumberWithoutDailcode == other.phoneNumberWithoutDailcode &&
        alternatePhoneNumber == other.alternatePhoneNumber &&
        isPhoneVerificationStatus == other.isPhoneVerificationStatus &&
        isPofileCompleteStatus == other.isPofileCompleteStatus &&
        isStep1Status == other.isStep1Status &&
        isStep2Status == other.isStep2Status &&
        isStep3Status == other.isStep3Status;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userId,
        firstName,
        lastName,
        gender,
        dateOfBirth,
        age,
        email,
        isEmailVerificationStatus,
        phoneNumberCountry,
        phoneNumberDailCode,
        phoneNumber,
        phoneNumberWithoutDailcode,
        alternatePhoneNumber,
        isPhoneVerificationStatus,
        isPofileCompleteStatus,
        isStep1Status,
        isStep2Status,
        isStep3Status
      ]);
}

UserRelatedInfoStruct createUserRelatedInfoStruct({
  String? userId,
  String? firstName,
  String? lastName,
  String? gender,
  DateTime? dateOfBirth,
  int? age,
  String? email,
  bool? isEmailVerificationStatus,
  String? phoneNumberCountry,
  String? phoneNumberDailCode,
  String? phoneNumber,
  String? phoneNumberWithoutDailcode,
  String? alternatePhoneNumber,
  bool? isPhoneVerificationStatus,
  bool? isPofileCompleteStatus,
  bool? isStep1Status,
  bool? isStep2Status,
  bool? isStep3Status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserRelatedInfoStruct(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      dateOfBirth: dateOfBirth,
      age: age,
      email: email,
      isEmailVerificationStatus: isEmailVerificationStatus,
      phoneNumberCountry: phoneNumberCountry,
      phoneNumberDailCode: phoneNumberDailCode,
      phoneNumber: phoneNumber,
      phoneNumberWithoutDailcode: phoneNumberWithoutDailcode,
      alternatePhoneNumber: alternatePhoneNumber,
      isPhoneVerificationStatus: isPhoneVerificationStatus,
      isPofileCompleteStatus: isPofileCompleteStatus,
      isStep1Status: isStep1Status,
      isStep2Status: isStep2Status,
      isStep3Status: isStep3Status,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserRelatedInfoStruct? updateUserRelatedInfoStruct(
  UserRelatedInfoStruct? userRelatedInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userRelatedInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserRelatedInfoStructData(
  Map<String, dynamic> firestoreData,
  UserRelatedInfoStruct? userRelatedInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userRelatedInfo == null) {
    return;
  }
  if (userRelatedInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userRelatedInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userRelatedInfoData =
      getUserRelatedInfoFirestoreData(userRelatedInfo, forFieldValue);
  final nestedData =
      userRelatedInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userRelatedInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserRelatedInfoFirestoreData(
  UserRelatedInfoStruct? userRelatedInfo, [
  bool forFieldValue = false,
]) {
  if (userRelatedInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userRelatedInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(userRelatedInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserRelatedInfoListFirestoreData(
  List<UserRelatedInfoStruct>? userRelatedInfos,
) =>
    userRelatedInfos
        ?.map((e) => getUserRelatedInfoFirestoreData(e, true))
        .toList() ??
    [];
