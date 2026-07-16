// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SettingsHiddenListStruct extends FFFirebaseStruct {
  SettingsHiddenListStruct({
    bool? isChangeLanguage,
    bool? isOrders,
    bool? isRewardsLoyalty,
    bool? isMemebership,
    bool? isGiftcardWallet,
    bool? isFaqHelp,
    bool? isStylistConsultation,
    bool? isDesignerConsultation,
    bool? isPreferredStyle,
    bool? isMyaddress,
    bool? isBodymeasurement,
    bool? isLogout,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isChangeLanguage = isChangeLanguage,
        _isOrders = isOrders,
        _isRewardsLoyalty = isRewardsLoyalty,
        _isMemebership = isMemebership,
        _isGiftcardWallet = isGiftcardWallet,
        _isFaqHelp = isFaqHelp,
        _isStylistConsultation = isStylistConsultation,
        _isDesignerConsultation = isDesignerConsultation,
        _isPreferredStyle = isPreferredStyle,
        _isMyaddress = isMyaddress,
        _isBodymeasurement = isBodymeasurement,
        _isLogout = isLogout,
        super(firestoreUtilData);

  // "is_change_language" field.
  bool? _isChangeLanguage;
  bool get isChangeLanguage => _isChangeLanguage ?? false;
  set isChangeLanguage(bool? val) => _isChangeLanguage = val;

  bool hasIsChangeLanguage() => _isChangeLanguage != null;

  // "is_orders" field.
  bool? _isOrders;
  bool get isOrders => _isOrders ?? false;
  set isOrders(bool? val) => _isOrders = val;

  bool hasIsOrders() => _isOrders != null;

  // "is_rewards_loyalty" field.
  bool? _isRewardsLoyalty;
  bool get isRewardsLoyalty => _isRewardsLoyalty ?? false;
  set isRewardsLoyalty(bool? val) => _isRewardsLoyalty = val;

  bool hasIsRewardsLoyalty() => _isRewardsLoyalty != null;

  // "is_memebership" field.
  bool? _isMemebership;
  bool get isMemebership => _isMemebership ?? false;
  set isMemebership(bool? val) => _isMemebership = val;

  bool hasIsMemebership() => _isMemebership != null;

  // "is_giftcard_wallet" field.
  bool? _isGiftcardWallet;
  bool get isGiftcardWallet => _isGiftcardWallet ?? false;
  set isGiftcardWallet(bool? val) => _isGiftcardWallet = val;

  bool hasIsGiftcardWallet() => _isGiftcardWallet != null;

  // "is_faq_help" field.
  bool? _isFaqHelp;
  bool get isFaqHelp => _isFaqHelp ?? false;
  set isFaqHelp(bool? val) => _isFaqHelp = val;

  bool hasIsFaqHelp() => _isFaqHelp != null;

  // "is_stylist_consultation" field.
  bool? _isStylistConsultation;
  bool get isStylistConsultation => _isStylistConsultation ?? false;
  set isStylistConsultation(bool? val) => _isStylistConsultation = val;

  bool hasIsStylistConsultation() => _isStylistConsultation != null;

  // "is_designer_consultation" field.
  bool? _isDesignerConsultation;
  bool get isDesignerConsultation => _isDesignerConsultation ?? false;
  set isDesignerConsultation(bool? val) => _isDesignerConsultation = val;

  bool hasIsDesignerConsultation() => _isDesignerConsultation != null;

  // "is_preferred_style" field.
  bool? _isPreferredStyle;
  bool get isPreferredStyle => _isPreferredStyle ?? false;
  set isPreferredStyle(bool? val) => _isPreferredStyle = val;

  bool hasIsPreferredStyle() => _isPreferredStyle != null;

  // "is_myaddress" field.
  bool? _isMyaddress;
  bool get isMyaddress => _isMyaddress ?? false;
  set isMyaddress(bool? val) => _isMyaddress = val;

  bool hasIsMyaddress() => _isMyaddress != null;

  // "is_bodymeasurement" field.
  bool? _isBodymeasurement;
  bool get isBodymeasurement => _isBodymeasurement ?? false;
  set isBodymeasurement(bool? val) => _isBodymeasurement = val;

  bool hasIsBodymeasurement() => _isBodymeasurement != null;

  // "is_logout" field.
  bool? _isLogout;
  bool get isLogout => _isLogout ?? false;
  set isLogout(bool? val) => _isLogout = val;

  bool hasIsLogout() => _isLogout != null;

  static SettingsHiddenListStruct fromMap(Map<String, dynamic> data) =>
      SettingsHiddenListStruct(
        isChangeLanguage: data['is_change_language'] as bool?,
        isOrders: data['is_orders'] as bool?,
        isRewardsLoyalty: data['is_rewards_loyalty'] as bool?,
        isMemebership: data['is_memebership'] as bool?,
        isGiftcardWallet: data['is_giftcard_wallet'] as bool?,
        isFaqHelp: data['is_faq_help'] as bool?,
        isStylistConsultation: data['is_stylist_consultation'] as bool?,
        isDesignerConsultation: data['is_designer_consultation'] as bool?,
        isPreferredStyle: data['is_preferred_style'] as bool?,
        isMyaddress: data['is_myaddress'] as bool?,
        isBodymeasurement: data['is_bodymeasurement'] as bool?,
        isLogout: data['is_logout'] as bool?,
      );

  static SettingsHiddenListStruct? maybeFromMap(dynamic data) => data is Map
      ? SettingsHiddenListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'is_change_language': _isChangeLanguage,
        'is_orders': _isOrders,
        'is_rewards_loyalty': _isRewardsLoyalty,
        'is_memebership': _isMemebership,
        'is_giftcard_wallet': _isGiftcardWallet,
        'is_faq_help': _isFaqHelp,
        'is_stylist_consultation': _isStylistConsultation,
        'is_designer_consultation': _isDesignerConsultation,
        'is_preferred_style': _isPreferredStyle,
        'is_myaddress': _isMyaddress,
        'is_bodymeasurement': _isBodymeasurement,
        'is_logout': _isLogout,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'is_change_language': serializeParam(
          _isChangeLanguage,
          ParamType.bool,
        ),
        'is_orders': serializeParam(
          _isOrders,
          ParamType.bool,
        ),
        'is_rewards_loyalty': serializeParam(
          _isRewardsLoyalty,
          ParamType.bool,
        ),
        'is_memebership': serializeParam(
          _isMemebership,
          ParamType.bool,
        ),
        'is_giftcard_wallet': serializeParam(
          _isGiftcardWallet,
          ParamType.bool,
        ),
        'is_faq_help': serializeParam(
          _isFaqHelp,
          ParamType.bool,
        ),
        'is_stylist_consultation': serializeParam(
          _isStylistConsultation,
          ParamType.bool,
        ),
        'is_designer_consultation': serializeParam(
          _isDesignerConsultation,
          ParamType.bool,
        ),
        'is_preferred_style': serializeParam(
          _isPreferredStyle,
          ParamType.bool,
        ),
        'is_myaddress': serializeParam(
          _isMyaddress,
          ParamType.bool,
        ),
        'is_bodymeasurement': serializeParam(
          _isBodymeasurement,
          ParamType.bool,
        ),
        'is_logout': serializeParam(
          _isLogout,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SettingsHiddenListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SettingsHiddenListStruct(
        isChangeLanguage: deserializeParam(
          data['is_change_language'],
          ParamType.bool,
          false,
        ),
        isOrders: deserializeParam(
          data['is_orders'],
          ParamType.bool,
          false,
        ),
        isRewardsLoyalty: deserializeParam(
          data['is_rewards_loyalty'],
          ParamType.bool,
          false,
        ),
        isMemebership: deserializeParam(
          data['is_memebership'],
          ParamType.bool,
          false,
        ),
        isGiftcardWallet: deserializeParam(
          data['is_giftcard_wallet'],
          ParamType.bool,
          false,
        ),
        isFaqHelp: deserializeParam(
          data['is_faq_help'],
          ParamType.bool,
          false,
        ),
        isStylistConsultation: deserializeParam(
          data['is_stylist_consultation'],
          ParamType.bool,
          false,
        ),
        isDesignerConsultation: deserializeParam(
          data['is_designer_consultation'],
          ParamType.bool,
          false,
        ),
        isPreferredStyle: deserializeParam(
          data['is_preferred_style'],
          ParamType.bool,
          false,
        ),
        isMyaddress: deserializeParam(
          data['is_myaddress'],
          ParamType.bool,
          false,
        ),
        isBodymeasurement: deserializeParam(
          data['is_bodymeasurement'],
          ParamType.bool,
          false,
        ),
        isLogout: deserializeParam(
          data['is_logout'],
          ParamType.bool,
          false,
        ),
      );

  static SettingsHiddenListStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SettingsHiddenListStruct(
        isChangeLanguage: convertAlgoliaParam(
          data['is_change_language'],
          ParamType.bool,
          false,
        ),
        isOrders: convertAlgoliaParam(
          data['is_orders'],
          ParamType.bool,
          false,
        ),
        isRewardsLoyalty: convertAlgoliaParam(
          data['is_rewards_loyalty'],
          ParamType.bool,
          false,
        ),
        isMemebership: convertAlgoliaParam(
          data['is_memebership'],
          ParamType.bool,
          false,
        ),
        isGiftcardWallet: convertAlgoliaParam(
          data['is_giftcard_wallet'],
          ParamType.bool,
          false,
        ),
        isFaqHelp: convertAlgoliaParam(
          data['is_faq_help'],
          ParamType.bool,
          false,
        ),
        isStylistConsultation: convertAlgoliaParam(
          data['is_stylist_consultation'],
          ParamType.bool,
          false,
        ),
        isDesignerConsultation: convertAlgoliaParam(
          data['is_designer_consultation'],
          ParamType.bool,
          false,
        ),
        isPreferredStyle: convertAlgoliaParam(
          data['is_preferred_style'],
          ParamType.bool,
          false,
        ),
        isMyaddress: convertAlgoliaParam(
          data['is_myaddress'],
          ParamType.bool,
          false,
        ),
        isBodymeasurement: convertAlgoliaParam(
          data['is_bodymeasurement'],
          ParamType.bool,
          false,
        ),
        isLogout: convertAlgoliaParam(
          data['is_logout'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SettingsHiddenListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SettingsHiddenListStruct &&
        isChangeLanguage == other.isChangeLanguage &&
        isOrders == other.isOrders &&
        isRewardsLoyalty == other.isRewardsLoyalty &&
        isMemebership == other.isMemebership &&
        isGiftcardWallet == other.isGiftcardWallet &&
        isFaqHelp == other.isFaqHelp &&
        isStylistConsultation == other.isStylistConsultation &&
        isDesignerConsultation == other.isDesignerConsultation &&
        isPreferredStyle == other.isPreferredStyle &&
        isMyaddress == other.isMyaddress &&
        isBodymeasurement == other.isBodymeasurement &&
        isLogout == other.isLogout;
  }

  @override
  int get hashCode => const ListEquality().hash([
        isChangeLanguage,
        isOrders,
        isRewardsLoyalty,
        isMemebership,
        isGiftcardWallet,
        isFaqHelp,
        isStylistConsultation,
        isDesignerConsultation,
        isPreferredStyle,
        isMyaddress,
        isBodymeasurement,
        isLogout
      ]);
}

SettingsHiddenListStruct createSettingsHiddenListStruct({
  bool? isChangeLanguage,
  bool? isOrders,
  bool? isRewardsLoyalty,
  bool? isMemebership,
  bool? isGiftcardWallet,
  bool? isFaqHelp,
  bool? isStylistConsultation,
  bool? isDesignerConsultation,
  bool? isPreferredStyle,
  bool? isMyaddress,
  bool? isBodymeasurement,
  bool? isLogout,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SettingsHiddenListStruct(
      isChangeLanguage: isChangeLanguage,
      isOrders: isOrders,
      isRewardsLoyalty: isRewardsLoyalty,
      isMemebership: isMemebership,
      isGiftcardWallet: isGiftcardWallet,
      isFaqHelp: isFaqHelp,
      isStylistConsultation: isStylistConsultation,
      isDesignerConsultation: isDesignerConsultation,
      isPreferredStyle: isPreferredStyle,
      isMyaddress: isMyaddress,
      isBodymeasurement: isBodymeasurement,
      isLogout: isLogout,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SettingsHiddenListStruct? updateSettingsHiddenListStruct(
  SettingsHiddenListStruct? settingsHiddenList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    settingsHiddenList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSettingsHiddenListStructData(
  Map<String, dynamic> firestoreData,
  SettingsHiddenListStruct? settingsHiddenList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (settingsHiddenList == null) {
    return;
  }
  if (settingsHiddenList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && settingsHiddenList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final settingsHiddenListData =
      getSettingsHiddenListFirestoreData(settingsHiddenList, forFieldValue);
  final nestedData =
      settingsHiddenListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      settingsHiddenList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSettingsHiddenListFirestoreData(
  SettingsHiddenListStruct? settingsHiddenList, [
  bool forFieldValue = false,
]) {
  if (settingsHiddenList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(settingsHiddenList.toMap());

  // Add any Firestore field values
  mapToFirestore(settingsHiddenList.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSettingsHiddenListListFirestoreData(
  List<SettingsHiddenListStruct>? settingsHiddenLists,
) =>
    settingsHiddenLists
        ?.map((e) => getSettingsHiddenListFirestoreData(e, true))
        .toList() ??
    [];
