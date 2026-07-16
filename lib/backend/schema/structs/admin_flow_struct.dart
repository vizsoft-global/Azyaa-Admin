// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminFlowStruct extends FFFirebaseStruct {
  AdminFlowStruct({
    int? refresh,
    int? count,
    String? random,
    SettingsAppAccessStruct? settingsSecretFeature,
    ProductAEFlowStruct? product,
    String? secretCodeStatus,
    int? stockOnHand,
    String? notificationImageId,
    String? notificationImagePath,
    ThemeColourStruct? adminThemeAe,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _refresh = refresh,
        _count = count,
        _random = random,
        _settingsSecretFeature = settingsSecretFeature,
        _product = product,
        _secretCodeStatus = secretCodeStatus,
        _stockOnHand = stockOnHand,
        _notificationImageId = notificationImageId,
        _notificationImagePath = notificationImagePath,
        _adminThemeAe = adminThemeAe,
        super(firestoreUtilData);

  // "refresh" field.
  int? _refresh;
  int get refresh => _refresh ?? 0;
  set refresh(int? val) => _refresh = val;

  void incrementRefresh(int amount) => refresh = refresh + amount;

  bool hasRefresh() => _refresh != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  // "random" field.
  String? _random;
  String get random => _random ?? '';
  set random(String? val) => _random = val;

  bool hasRandom() => _random != null;

  // "settings_secret_feature" field.
  SettingsAppAccessStruct? _settingsSecretFeature;
  SettingsAppAccessStruct get settingsSecretFeature =>
      _settingsSecretFeature ?? SettingsAppAccessStruct();
  set settingsSecretFeature(SettingsAppAccessStruct? val) =>
      _settingsSecretFeature = val;

  void updateSettingsSecretFeature(Function(SettingsAppAccessStruct) updateFn) {
    updateFn(_settingsSecretFeature ??= SettingsAppAccessStruct());
  }

  bool hasSettingsSecretFeature() => _settingsSecretFeature != null;

  // "product" field.
  ProductAEFlowStruct? _product;
  ProductAEFlowStruct get product => _product ?? ProductAEFlowStruct();
  set product(ProductAEFlowStruct? val) => _product = val;

  void updateProduct(Function(ProductAEFlowStruct) updateFn) {
    updateFn(_product ??= ProductAEFlowStruct());
  }

  bool hasProduct() => _product != null;

  // "secret_code_status" field.
  String? _secretCodeStatus;
  String get secretCodeStatus => _secretCodeStatus ?? '';
  set secretCodeStatus(String? val) => _secretCodeStatus = val;

  bool hasSecretCodeStatus() => _secretCodeStatus != null;

  // "stock_on_hand" field.
  int? _stockOnHand;
  int get stockOnHand => _stockOnHand ?? 0;
  set stockOnHand(int? val) => _stockOnHand = val;

  void incrementStockOnHand(int amount) => stockOnHand = stockOnHand + amount;

  bool hasStockOnHand() => _stockOnHand != null;

  // "notification_imageId" field.
  String? _notificationImageId;
  String get notificationImageId => _notificationImageId ?? '';
  set notificationImageId(String? val) => _notificationImageId = val;

  bool hasNotificationImageId() => _notificationImageId != null;

  // "notification_image_path" field.
  String? _notificationImagePath;
  String get notificationImagePath => _notificationImagePath ?? '';
  set notificationImagePath(String? val) => _notificationImagePath = val;

  bool hasNotificationImagePath() => _notificationImagePath != null;

  // "admin_theme_ae" field.
  ThemeColourStruct? _adminThemeAe;
  ThemeColourStruct get adminThemeAe => _adminThemeAe ?? ThemeColourStruct();
  set adminThemeAe(ThemeColourStruct? val) => _adminThemeAe = val;

  void updateAdminThemeAe(Function(ThemeColourStruct) updateFn) {
    updateFn(_adminThemeAe ??= ThemeColourStruct());
  }

  bool hasAdminThemeAe() => _adminThemeAe != null;

  static AdminFlowStruct fromMap(Map<String, dynamic> data) => AdminFlowStruct(
        refresh: castToType<int>(data['refresh']),
        count: castToType<int>(data['count']),
        random: data['random'] as String?,
        settingsSecretFeature:
            data['settings_secret_feature'] is SettingsAppAccessStruct
                ? data['settings_secret_feature']
                : SettingsAppAccessStruct.maybeFromMap(
                    data['settings_secret_feature']),
        product: data['product'] is ProductAEFlowStruct
            ? data['product']
            : ProductAEFlowStruct.maybeFromMap(data['product']),
        secretCodeStatus: data['secret_code_status'] as String?,
        stockOnHand: castToType<int>(data['stock_on_hand']),
        notificationImageId: data['notification_imageId'] as String?,
        notificationImagePath: data['notification_image_path'] as String?,
        adminThemeAe: data['admin_theme_ae'] is ThemeColourStruct
            ? data['admin_theme_ae']
            : ThemeColourStruct.maybeFromMap(data['admin_theme_ae']),
      );

  static AdminFlowStruct? maybeFromMap(dynamic data) => data is Map
      ? AdminFlowStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'refresh': _refresh,
        'count': _count,
        'random': _random,
        'settings_secret_feature': _settingsSecretFeature?.toMap(),
        'product': _product?.toMap(),
        'secret_code_status': _secretCodeStatus,
        'stock_on_hand': _stockOnHand,
        'notification_imageId': _notificationImageId,
        'notification_image_path': _notificationImagePath,
        'admin_theme_ae': _adminThemeAe?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'refresh': serializeParam(
          _refresh,
          ParamType.int,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
        'random': serializeParam(
          _random,
          ParamType.String,
        ),
        'settings_secret_feature': serializeParam(
          _settingsSecretFeature,
          ParamType.DataStruct,
        ),
        'product': serializeParam(
          _product,
          ParamType.DataStruct,
        ),
        'secret_code_status': serializeParam(
          _secretCodeStatus,
          ParamType.String,
        ),
        'stock_on_hand': serializeParam(
          _stockOnHand,
          ParamType.int,
        ),
        'notification_imageId': serializeParam(
          _notificationImageId,
          ParamType.String,
        ),
        'notification_image_path': serializeParam(
          _notificationImagePath,
          ParamType.String,
        ),
        'admin_theme_ae': serializeParam(
          _adminThemeAe,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AdminFlowStruct fromSerializableMap(Map<String, dynamic> data) =>
      AdminFlowStruct(
        refresh: deserializeParam(
          data['refresh'],
          ParamType.int,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
        random: deserializeParam(
          data['random'],
          ParamType.String,
          false,
        ),
        settingsSecretFeature: deserializeStructParam(
          data['settings_secret_feature'],
          ParamType.DataStruct,
          false,
          structBuilder: SettingsAppAccessStruct.fromSerializableMap,
        ),
        product: deserializeStructParam(
          data['product'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductAEFlowStruct.fromSerializableMap,
        ),
        secretCodeStatus: deserializeParam(
          data['secret_code_status'],
          ParamType.String,
          false,
        ),
        stockOnHand: deserializeParam(
          data['stock_on_hand'],
          ParamType.int,
          false,
        ),
        notificationImageId: deserializeParam(
          data['notification_imageId'],
          ParamType.String,
          false,
        ),
        notificationImagePath: deserializeParam(
          data['notification_image_path'],
          ParamType.String,
          false,
        ),
        adminThemeAe: deserializeStructParam(
          data['admin_theme_ae'],
          ParamType.DataStruct,
          false,
          structBuilder: ThemeColourStruct.fromSerializableMap,
        ),
      );

  static AdminFlowStruct fromAlgoliaData(Map<String, dynamic> data) =>
      AdminFlowStruct(
        refresh: convertAlgoliaParam(
          data['refresh'],
          ParamType.int,
          false,
        ),
        count: convertAlgoliaParam(
          data['count'],
          ParamType.int,
          false,
        ),
        random: convertAlgoliaParam(
          data['random'],
          ParamType.String,
          false,
        ),
        settingsSecretFeature: convertAlgoliaParam(
          data['settings_secret_feature'],
          ParamType.DataStruct,
          false,
          structBuilder: SettingsAppAccessStruct.fromAlgoliaData,
        ),
        product: convertAlgoliaParam(
          data['product'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductAEFlowStruct.fromAlgoliaData,
        ),
        secretCodeStatus: convertAlgoliaParam(
          data['secret_code_status'],
          ParamType.String,
          false,
        ),
        stockOnHand: convertAlgoliaParam(
          data['stock_on_hand'],
          ParamType.int,
          false,
        ),
        notificationImageId: convertAlgoliaParam(
          data['notification_imageId'],
          ParamType.String,
          false,
        ),
        notificationImagePath: convertAlgoliaParam(
          data['notification_image_path'],
          ParamType.String,
          false,
        ),
        adminThemeAe: convertAlgoliaParam(
          data['admin_theme_ae'],
          ParamType.DataStruct,
          false,
          structBuilder: ThemeColourStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'AdminFlowStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdminFlowStruct &&
        refresh == other.refresh &&
        count == other.count &&
        random == other.random &&
        settingsSecretFeature == other.settingsSecretFeature &&
        product == other.product &&
        secretCodeStatus == other.secretCodeStatus &&
        stockOnHand == other.stockOnHand &&
        notificationImageId == other.notificationImageId &&
        notificationImagePath == other.notificationImagePath &&
        adminThemeAe == other.adminThemeAe;
  }

  @override
  int get hashCode => const ListEquality().hash([
        refresh,
        count,
        random,
        settingsSecretFeature,
        product,
        secretCodeStatus,
        stockOnHand,
        notificationImageId,
        notificationImagePath,
        adminThemeAe
      ]);
}

AdminFlowStruct createAdminFlowStruct({
  int? refresh,
  int? count,
  String? random,
  SettingsAppAccessStruct? settingsSecretFeature,
  ProductAEFlowStruct? product,
  String? secretCodeStatus,
  int? stockOnHand,
  String? notificationImageId,
  String? notificationImagePath,
  ThemeColourStruct? adminThemeAe,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AdminFlowStruct(
      refresh: refresh,
      count: count,
      random: random,
      settingsSecretFeature: settingsSecretFeature ??
          (clearUnsetFields ? SettingsAppAccessStruct() : null),
      product: product ?? (clearUnsetFields ? ProductAEFlowStruct() : null),
      secretCodeStatus: secretCodeStatus,
      stockOnHand: stockOnHand,
      notificationImageId: notificationImageId,
      notificationImagePath: notificationImagePath,
      adminThemeAe:
          adminThemeAe ?? (clearUnsetFields ? ThemeColourStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AdminFlowStruct? updateAdminFlowStruct(
  AdminFlowStruct? adminFlow, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    adminFlow
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAdminFlowStructData(
  Map<String, dynamic> firestoreData,
  AdminFlowStruct? adminFlow,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (adminFlow == null) {
    return;
  }
  if (adminFlow.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && adminFlow.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final adminFlowData = getAdminFlowFirestoreData(adminFlow, forFieldValue);
  final nestedData = adminFlowData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = adminFlow.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAdminFlowFirestoreData(
  AdminFlowStruct? adminFlow, [
  bool forFieldValue = false,
]) {
  if (adminFlow == null) {
    return {};
  }
  final firestoreData = mapToFirestore(adminFlow.toMap());

  // Handle nested data for "settings_secret_feature" field.
  addSettingsAppAccessStructData(
    firestoreData,
    adminFlow.hasSettingsSecretFeature()
        ? adminFlow.settingsSecretFeature
        : null,
    'settings_secret_feature',
    forFieldValue,
  );

  // Handle nested data for "product" field.
  addProductAEFlowStructData(
    firestoreData,
    adminFlow.hasProduct() ? adminFlow.product : null,
    'product',
    forFieldValue,
  );

  // Handle nested data for "admin_theme_ae" field.
  addThemeColourStructData(
    firestoreData,
    adminFlow.hasAdminThemeAe() ? adminFlow.adminThemeAe : null,
    'admin_theme_ae',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(adminFlow.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAdminFlowListFirestoreData(
  List<AdminFlowStruct>? adminFlows,
) =>
    adminFlows?.map((e) => getAdminFlowFirestoreData(e, true)).toList() ?? [];
