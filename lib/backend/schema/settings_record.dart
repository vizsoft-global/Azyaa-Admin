import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingsRecord extends FirestoreRecord {
  SettingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "settings_company_info" field.
  SettingsCompanyInfoStruct? _settingsCompanyInfo;
  SettingsCompanyInfoStruct get settingsCompanyInfo =>
      _settingsCompanyInfo ?? SettingsCompanyInfoStruct();
  bool hasSettingsCompanyInfo() => _settingsCompanyInfo != null;

  // "settings_payment_info" field.
  List<SettingsPaymentInfoStruct>? _settingsPaymentInfo;
  List<SettingsPaymentInfoStruct> get settingsPaymentInfo =>
      _settingsPaymentInfo ?? const [];
  bool hasSettingsPaymentInfo() => _settingsPaymentInfo != null;

  // "settings_app_version_info" field.
  SettingsAppVersionInfoStruct? _settingsAppVersionInfo;
  SettingsAppVersionInfoStruct get settingsAppVersionInfo =>
      _settingsAppVersionInfo ?? SettingsAppVersionInfoStruct();
  bool hasSettingsAppVersionInfo() => _settingsAppVersionInfo != null;

  // "settings_app_theme_info" field.
  SettingsAppThemeInfoStruct? _settingsAppThemeInfo;
  SettingsAppThemeInfoStruct get settingsAppThemeInfo =>
      _settingsAppThemeInfo ?? SettingsAppThemeInfoStruct();
  bool hasSettingsAppThemeInfo() => _settingsAppThemeInfo != null;

  // "settings_hoilday_dates" field.
  List<DateTime>? _settingsHoildayDates;
  List<DateTime> get settingsHoildayDates => _settingsHoildayDates ?? const [];
  bool hasSettingsHoildayDates() => _settingsHoildayDates != null;

  // "settings_userapp_menu" field.
  SettingsHiddenListStruct? _settingsUserappMenu;
  SettingsHiddenListStruct get settingsUserappMenu =>
      _settingsUserappMenu ?? SettingsHiddenListStruct();
  bool hasSettingsUserappMenu() => _settingsUserappMenu != null;

  // "settings_working_hours" field.
  List<SettingsHiddenListStruct>? _settingsWorkingHours;
  List<SettingsHiddenListStruct> get settingsWorkingHours =>
      _settingsWorkingHours ?? const [];
  bool hasSettingsWorkingHours() => _settingsWorkingHours != null;

  // "settings_designer_reject_reasons" field.
  List<String>? _settingsDesignerRejectReasons;
  List<String> get settingsDesignerRejectReasons =>
      _settingsDesignerRejectReasons ?? const [];
  bool hasSettingsDesignerRejectReasons() =>
      _settingsDesignerRejectReasons != null;

  // "settings_creator_reject_reasons" field.
  List<String>? _settingsCreatorRejectReasons;
  List<String> get settingsCreatorRejectReasons =>
      _settingsCreatorRejectReasons ?? const [];
  bool hasSettingsCreatorRejectReasons() =>
      _settingsCreatorRejectReasons != null;

  // "settings_secret_feature" field.
  SettingsAppAccessStruct? _settingsSecretFeature;
  SettingsAppAccessStruct get settingsSecretFeature =>
      _settingsSecretFeature ?? SettingsAppAccessStruct();
  bool hasSettingsSecretFeature() => _settingsSecretFeature != null;

  // "settings_inapp_purchase_status" field.
  bool? _settingsInappPurchaseStatus;
  bool get settingsInappPurchaseStatus => _settingsInappPurchaseStatus ?? false;
  bool hasSettingsInappPurchaseStatus() => _settingsInappPurchaseStatus != null;

  // "settings_social_login" field.
  SocialLoginStruct? _settingsSocialLogin;
  SocialLoginStruct get settingsSocialLogin =>
      _settingsSocialLogin ?? SocialLoginStruct();
  bool hasSettingsSocialLogin() => _settingsSocialLogin != null;

  // "settings_home" field.
  SettingsHomeStruct? _settingsHome;
  SettingsHomeStruct get settingsHome => _settingsHome ?? SettingsHomeStruct();
  bool hasSettingsHome() => _settingsHome != null;

  // "settings_loyalty" field.
  SettingsLoyaltyStruct? _settingsLoyalty;
  SettingsLoyaltyStruct get settingsLoyalty =>
      _settingsLoyalty ?? SettingsLoyaltyStruct();
  bool hasSettingsLoyalty() => _settingsLoyalty != null;

  // "settings_custom_promotion_duration" field.
  int? _settingsCustomPromotionDuration;
  int get settingsCustomPromotionDuration =>
      _settingsCustomPromotionDuration ?? 0;
  bool hasSettingsCustomPromotionDuration() =>
      _settingsCustomPromotionDuration != null;

  // "settings_home_banner_list_manual" field.
  List<SettingsHomeBannerListStruct>? _settingsHomeBannerListManual;
  List<SettingsHomeBannerListStruct> get settingsHomeBannerListManual =>
      _settingsHomeBannerListManual ?? const [];
  bool hasSettingsHomeBannerListManual() =>
      _settingsHomeBannerListManual != null;

  // "settings_logistics_info" field.
  SettingsLogisticsInfoStruct? _settingsLogisticsInfo;
  SettingsLogisticsInfoStruct get settingsLogisticsInfo =>
      _settingsLogisticsInfo ?? SettingsLogisticsInfoStruct();
  bool hasSettingsLogisticsInfo() => _settingsLogisticsInfo != null;

  // "settings_otp_service" field.
  String? _settingsOtpService;
  String get settingsOtpService => _settingsOtpService ?? '';
  bool hasSettingsOtpService() => _settingsOtpService != null;

  // "settings_product" field.
  SettingsProductStruct? _settingsProduct;
  SettingsProductStruct get settingsProduct =>
      _settingsProduct ?? SettingsProductStruct();
  bool hasSettingsProduct() => _settingsProduct != null;

  // "main_theme_id" field.
  int? _mainThemeId;
  int get mainThemeId => _mainThemeId ?? 0;
  bool hasMainThemeId() => _mainThemeId != null;

  // "main_theme" field.
  ThemeColourStruct? _mainTheme;
  ThemeColourStruct get mainTheme => _mainTheme ?? ThemeColourStruct();
  bool hasMainTheme() => _mainTheme != null;

  // "setting_creator_banner_list_manual" field.
  List<SettingCreatorBannerListStruct>? _settingCreatorBannerListManual;
  List<SettingCreatorBannerListStruct> get settingCreatorBannerListManual =>
      _settingCreatorBannerListManual ?? const [];
  bool hasSettingCreatorBannerListManual() =>
      _settingCreatorBannerListManual != null;

  // "settings_phone_otp_status" field.
  bool? _settingsPhoneOtpStatus;
  bool get settingsPhoneOtpStatus => _settingsPhoneOtpStatus ?? false;
  bool hasSettingsPhoneOtpStatus() => _settingsPhoneOtpStatus != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _settingsCompanyInfo =
        snapshotData['settings_company_info'] is SettingsCompanyInfoStruct
            ? snapshotData['settings_company_info']
            : SettingsCompanyInfoStruct.maybeFromMap(
                snapshotData['settings_company_info']);
    _settingsPaymentInfo = getStructList(
      snapshotData['settings_payment_info'],
      SettingsPaymentInfoStruct.fromMap,
    );
    _settingsAppVersionInfo = snapshotData['settings_app_version_info']
            is SettingsAppVersionInfoStruct
        ? snapshotData['settings_app_version_info']
        : SettingsAppVersionInfoStruct.maybeFromMap(
            snapshotData['settings_app_version_info']);
    _settingsAppThemeInfo =
        snapshotData['settings_app_theme_info'] is SettingsAppThemeInfoStruct
            ? snapshotData['settings_app_theme_info']
            : SettingsAppThemeInfoStruct.maybeFromMap(
                snapshotData['settings_app_theme_info']);
    _settingsHoildayDates = getDataList(snapshotData['settings_hoilday_dates']);
    _settingsUserappMenu =
        snapshotData['settings_userapp_menu'] is SettingsHiddenListStruct
            ? snapshotData['settings_userapp_menu']
            : SettingsHiddenListStruct.maybeFromMap(
                snapshotData['settings_userapp_menu']);
    _settingsWorkingHours = getStructList(
      snapshotData['settings_working_hours'],
      SettingsHiddenListStruct.fromMap,
    );
    _settingsDesignerRejectReasons =
        getDataList(snapshotData['settings_designer_reject_reasons']);
    _settingsCreatorRejectReasons =
        getDataList(snapshotData['settings_creator_reject_reasons']);
    _settingsSecretFeature =
        snapshotData['settings_secret_feature'] is SettingsAppAccessStruct
            ? snapshotData['settings_secret_feature']
            : SettingsAppAccessStruct.maybeFromMap(
                snapshotData['settings_secret_feature']);
    _settingsInappPurchaseStatus =
        snapshotData['settings_inapp_purchase_status'] as bool?;
    _settingsSocialLogin = snapshotData['settings_social_login']
            is SocialLoginStruct
        ? snapshotData['settings_social_login']
        : SocialLoginStruct.maybeFromMap(snapshotData['settings_social_login']);
    _settingsHome = snapshotData['settings_home'] is SettingsHomeStruct
        ? snapshotData['settings_home']
        : SettingsHomeStruct.maybeFromMap(snapshotData['settings_home']);
    _settingsLoyalty = snapshotData['settings_loyalty'] is SettingsLoyaltyStruct
        ? snapshotData['settings_loyalty']
        : SettingsLoyaltyStruct.maybeFromMap(snapshotData['settings_loyalty']);
    _settingsCustomPromotionDuration =
        castToType<int>(snapshotData['settings_custom_promotion_duration']);
    _settingsHomeBannerListManual = getStructList(
      snapshotData['settings_home_banner_list_manual'],
      SettingsHomeBannerListStruct.fromMap,
    );
    _settingsLogisticsInfo =
        snapshotData['settings_logistics_info'] is SettingsLogisticsInfoStruct
            ? snapshotData['settings_logistics_info']
            : SettingsLogisticsInfoStruct.maybeFromMap(
                snapshotData['settings_logistics_info']);
    _settingsOtpService = snapshotData['settings_otp_service'] as String?;
    _settingsProduct = snapshotData['settings_product'] is SettingsProductStruct
        ? snapshotData['settings_product']
        : SettingsProductStruct.maybeFromMap(snapshotData['settings_product']);
    _mainThemeId = castToType<int>(snapshotData['main_theme_id']);
    _mainTheme = snapshotData['main_theme'] is ThemeColourStruct
        ? snapshotData['main_theme']
        : ThemeColourStruct.maybeFromMap(snapshotData['main_theme']);
    _settingCreatorBannerListManual = getStructList(
      snapshotData['setting_creator_banner_list_manual'],
      SettingCreatorBannerListStruct.fromMap,
    );
    _settingsPhoneOtpStatus =
        snapshotData['settings_phone_otp_status'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('settings');

  static Stream<SettingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SettingsRecord.fromSnapshot(s));

  static Future<SettingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SettingsRecord.fromSnapshot(s));

  static SettingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SettingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SettingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SettingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SettingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SettingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSettingsRecordData({
  String? type,
  SettingsCompanyInfoStruct? settingsCompanyInfo,
  SettingsAppVersionInfoStruct? settingsAppVersionInfo,
  SettingsAppThemeInfoStruct? settingsAppThemeInfo,
  SettingsHiddenListStruct? settingsUserappMenu,
  SettingsAppAccessStruct? settingsSecretFeature,
  bool? settingsInappPurchaseStatus,
  SocialLoginStruct? settingsSocialLogin,
  SettingsHomeStruct? settingsHome,
  SettingsLoyaltyStruct? settingsLoyalty,
  int? settingsCustomPromotionDuration,
  SettingsLogisticsInfoStruct? settingsLogisticsInfo,
  String? settingsOtpService,
  SettingsProductStruct? settingsProduct,
  int? mainThemeId,
  ThemeColourStruct? mainTheme,
  bool? settingsPhoneOtpStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'settings_company_info': SettingsCompanyInfoStruct().toMap(),
      'settings_app_version_info': SettingsAppVersionInfoStruct().toMap(),
      'settings_app_theme_info': SettingsAppThemeInfoStruct().toMap(),
      'settings_userapp_menu': SettingsHiddenListStruct().toMap(),
      'settings_secret_feature': SettingsAppAccessStruct().toMap(),
      'settings_inapp_purchase_status': settingsInappPurchaseStatus,
      'settings_social_login': SocialLoginStruct().toMap(),
      'settings_home': SettingsHomeStruct().toMap(),
      'settings_loyalty': SettingsLoyaltyStruct().toMap(),
      'settings_custom_promotion_duration': settingsCustomPromotionDuration,
      'settings_logistics_info': SettingsLogisticsInfoStruct().toMap(),
      'settings_otp_service': settingsOtpService,
      'settings_product': SettingsProductStruct().toMap(),
      'main_theme_id': mainThemeId,
      'main_theme': ThemeColourStruct().toMap(),
      'settings_phone_otp_status': settingsPhoneOtpStatus,
    }.withoutNulls,
  );

  // Handle nested data for "settings_company_info" field.
  addSettingsCompanyInfoStructData(
      firestoreData, settingsCompanyInfo, 'settings_company_info');

  // Handle nested data for "settings_app_version_info" field.
  addSettingsAppVersionInfoStructData(
      firestoreData, settingsAppVersionInfo, 'settings_app_version_info');

  // Handle nested data for "settings_app_theme_info" field.
  addSettingsAppThemeInfoStructData(
      firestoreData, settingsAppThemeInfo, 'settings_app_theme_info');

  // Handle nested data for "settings_userapp_menu" field.
  addSettingsHiddenListStructData(
      firestoreData, settingsUserappMenu, 'settings_userapp_menu');

  // Handle nested data for "settings_secret_feature" field.
  addSettingsAppAccessStructData(
      firestoreData, settingsSecretFeature, 'settings_secret_feature');

  // Handle nested data for "settings_social_login" field.
  addSocialLoginStructData(
      firestoreData, settingsSocialLogin, 'settings_social_login');

  // Handle nested data for "settings_home" field.
  addSettingsHomeStructData(firestoreData, settingsHome, 'settings_home');

  // Handle nested data for "settings_loyalty" field.
  addSettingsLoyaltyStructData(
      firestoreData, settingsLoyalty, 'settings_loyalty');

  // Handle nested data for "settings_logistics_info" field.
  addSettingsLogisticsInfoStructData(
      firestoreData, settingsLogisticsInfo, 'settings_logistics_info');

  // Handle nested data for "settings_product" field.
  addSettingsProductStructData(
      firestoreData, settingsProduct, 'settings_product');

  // Handle nested data for "main_theme" field.
  addThemeColourStructData(firestoreData, mainTheme, 'main_theme');

  return firestoreData;
}

