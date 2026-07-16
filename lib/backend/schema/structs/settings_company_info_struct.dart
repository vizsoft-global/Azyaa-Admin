// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingsCompanyInfoStruct extends FFFirebaseStruct {
  SettingsCompanyInfoStruct({
    String? companyName,
    String? companyLogo,
    String? companyWebsite,
    String? address,
    String? contactEmail,
    String? phoneNumber,
    String? whatsapp,
    String? contactFormUrl,
    String? socialMediaFacebook,
    String? socialMediaTwitter,
    String? socialMediaInstagram,
    String? socialMediaLinkedin,
    String? privacyPolicy,
    String? termsCondition,
    String? disclaimer,
    String? phoneOtpType,
    String? defaultProductSizechartUk,
    String? defaultProductSizechartUs,
    UserShippingaddressInfoStruct? wearhouseAddress,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _companyName = companyName,
        _companyLogo = companyLogo,
        _companyWebsite = companyWebsite,
        _address = address,
        _contactEmail = contactEmail,
        _phoneNumber = phoneNumber,
        _whatsapp = whatsapp,
        _contactFormUrl = contactFormUrl,
        _socialMediaFacebook = socialMediaFacebook,
        _socialMediaTwitter = socialMediaTwitter,
        _socialMediaInstagram = socialMediaInstagram,
        _socialMediaLinkedin = socialMediaLinkedin,
        _privacyPolicy = privacyPolicy,
        _termsCondition = termsCondition,
        _disclaimer = disclaimer,
        _phoneOtpType = phoneOtpType,
        _defaultProductSizechartUk = defaultProductSizechartUk,
        _defaultProductSizechartUs = defaultProductSizechartUs,
        _wearhouseAddress = wearhouseAddress,
        super(firestoreUtilData);

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  set companyName(String? val) => _companyName = val;

  bool hasCompanyName() => _companyName != null;

  // "company_logo" field.
  String? _companyLogo;
  String get companyLogo => _companyLogo ?? '';
  set companyLogo(String? val) => _companyLogo = val;

  bool hasCompanyLogo() => _companyLogo != null;

  // "company_website" field.
  String? _companyWebsite;
  String get companyWebsite => _companyWebsite ?? '';
  set companyWebsite(String? val) => _companyWebsite = val;

  bool hasCompanyWebsite() => _companyWebsite != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "contact_email" field.
  String? _contactEmail;
  String get contactEmail => _contactEmail ?? '';
  set contactEmail(String? val) => _contactEmail = val;

  bool hasContactEmail() => _contactEmail != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "whatsapp" field.
  String? _whatsapp;
  String get whatsapp => _whatsapp ?? '';
  set whatsapp(String? val) => _whatsapp = val;

  bool hasWhatsapp() => _whatsapp != null;

  // "contact_form_url" field.
  String? _contactFormUrl;
  String get contactFormUrl => _contactFormUrl ?? '';
  set contactFormUrl(String? val) => _contactFormUrl = val;

  bool hasContactFormUrl() => _contactFormUrl != null;

  // "social_media_facebook" field.
  String? _socialMediaFacebook;
  String get socialMediaFacebook => _socialMediaFacebook ?? '';
  set socialMediaFacebook(String? val) => _socialMediaFacebook = val;

  bool hasSocialMediaFacebook() => _socialMediaFacebook != null;

  // "social_media_twitter" field.
  String? _socialMediaTwitter;
  String get socialMediaTwitter => _socialMediaTwitter ?? '';
  set socialMediaTwitter(String? val) => _socialMediaTwitter = val;

  bool hasSocialMediaTwitter() => _socialMediaTwitter != null;

  // "social_media_instagram" field.
  String? _socialMediaInstagram;
  String get socialMediaInstagram => _socialMediaInstagram ?? '';
  set socialMediaInstagram(String? val) => _socialMediaInstagram = val;

  bool hasSocialMediaInstagram() => _socialMediaInstagram != null;

  // "social_media_linkedin" field.
  String? _socialMediaLinkedin;
  String get socialMediaLinkedin => _socialMediaLinkedin ?? '';
  set socialMediaLinkedin(String? val) => _socialMediaLinkedin = val;

  bool hasSocialMediaLinkedin() => _socialMediaLinkedin != null;

  // "privacy_policy" field.
  String? _privacyPolicy;
  String get privacyPolicy => _privacyPolicy ?? '';
  set privacyPolicy(String? val) => _privacyPolicy = val;

  bool hasPrivacyPolicy() => _privacyPolicy != null;

  // "terms_condition" field.
  String? _termsCondition;
  String get termsCondition => _termsCondition ?? '';
  set termsCondition(String? val) => _termsCondition = val;

  bool hasTermsCondition() => _termsCondition != null;

  // "disclaimer" field.
  String? _disclaimer;
  String get disclaimer => _disclaimer ?? '';
  set disclaimer(String? val) => _disclaimer = val;

  bool hasDisclaimer() => _disclaimer != null;

  // "phone_otp_type" field.
  String? _phoneOtpType;
  String get phoneOtpType => _phoneOtpType ?? '';
  set phoneOtpType(String? val) => _phoneOtpType = val;

  bool hasPhoneOtpType() => _phoneOtpType != null;

  // "default_product_sizechart_uk" field.
  String? _defaultProductSizechartUk;
  String get defaultProductSizechartUk => _defaultProductSizechartUk ?? '';
  set defaultProductSizechartUk(String? val) =>
      _defaultProductSizechartUk = val;

  bool hasDefaultProductSizechartUk() => _defaultProductSizechartUk != null;

  // "default_product_sizechart_us" field.
  String? _defaultProductSizechartUs;
  String get defaultProductSizechartUs => _defaultProductSizechartUs ?? '';
  set defaultProductSizechartUs(String? val) =>
      _defaultProductSizechartUs = val;

  bool hasDefaultProductSizechartUs() => _defaultProductSizechartUs != null;

  // "wearhouse_address" field.
  UserShippingaddressInfoStruct? _wearhouseAddress;
  UserShippingaddressInfoStruct get wearhouseAddress =>
      _wearhouseAddress ?? UserShippingaddressInfoStruct();
  set wearhouseAddress(UserShippingaddressInfoStruct? val) =>
      _wearhouseAddress = val;

  void updateWearhouseAddress(
      Function(UserShippingaddressInfoStruct) updateFn) {
    updateFn(_wearhouseAddress ??= UserShippingaddressInfoStruct());
  }

  bool hasWearhouseAddress() => _wearhouseAddress != null;

  static SettingsCompanyInfoStruct fromMap(Map<String, dynamic> data) =>
      SettingsCompanyInfoStruct(
        companyName: data['company_name'] as String?,
        companyLogo: data['company_logo'] as String?,
        companyWebsite: data['company_website'] as String?,
        address: data['address'] as String?,
        contactEmail: data['contact_email'] as String?,
        phoneNumber: data['phone_number'] as String?,
        whatsapp: data['whatsapp'] as String?,
        contactFormUrl: data['contact_form_url'] as String?,
        socialMediaFacebook: data['social_media_facebook'] as String?,
        socialMediaTwitter: data['social_media_twitter'] as String?,
        socialMediaInstagram: data['social_media_instagram'] as String?,
        socialMediaLinkedin: data['social_media_linkedin'] as String?,
        privacyPolicy: data['privacy_policy'] as String?,
        termsCondition: data['terms_condition'] as String?,
        disclaimer: data['disclaimer'] as String?,
        phoneOtpType: data['phone_otp_type'] as String?,
        defaultProductSizechartUk:
            data['default_product_sizechart_uk'] as String?,
        defaultProductSizechartUs:
            data['default_product_sizechart_us'] as String?,
        wearhouseAddress:
            data['wearhouse_address'] is UserShippingaddressInfoStruct
                ? data['wearhouse_address']
                : UserShippingaddressInfoStruct.maybeFromMap(
                    data['wearhouse_address']),
      );

  static SettingsCompanyInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? SettingsCompanyInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'company_name': _companyName,
        'company_logo': _companyLogo,
        'company_website': _companyWebsite,
        'address': _address,
        'contact_email': _contactEmail,
        'phone_number': _phoneNumber,
        'whatsapp': _whatsapp,
        'contact_form_url': _contactFormUrl,
        'social_media_facebook': _socialMediaFacebook,
        'social_media_twitter': _socialMediaTwitter,
        'social_media_instagram': _socialMediaInstagram,
        'social_media_linkedin': _socialMediaLinkedin,
        'privacy_policy': _privacyPolicy,
        'terms_condition': _termsCondition,
        'disclaimer': _disclaimer,
        'phone_otp_type': _phoneOtpType,
        'default_product_sizechart_uk': _defaultProductSizechartUk,
        'default_product_sizechart_us': _defaultProductSizechartUs,
        'wearhouse_address': _wearhouseAddress?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'company_name': serializeParam(
          _companyName,
          ParamType.String,
        ),
        'company_logo': serializeParam(
          _companyLogo,
          ParamType.String,
        ),
        'company_website': serializeParam(
          _companyWebsite,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'contact_email': serializeParam(
          _contactEmail,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'whatsapp': serializeParam(
          _whatsapp,
          ParamType.String,
        ),
        'contact_form_url': serializeParam(
          _contactFormUrl,
          ParamType.String,
        ),
        'social_media_facebook': serializeParam(
          _socialMediaFacebook,
          ParamType.String,
        ),
        'social_media_twitter': serializeParam(
          _socialMediaTwitter,
          ParamType.String,
        ),
        'social_media_instagram': serializeParam(
          _socialMediaInstagram,
          ParamType.String,
        ),
        'social_media_linkedin': serializeParam(
          _socialMediaLinkedin,
          ParamType.String,
        ),
        'privacy_policy': serializeParam(
          _privacyPolicy,
          ParamType.String,
        ),
        'terms_condition': serializeParam(
          _termsCondition,
          ParamType.String,
        ),
        'disclaimer': serializeParam(
          _disclaimer,
          ParamType.String,
        ),
        'phone_otp_type': serializeParam(
          _phoneOtpType,
          ParamType.String,
        ),
        'default_product_sizechart_uk': serializeParam(
          _defaultProductSizechartUk,
          ParamType.String,
        ),
        'default_product_sizechart_us': serializeParam(
          _defaultProductSizechartUs,
          ParamType.String,
        ),
        'wearhouse_address': serializeParam(
          _wearhouseAddress,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static SettingsCompanyInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SettingsCompanyInfoStruct(
        companyName: deserializeParam(
          data['company_name'],
          ParamType.String,
          false,
        ),
        companyLogo: deserializeParam(
          data['company_logo'],
          ParamType.String,
          false,
        ),
        companyWebsite: deserializeParam(
          data['company_website'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        contactEmail: deserializeParam(
          data['contact_email'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        whatsapp: deserializeParam(
          data['whatsapp'],
          ParamType.String,
          false,
        ),
        contactFormUrl: deserializeParam(
          data['contact_form_url'],
          ParamType.String,
          false,
        ),
        socialMediaFacebook: deserializeParam(
          data['social_media_facebook'],
          ParamType.String,
          false,
        ),
        socialMediaTwitter: deserializeParam(
          data['social_media_twitter'],
          ParamType.String,
          false,
        ),
        socialMediaInstagram: deserializeParam(
          data['social_media_instagram'],
          ParamType.String,
          false,
        ),
        socialMediaLinkedin: deserializeParam(
          data['social_media_linkedin'],
          ParamType.String,
          false,
        ),
        privacyPolicy: deserializeParam(
          data['privacy_policy'],
          ParamType.String,
          false,
        ),
        termsCondition: deserializeParam(
          data['terms_condition'],
          ParamType.String,
          false,
        ),
        disclaimer: deserializeParam(
          data['disclaimer'],
          ParamType.String,
          false,
        ),
        phoneOtpType: deserializeParam(
          data['phone_otp_type'],
          ParamType.String,
          false,
        ),
        defaultProductSizechartUk: deserializeParam(
          data['default_product_sizechart_uk'],
          ParamType.String,
          false,
        ),
        defaultProductSizechartUs: deserializeParam(
          data['default_product_sizechart_us'],
          ParamType.String,
          false,
        ),
        wearhouseAddress: deserializeStructParam(
          data['wearhouse_address'],
          ParamType.DataStruct,
          false,
          structBuilder: UserShippingaddressInfoStruct.fromSerializableMap,
        ),
      );

  static SettingsCompanyInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SettingsCompanyInfoStruct(
        companyName: convertAlgoliaParam(
          data['company_name'],
          ParamType.String,
          false,
        ),
        companyLogo: convertAlgoliaParam(
          data['company_logo'],
          ParamType.String,
          false,
        ),
        companyWebsite: convertAlgoliaParam(
          data['company_website'],
          ParamType.String,
          false,
        ),
        address: convertAlgoliaParam(
          data['address'],
          ParamType.String,
          false,
        ),
        contactEmail: convertAlgoliaParam(
          data['contact_email'],
          ParamType.String,
          false,
        ),
        phoneNumber: convertAlgoliaParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        whatsapp: convertAlgoliaParam(
          data['whatsapp'],
          ParamType.String,
          false,
        ),
        contactFormUrl: convertAlgoliaParam(
          data['contact_form_url'],
          ParamType.String,
          false,
        ),
        socialMediaFacebook: convertAlgoliaParam(
          data['social_media_facebook'],
          ParamType.String,
          false,
        ),
        socialMediaTwitter: convertAlgoliaParam(
          data['social_media_twitter'],
          ParamType.String,
          false,
        ),
        socialMediaInstagram: convertAlgoliaParam(
          data['social_media_instagram'],
          ParamType.String,
          false,
        ),
        socialMediaLinkedin: convertAlgoliaParam(
          data['social_media_linkedin'],
          ParamType.String,
          false,
        ),
        privacyPolicy: convertAlgoliaParam(
          data['privacy_policy'],
          ParamType.String,
          false,
        ),
        termsCondition: convertAlgoliaParam(
          data['terms_condition'],
          ParamType.String,
          false,
        ),
        disclaimer: convertAlgoliaParam(
          data['disclaimer'],
          ParamType.String,
          false,
        ),
        phoneOtpType: convertAlgoliaParam(
          data['phone_otp_type'],
          ParamType.String,
          false,
        ),
        defaultProductSizechartUk: convertAlgoliaParam(
          data['default_product_sizechart_uk'],
          ParamType.String,
          false,
        ),
        defaultProductSizechartUs: convertAlgoliaParam(
          data['default_product_sizechart_us'],
          ParamType.String,
          false,
        ),
        wearhouseAddress: convertAlgoliaParam(
          data['wearhouse_address'],
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
  String toString() => 'SettingsCompanyInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SettingsCompanyInfoStruct &&
        companyName == other.companyName &&
        companyLogo == other.companyLogo &&
        companyWebsite == other.companyWebsite &&
        address == other.address &&
        contactEmail == other.contactEmail &&
        phoneNumber == other.phoneNumber &&
        whatsapp == other.whatsapp &&
        contactFormUrl == other.contactFormUrl &&
        socialMediaFacebook == other.socialMediaFacebook &&
        socialMediaTwitter == other.socialMediaTwitter &&
        socialMediaInstagram == other.socialMediaInstagram &&
        socialMediaLinkedin == other.socialMediaLinkedin &&
        privacyPolicy == other.privacyPolicy &&
        termsCondition == other.termsCondition &&
        disclaimer == other.disclaimer &&
        phoneOtpType == other.phoneOtpType &&
        defaultProductSizechartUk == other.defaultProductSizechartUk &&
        defaultProductSizechartUs == other.defaultProductSizechartUs &&
        wearhouseAddress == other.wearhouseAddress;
  }

  @override
  int get hashCode => const ListEquality().hash([
        companyName,
        companyLogo,
        companyWebsite,
        address,
        contactEmail,
        phoneNumber,
        whatsapp,
        contactFormUrl,
        socialMediaFacebook,
        socialMediaTwitter,
        socialMediaInstagram,
        socialMediaLinkedin,
        privacyPolicy,
        termsCondition,
        disclaimer,
        phoneOtpType,
        defaultProductSizechartUk,
        defaultProductSizechartUs,
        wearhouseAddress
      ]);
}

SettingsCompanyInfoStruct createSettingsCompanyInfoStruct({
  String? companyName,
  String? companyLogo,
  String? companyWebsite,
  String? address,
  String? contactEmail,
  String? phoneNumber,
  String? whatsapp,
  String? contactFormUrl,
  String? socialMediaFacebook,
  String? socialMediaTwitter,
  String? socialMediaInstagram,
  String? socialMediaLinkedin,
  String? privacyPolicy,
  String? termsCondition,
  String? disclaimer,
  String? phoneOtpType,
  String? defaultProductSizechartUk,
  String? defaultProductSizechartUs,
  UserShippingaddressInfoStruct? wearhouseAddress,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SettingsCompanyInfoStruct(
      companyName: companyName,
      companyLogo: companyLogo,
      companyWebsite: companyWebsite,
      address: address,
      contactEmail: contactEmail,
      phoneNumber: phoneNumber,
      whatsapp: whatsapp,
      contactFormUrl: contactFormUrl,
      socialMediaFacebook: socialMediaFacebook,
      socialMediaTwitter: socialMediaTwitter,
      socialMediaInstagram: socialMediaInstagram,
      socialMediaLinkedin: socialMediaLinkedin,
      privacyPolicy: privacyPolicy,
      termsCondition: termsCondition,
      disclaimer: disclaimer,
      phoneOtpType: phoneOtpType,
      defaultProductSizechartUk: defaultProductSizechartUk,
      defaultProductSizechartUs: defaultProductSizechartUs,
      wearhouseAddress: wearhouseAddress ??
          (clearUnsetFields ? UserShippingaddressInfoStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SettingsCompanyInfoStruct? updateSettingsCompanyInfoStruct(
  SettingsCompanyInfoStruct? settingsCompanyInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    settingsCompanyInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSettingsCompanyInfoStructData(
  Map<String, dynamic> firestoreData,
  SettingsCompanyInfoStruct? settingsCompanyInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (settingsCompanyInfo == null) {
    return;
  }
  if (settingsCompanyInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && settingsCompanyInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final settingsCompanyInfoData =
      getSettingsCompanyInfoFirestoreData(settingsCompanyInfo, forFieldValue);
  final nestedData =
      settingsCompanyInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      settingsCompanyInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSettingsCompanyInfoFirestoreData(
  SettingsCompanyInfoStruct? settingsCompanyInfo, [
  bool forFieldValue = false,
]) {
  if (settingsCompanyInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(settingsCompanyInfo.toMap());

  // Handle nested data for "wearhouse_address" field.
  addUserShippingaddressInfoStructData(
    firestoreData,
    settingsCompanyInfo.hasWearhouseAddress()
        ? settingsCompanyInfo.wearhouseAddress
        : null,
    'wearhouse_address',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(settingsCompanyInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSettingsCompanyInfoListFirestoreData(
  List<SettingsCompanyInfoStruct>? settingsCompanyInfos,
) =>
    settingsCompanyInfos
        ?.map((e) => getSettingsCompanyInfoFirestoreData(e, true))
        .toList() ??
    [];
