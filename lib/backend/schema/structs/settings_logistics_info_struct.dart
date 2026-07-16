// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SettingsLogisticsInfoStruct extends FFFirebaseStruct {
  SettingsLogisticsInfoStruct({
    String? environment,
    String? testKey,
    DateTime? testKeyValidTime,
    String? prodKey,
    DateTime? prodKeyValidTime,
    String? carrier,
    String? serviceType,
    String? shippingTime,
    int? shippingTimeDuration,
    String? trackingUrl,
    double? shippingChargeKuwait,
    double? shippingChargeGcc,
    double? shippingChargeGccExtra,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _environment = environment,
        _testKey = testKey,
        _testKeyValidTime = testKeyValidTime,
        _prodKey = prodKey,
        _prodKeyValidTime = prodKeyValidTime,
        _carrier = carrier,
        _serviceType = serviceType,
        _shippingTime = shippingTime,
        _shippingTimeDuration = shippingTimeDuration,
        _trackingUrl = trackingUrl,
        _shippingChargeKuwait = shippingChargeKuwait,
        _shippingChargeGcc = shippingChargeGcc,
        _shippingChargeGccExtra = shippingChargeGccExtra,
        super(firestoreUtilData);

  // "Environment" field.
  String? _environment;
  String get environment => _environment ?? '';
  set environment(String? val) => _environment = val;

  bool hasEnvironment() => _environment != null;

  // "test_key" field.
  String? _testKey;
  String get testKey => _testKey ?? '';
  set testKey(String? val) => _testKey = val;

  bool hasTestKey() => _testKey != null;

  // "test_key_valid_time" field.
  DateTime? _testKeyValidTime;
  DateTime? get testKeyValidTime => _testKeyValidTime;
  set testKeyValidTime(DateTime? val) => _testKeyValidTime = val;

  bool hasTestKeyValidTime() => _testKeyValidTime != null;

  // "prod_key" field.
  String? _prodKey;
  String get prodKey => _prodKey ?? '';
  set prodKey(String? val) => _prodKey = val;

  bool hasProdKey() => _prodKey != null;

  // "prod_key_valid_time" field.
  DateTime? _prodKeyValidTime;
  DateTime? get prodKeyValidTime => _prodKeyValidTime;
  set prodKeyValidTime(DateTime? val) => _prodKeyValidTime = val;

  bool hasProdKeyValidTime() => _prodKeyValidTime != null;

  // "carrier" field.
  String? _carrier;
  String get carrier => _carrier ?? '';
  set carrier(String? val) => _carrier = val;

  bool hasCarrier() => _carrier != null;

  // "service_type" field.
  String? _serviceType;
  String get serviceType => _serviceType ?? '';
  set serviceType(String? val) => _serviceType = val;

  bool hasServiceType() => _serviceType != null;

  // "shipping_time" field.
  String? _shippingTime;
  String get shippingTime => _shippingTime ?? '';
  set shippingTime(String? val) => _shippingTime = val;

  bool hasShippingTime() => _shippingTime != null;

  // "shipping_time_duration" field.
  int? _shippingTimeDuration;
  int get shippingTimeDuration => _shippingTimeDuration ?? 0;
  set shippingTimeDuration(int? val) => _shippingTimeDuration = val;

  void incrementShippingTimeDuration(int amount) =>
      shippingTimeDuration = shippingTimeDuration + amount;

  bool hasShippingTimeDuration() => _shippingTimeDuration != null;

  // "tracking_url" field.
  String? _trackingUrl;
  String get trackingUrl => _trackingUrl ?? '';
  set trackingUrl(String? val) => _trackingUrl = val;

  bool hasTrackingUrl() => _trackingUrl != null;

  // "shipping_charge_kuwait" field.
  double? _shippingChargeKuwait;
  double get shippingChargeKuwait => _shippingChargeKuwait ?? 0.0;
  set shippingChargeKuwait(double? val) => _shippingChargeKuwait = val;

  void incrementShippingChargeKuwait(double amount) =>
      shippingChargeKuwait = shippingChargeKuwait + amount;

  bool hasShippingChargeKuwait() => _shippingChargeKuwait != null;

  // "shipping_charge_gcc" field.
  double? _shippingChargeGcc;
  double get shippingChargeGcc => _shippingChargeGcc ?? 0.0;
  set shippingChargeGcc(double? val) => _shippingChargeGcc = val;

  void incrementShippingChargeGcc(double amount) =>
      shippingChargeGcc = shippingChargeGcc + amount;

  bool hasShippingChargeGcc() => _shippingChargeGcc != null;

  // "shipping_charge_gcc_extra" field.
  double? _shippingChargeGccExtra;
  double get shippingChargeGccExtra => _shippingChargeGccExtra ?? 0.0;
  set shippingChargeGccExtra(double? val) => _shippingChargeGccExtra = val;

  void incrementShippingChargeGccExtra(double amount) =>
      shippingChargeGccExtra = shippingChargeGccExtra + amount;

  bool hasShippingChargeGccExtra() => _shippingChargeGccExtra != null;

  static SettingsLogisticsInfoStruct fromMap(Map<String, dynamic> data) =>
      SettingsLogisticsInfoStruct(
        environment: data['Environment'] as String?,
        testKey: data['test_key'] as String?,
        testKeyValidTime: data['test_key_valid_time'] as DateTime?,
        prodKey: data['prod_key'] as String?,
        prodKeyValidTime: data['prod_key_valid_time'] as DateTime?,
        carrier: data['carrier'] as String?,
        serviceType: data['service_type'] as String?,
        shippingTime: data['shipping_time'] as String?,
        shippingTimeDuration: castToType<int>(data['shipping_time_duration']),
        trackingUrl: data['tracking_url'] as String?,
        shippingChargeKuwait:
            castToType<double>(data['shipping_charge_kuwait']),
        shippingChargeGcc: castToType<double>(data['shipping_charge_gcc']),
        shippingChargeGccExtra:
            castToType<double>(data['shipping_charge_gcc_extra']),
      );

  static SettingsLogisticsInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? SettingsLogisticsInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Environment': _environment,
        'test_key': _testKey,
        'test_key_valid_time': _testKeyValidTime,
        'prod_key': _prodKey,
        'prod_key_valid_time': _prodKeyValidTime,
        'carrier': _carrier,
        'service_type': _serviceType,
        'shipping_time': _shippingTime,
        'shipping_time_duration': _shippingTimeDuration,
        'tracking_url': _trackingUrl,
        'shipping_charge_kuwait': _shippingChargeKuwait,
        'shipping_charge_gcc': _shippingChargeGcc,
        'shipping_charge_gcc_extra': _shippingChargeGccExtra,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Environment': serializeParam(
          _environment,
          ParamType.String,
        ),
        'test_key': serializeParam(
          _testKey,
          ParamType.String,
        ),
        'test_key_valid_time': serializeParam(
          _testKeyValidTime,
          ParamType.DateTime,
        ),
        'prod_key': serializeParam(
          _prodKey,
          ParamType.String,
        ),
        'prod_key_valid_time': serializeParam(
          _prodKeyValidTime,
          ParamType.DateTime,
        ),
        'carrier': serializeParam(
          _carrier,
          ParamType.String,
        ),
        'service_type': serializeParam(
          _serviceType,
          ParamType.String,
        ),
        'shipping_time': serializeParam(
          _shippingTime,
          ParamType.String,
        ),
        'shipping_time_duration': serializeParam(
          _shippingTimeDuration,
          ParamType.int,
        ),
        'tracking_url': serializeParam(
          _trackingUrl,
          ParamType.String,
        ),
        'shipping_charge_kuwait': serializeParam(
          _shippingChargeKuwait,
          ParamType.double,
        ),
        'shipping_charge_gcc': serializeParam(
          _shippingChargeGcc,
          ParamType.double,
        ),
        'shipping_charge_gcc_extra': serializeParam(
          _shippingChargeGccExtra,
          ParamType.double,
        ),
      }.withoutNulls;

  static SettingsLogisticsInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SettingsLogisticsInfoStruct(
        environment: deserializeParam(
          data['Environment'],
          ParamType.String,
          false,
        ),
        testKey: deserializeParam(
          data['test_key'],
          ParamType.String,
          false,
        ),
        testKeyValidTime: deserializeParam(
          data['test_key_valid_time'],
          ParamType.DateTime,
          false,
        ),
        prodKey: deserializeParam(
          data['prod_key'],
          ParamType.String,
          false,
        ),
        prodKeyValidTime: deserializeParam(
          data['prod_key_valid_time'],
          ParamType.DateTime,
          false,
        ),
        carrier: deserializeParam(
          data['carrier'],
          ParamType.String,
          false,
        ),
        serviceType: deserializeParam(
          data['service_type'],
          ParamType.String,
          false,
        ),
        shippingTime: deserializeParam(
          data['shipping_time'],
          ParamType.String,
          false,
        ),
        shippingTimeDuration: deserializeParam(
          data['shipping_time_duration'],
          ParamType.int,
          false,
        ),
        trackingUrl: deserializeParam(
          data['tracking_url'],
          ParamType.String,
          false,
        ),
        shippingChargeKuwait: deserializeParam(
          data['shipping_charge_kuwait'],
          ParamType.double,
          false,
        ),
        shippingChargeGcc: deserializeParam(
          data['shipping_charge_gcc'],
          ParamType.double,
          false,
        ),
        shippingChargeGccExtra: deserializeParam(
          data['shipping_charge_gcc_extra'],
          ParamType.double,
          false,
        ),
      );

  static SettingsLogisticsInfoStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      SettingsLogisticsInfoStruct(
        environment: convertAlgoliaParam(
          data['Environment'],
          ParamType.String,
          false,
        ),
        testKey: convertAlgoliaParam(
          data['test_key'],
          ParamType.String,
          false,
        ),
        testKeyValidTime: convertAlgoliaParam(
          data['test_key_valid_time'],
          ParamType.DateTime,
          false,
        ),
        prodKey: convertAlgoliaParam(
          data['prod_key'],
          ParamType.String,
          false,
        ),
        prodKeyValidTime: convertAlgoliaParam(
          data['prod_key_valid_time'],
          ParamType.DateTime,
          false,
        ),
        carrier: convertAlgoliaParam(
          data['carrier'],
          ParamType.String,
          false,
        ),
        serviceType: convertAlgoliaParam(
          data['service_type'],
          ParamType.String,
          false,
        ),
        shippingTime: convertAlgoliaParam(
          data['shipping_time'],
          ParamType.String,
          false,
        ),
        shippingTimeDuration: convertAlgoliaParam(
          data['shipping_time_duration'],
          ParamType.int,
          false,
        ),
        trackingUrl: convertAlgoliaParam(
          data['tracking_url'],
          ParamType.String,
          false,
        ),
        shippingChargeKuwait: convertAlgoliaParam(
          data['shipping_charge_kuwait'],
          ParamType.double,
          false,
        ),
        shippingChargeGcc: convertAlgoliaParam(
          data['shipping_charge_gcc'],
          ParamType.double,
          false,
        ),
        shippingChargeGccExtra: convertAlgoliaParam(
          data['shipping_charge_gcc_extra'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SettingsLogisticsInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SettingsLogisticsInfoStruct &&
        environment == other.environment &&
        testKey == other.testKey &&
        testKeyValidTime == other.testKeyValidTime &&
        prodKey == other.prodKey &&
        prodKeyValidTime == other.prodKeyValidTime &&
        carrier == other.carrier &&
        serviceType == other.serviceType &&
        shippingTime == other.shippingTime &&
        shippingTimeDuration == other.shippingTimeDuration &&
        trackingUrl == other.trackingUrl &&
        shippingChargeKuwait == other.shippingChargeKuwait &&
        shippingChargeGcc == other.shippingChargeGcc &&
        shippingChargeGccExtra == other.shippingChargeGccExtra;
  }

  @override
  int get hashCode => const ListEquality().hash([
        environment,
        testKey,
        testKeyValidTime,
        prodKey,
        prodKeyValidTime,
        carrier,
        serviceType,
        shippingTime,
        shippingTimeDuration,
        trackingUrl,
        shippingChargeKuwait,
        shippingChargeGcc,
        shippingChargeGccExtra
      ]);
}

SettingsLogisticsInfoStruct createSettingsLogisticsInfoStruct({
  String? environment,
  String? testKey,
  DateTime? testKeyValidTime,
  String? prodKey,
  DateTime? prodKeyValidTime,
  String? carrier,
  String? serviceType,
  String? shippingTime,
  int? shippingTimeDuration,
  String? trackingUrl,
  double? shippingChargeKuwait,
  double? shippingChargeGcc,
  double? shippingChargeGccExtra,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SettingsLogisticsInfoStruct(
      environment: environment,
      testKey: testKey,
      testKeyValidTime: testKeyValidTime,
      prodKey: prodKey,
      prodKeyValidTime: prodKeyValidTime,
      carrier: carrier,
      serviceType: serviceType,
      shippingTime: shippingTime,
      shippingTimeDuration: shippingTimeDuration,
      trackingUrl: trackingUrl,
      shippingChargeKuwait: shippingChargeKuwait,
      shippingChargeGcc: shippingChargeGcc,
      shippingChargeGccExtra: shippingChargeGccExtra,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SettingsLogisticsInfoStruct? updateSettingsLogisticsInfoStruct(
  SettingsLogisticsInfoStruct? settingsLogisticsInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    settingsLogisticsInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSettingsLogisticsInfoStructData(
  Map<String, dynamic> firestoreData,
  SettingsLogisticsInfoStruct? settingsLogisticsInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (settingsLogisticsInfo == null) {
    return;
  }
  if (settingsLogisticsInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      settingsLogisticsInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final settingsLogisticsInfoData = getSettingsLogisticsInfoFirestoreData(
      settingsLogisticsInfo, forFieldValue);
  final nestedData =
      settingsLogisticsInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      settingsLogisticsInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSettingsLogisticsInfoFirestoreData(
  SettingsLogisticsInfoStruct? settingsLogisticsInfo, [
  bool forFieldValue = false,
]) {
  if (settingsLogisticsInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(settingsLogisticsInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(settingsLogisticsInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSettingsLogisticsInfoListFirestoreData(
  List<SettingsLogisticsInfoStruct>? settingsLogisticsInfos,
) =>
    settingsLogisticsInfos
        ?.map((e) => getSettingsLogisticsInfoFirestoreData(e, true))
        .toList() ??
    [];
