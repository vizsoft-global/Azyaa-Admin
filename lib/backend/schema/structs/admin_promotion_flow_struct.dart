// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminPromotionFlowStruct extends FFFirebaseStruct {
  AdminPromotionFlowStruct({
    int? userCount,
    int? promoCount,
    List<CreatorPromotionsStruct>? prmotionList,
    List<String>? promoId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userCount = userCount,
        _promoCount = promoCount,
        _prmotionList = prmotionList,
        _promoId = promoId,
        super(firestoreUtilData);

  // "userCount" field.
  int? _userCount;
  int get userCount => _userCount ?? 0;
  set userCount(int? val) => _userCount = val;

  void incrementUserCount(int amount) => userCount = userCount + amount;

  bool hasUserCount() => _userCount != null;

  // "promoCount" field.
  int? _promoCount;
  int get promoCount => _promoCount ?? 0;
  set promoCount(int? val) => _promoCount = val;

  void incrementPromoCount(int amount) => promoCount = promoCount + amount;

  bool hasPromoCount() => _promoCount != null;

  // "prmotionList" field.
  List<CreatorPromotionsStruct>? _prmotionList;
  List<CreatorPromotionsStruct> get prmotionList => _prmotionList ?? const [];
  set prmotionList(List<CreatorPromotionsStruct>? val) => _prmotionList = val;

  void updatePrmotionList(Function(List<CreatorPromotionsStruct>) updateFn) {
    updateFn(_prmotionList ??= []);
  }

  bool hasPrmotionList() => _prmotionList != null;

  // "promoId" field.
  List<String>? _promoId;
  List<String> get promoId => _promoId ?? const [];
  set promoId(List<String>? val) => _promoId = val;

  void updatePromoId(Function(List<String>) updateFn) {
    updateFn(_promoId ??= []);
  }

  bool hasPromoId() => _promoId != null;

  static AdminPromotionFlowStruct fromMap(Map<String, dynamic> data) =>
      AdminPromotionFlowStruct(
        userCount: castToType<int>(data['userCount']),
        promoCount: castToType<int>(data['promoCount']),
        prmotionList: getStructList(
          data['prmotionList'],
          CreatorPromotionsStruct.fromMap,
        ),
        promoId: getDataList(data['promoId']),
      );

  static AdminPromotionFlowStruct? maybeFromMap(dynamic data) => data is Map
      ? AdminPromotionFlowStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userCount': _userCount,
        'promoCount': _promoCount,
        'prmotionList': _prmotionList?.map((e) => e.toMap()).toList(),
        'promoId': _promoId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userCount': serializeParam(
          _userCount,
          ParamType.int,
        ),
        'promoCount': serializeParam(
          _promoCount,
          ParamType.int,
        ),
        'prmotionList': serializeParam(
          _prmotionList,
          ParamType.DataStruct,
          isList: true,
        ),
        'promoId': serializeParam(
          _promoId,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static AdminPromotionFlowStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AdminPromotionFlowStruct(
        userCount: deserializeParam(
          data['userCount'],
          ParamType.int,
          false,
        ),
        promoCount: deserializeParam(
          data['promoCount'],
          ParamType.int,
          false,
        ),
        prmotionList: deserializeStructParam<CreatorPromotionsStruct>(
          data['prmotionList'],
          ParamType.DataStruct,
          true,
          structBuilder: CreatorPromotionsStruct.fromSerializableMap,
        ),
        promoId: deserializeParam<String>(
          data['promoId'],
          ParamType.String,
          true,
        ),
      );

  static AdminPromotionFlowStruct fromAlgoliaData(Map<String, dynamic> data) =>
      AdminPromotionFlowStruct(
        userCount: convertAlgoliaParam(
          data['userCount'],
          ParamType.int,
          false,
        ),
        promoCount: convertAlgoliaParam(
          data['promoCount'],
          ParamType.int,
          false,
        ),
        prmotionList: convertAlgoliaParam<CreatorPromotionsStruct>(
          data['prmotionList'],
          ParamType.DataStruct,
          true,
          structBuilder: CreatorPromotionsStruct.fromAlgoliaData,
        ),
        promoId: convertAlgoliaParam<String>(
          data['promoId'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'AdminPromotionFlowStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AdminPromotionFlowStruct &&
        userCount == other.userCount &&
        promoCount == other.promoCount &&
        listEquality.equals(prmotionList, other.prmotionList) &&
        listEquality.equals(promoId, other.promoId);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([userCount, promoCount, prmotionList, promoId]);
}

AdminPromotionFlowStruct createAdminPromotionFlowStruct({
  int? userCount,
  int? promoCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AdminPromotionFlowStruct(
      userCount: userCount,
      promoCount: promoCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AdminPromotionFlowStruct? updateAdminPromotionFlowStruct(
  AdminPromotionFlowStruct? adminPromotionFlow, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    adminPromotionFlow
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAdminPromotionFlowStructData(
  Map<String, dynamic> firestoreData,
  AdminPromotionFlowStruct? adminPromotionFlow,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (adminPromotionFlow == null) {
    return;
  }
  if (adminPromotionFlow.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && adminPromotionFlow.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final adminPromotionFlowData =
      getAdminPromotionFlowFirestoreData(adminPromotionFlow, forFieldValue);
  final nestedData =
      adminPromotionFlowData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      adminPromotionFlow.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAdminPromotionFlowFirestoreData(
  AdminPromotionFlowStruct? adminPromotionFlow, [
  bool forFieldValue = false,
]) {
  if (adminPromotionFlow == null) {
    return {};
  }
  final firestoreData = mapToFirestore(adminPromotionFlow.toMap());

  // Add any Firestore field values
  mapToFirestore(adminPromotionFlow.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAdminPromotionFlowListFirestoreData(
  List<AdminPromotionFlowStruct>? adminPromotionFlows,
) =>
    adminPromotionFlows
        ?.map((e) => getAdminPromotionFlowFirestoreData(e, true))
        .toList() ??
    [];
