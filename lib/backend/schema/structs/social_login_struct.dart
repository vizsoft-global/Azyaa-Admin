// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SocialLoginStruct extends FFFirebaseStruct {
  SocialLoginStruct({
    bool? appleLogin,
    bool? googleLogin,
    bool? facebookLogin,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _appleLogin = appleLogin,
        _googleLogin = googleLogin,
        _facebookLogin = facebookLogin,
        super(firestoreUtilData);

  // "apple_login" field.
  bool? _appleLogin;
  bool get appleLogin => _appleLogin ?? false;
  set appleLogin(bool? val) => _appleLogin = val;

  bool hasAppleLogin() => _appleLogin != null;

  // "google_login" field.
  bool? _googleLogin;
  bool get googleLogin => _googleLogin ?? false;
  set googleLogin(bool? val) => _googleLogin = val;

  bool hasGoogleLogin() => _googleLogin != null;

  // "facebook_login" field.
  bool? _facebookLogin;
  bool get facebookLogin => _facebookLogin ?? false;
  set facebookLogin(bool? val) => _facebookLogin = val;

  bool hasFacebookLogin() => _facebookLogin != null;

  static SocialLoginStruct fromMap(Map<String, dynamic> data) =>
      SocialLoginStruct(
        appleLogin: data['apple_login'] as bool?,
        googleLogin: data['google_login'] as bool?,
        facebookLogin: data['facebook_login'] as bool?,
      );

  static SocialLoginStruct? maybeFromMap(dynamic data) => data is Map
      ? SocialLoginStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'apple_login': _appleLogin,
        'google_login': _googleLogin,
        'facebook_login': _facebookLogin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'apple_login': serializeParam(
          _appleLogin,
          ParamType.bool,
        ),
        'google_login': serializeParam(
          _googleLogin,
          ParamType.bool,
        ),
        'facebook_login': serializeParam(
          _facebookLogin,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SocialLoginStruct fromSerializableMap(Map<String, dynamic> data) =>
      SocialLoginStruct(
        appleLogin: deserializeParam(
          data['apple_login'],
          ParamType.bool,
          false,
        ),
        googleLogin: deserializeParam(
          data['google_login'],
          ParamType.bool,
          false,
        ),
        facebookLogin: deserializeParam(
          data['facebook_login'],
          ParamType.bool,
          false,
        ),
      );

  static SocialLoginStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SocialLoginStruct(
        appleLogin: convertAlgoliaParam(
          data['apple_login'],
          ParamType.bool,
          false,
        ),
        googleLogin: convertAlgoliaParam(
          data['google_login'],
          ParamType.bool,
          false,
        ),
        facebookLogin: convertAlgoliaParam(
          data['facebook_login'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SocialLoginStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SocialLoginStruct &&
        appleLogin == other.appleLogin &&
        googleLogin == other.googleLogin &&
        facebookLogin == other.facebookLogin;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([appleLogin, googleLogin, facebookLogin]);
}

SocialLoginStruct createSocialLoginStruct({
  bool? appleLogin,
  bool? googleLogin,
  bool? facebookLogin,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SocialLoginStruct(
      appleLogin: appleLogin,
      googleLogin: googleLogin,
      facebookLogin: facebookLogin,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SocialLoginStruct? updateSocialLoginStruct(
  SocialLoginStruct? socialLogin, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    socialLogin
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSocialLoginStructData(
  Map<String, dynamic> firestoreData,
  SocialLoginStruct? socialLogin,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (socialLogin == null) {
    return;
  }
  if (socialLogin.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && socialLogin.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final socialLoginData =
      getSocialLoginFirestoreData(socialLogin, forFieldValue);
  final nestedData =
      socialLoginData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = socialLogin.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSocialLoginFirestoreData(
  SocialLoginStruct? socialLogin, [
  bool forFieldValue = false,
]) {
  if (socialLogin == null) {
    return {};
  }
  final firestoreData = mapToFirestore(socialLogin.toMap());

  // Add any Firestore field values
  mapToFirestore(socialLogin.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSocialLoginListFirestoreData(
  List<SocialLoginStruct>? socialLogins,
) =>
    socialLogins?.map((e) => getSocialLoginFirestoreData(e, true)).toList() ??
    [];