class SettingsRecordDocumentEquality implements Equality<SettingsRecord> {
  const SettingsRecordDocumentEquality();

  @override
  bool equals(SettingsRecord? e1, SettingsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.type == e2?.type &&
        e1?.settingsCompanyInfo == e2?.settingsCompanyInfo &&
        listEquality.equals(e1?.settingsPaymentInfo, e2?.settingsPaymentInfo) &&
        e1?.settingsAppVersionInfo == e2?.settingsAppVersionInfo &&
        e1?.settingsAppThemeInfo == e2?.settingsAppThemeInfo &&
        listEquality.equals(
            e1?.settingsHoildayDates, e2?.settingsHoildayDates) &&
        e1?.settingsUserappMenu == e2?.settingsUserappMenu &&
        listEquality.equals(
            e1?.settingsWorkingHours, e2?.settingsWorkingHours) &&
        listEquality.equals(e1?.settingsDesignerRejectReasons,
            e2?.settingsDesignerRejectReasons) &&
        listEquality.equals(e1?.settingsCreatorRejectReasons,
            e2?.settingsCreatorRejectReasons) &&
        e1?.settingsSecretFeature == e2?.settingsSecretFeature &&
        e1?.settingsInappPurchaseStatus == e2?.settingsInappPurchaseStatus &&
        e1?.settingsSocialLogin == e2?.settingsSocialLogin &&
        e1?.settingsHome == e2?.settingsHome &&
        e1?.settingsLoyalty == e2?.settingsLoyalty &&
        e1?.settingsCustomPromotionDuration ==
            e2?.settingsCustomPromotionDuration &&
        listEquality.equals(e1?.settingsHomeBannerListManual,
            e2?.settingsHomeBannerListManual) &&
        e1?.settingsLogisticsInfo == e2?.settingsLogisticsInfo &&
        e1?.settingsOtpService == e2?.settingsOtpService &&
        e1?.settingsProduct == e2?.settingsProduct &&
        e1?.mainThemeId == e2?.mainThemeId &&
        e1?.mainTheme == e2?.mainTheme &&
        listEquality.equals(e1?.settingCreatorBannerListManual,
            e2?.settingCreatorBannerListManual) &&
        e1?.settingsPhoneOtpStatus == e2?.settingsPhoneOtpStatus;
  }

  @override
  int hash(SettingsRecord? e) => const ListEquality().hash([
        e?.type,
        e?.settingsCompanyInfo,
        e?.settingsPaymentInfo,
        e?.settingsAppVersionInfo,
        e?.settingsAppThemeInfo,
        e?.settingsHoildayDates,
        e?.settingsUserappMenu,
        e?.settingsWorkingHours,
        e?.settingsDesignerRejectReasons,
        e?.settingsCreatorRejectReasons,
        e?.settingsSecretFeature,
        e?.settingsInappPurchaseStatus,
        e?.settingsSocialLogin,
        e?.settingsHome,
        e?.settingsLoyalty,
        e?.settingsCustomPromotionDuration,
        e?.settingsHomeBannerListManual,
        e?.settingsLogisticsInfo,
        e?.settingsOtpService,
        e?.settingsProduct,
        e?.mainThemeId,
        e?.mainTheme,
        e?.settingCreatorBannerListManual,
        e?.settingsPhoneOtpStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is SettingsRecord;
}
