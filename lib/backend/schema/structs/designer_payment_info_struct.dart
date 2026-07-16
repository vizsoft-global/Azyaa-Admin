// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DesignerPaymentInfoStruct extends FFFirebaseStruct {
  DesignerPaymentInfoStruct({
    String? designerPaymentId,
    DesignerApprovalsStruct? designerUserRef,
    String? designerPrimaryPaymentType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _designerPaymentId = designerPaymentId,
        _designerUserRef = designerUserRef,
        _designerPrimaryPaymentType = designerPrimaryPaymentType,
        super(firestoreUtilData);

  // "designer_payment_id" field.
  String? _designerPaymentId;
  String get designerPaymentId => _designerPaymentId ?? '';
  set designerPaymentId(String? val) => _designerPaymentId = val;

  bool hasDesignerPaymentId() => _designerPaymentId != null;

  // "designer_user_ref" field.
  DesignerApprovalsStruct? _designerUserRef;
  DesignerApprovalsStruct get designerUserRef =>
      _designerUserRef ?? DesignerApprovalsStruct();
  set designerUserRef(DesignerApprovalsStruct? val) => _designerUserRef = val;

  void updateDesignerUserRef(Function(DesignerApprovalsStruct) updateFn) {
    updateFn(_designerUserRef ??= DesignerApprovalsStruct());
  }

  bool hasDesignerUserRef() => _designerUserRef != null;

  // "designer_primary_payment_type" field.
  String? _designerPrimaryPaymentType;
  String get designerPrimaryPaymentType => _designerPrimaryPaymentType ?? '';
  set designerPrimaryPaymentType(String? val) =>
      _designerPrimaryPaymentType = val;

  bool hasDesignerPrimaryPaymentType() => _designerPrimaryPaymentType != null;

  static DesignerPaymentInfoStruct fromMap(Map<String, dynamic> data) =>
      DesignerPaymentInfoStruct(
        designerPaymentId: data['designer_payment_id'] as String?,
        designerUserRef: data['designer_user_ref'] is DesignerApprovalsStruct
            ? data['designer_user_ref']
            : DesignerApprovalsStruct.maybeFromMap(data['designer_user_ref']),
        designerPrimaryPaymentType:
            data['designer_primary_payment_type'] as String?,
      );

  static DesignerPaymentInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? DesignerPaymentInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'designer_payment_id': _designerPaymentId,
        'designer_user_ref': _designerUserRef?.toMap(),
        'designer_primary_payment_type': _designerPrimaryPaymentType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'designer_payment_id': serializeParam(
          _designerPaymentId,
          ParamType.String,
        ),
        'designer_user_ref': serializeParam(
          _designerUserRef,
          ParamType.DataStruct,
        ),
        'designer_primary_payment_type': serializeParam(
          _designerPrimaryPaymentType,
          ParamType.String,
        ),
      }.withoutNulls;

  static DesignerPaymentInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DesignerPaymentInfoStruct(
        designerPaymentId: deserializeParam(
          data['designer_payment_id'],
          ParamType.String,
          false,
        ),
        designerUserRef: deserializeStructParam(
          data['designer_user_ref'],
          ParamType.DataStruct,
          false,
          structBuilder: DesignerApprovalsStruct.fromSerializableMap,
        ),
        designerPrimaryPaymentType: deserializeParam(
          data['designer_primary_payment_type'],
          ParamType.String,
          false,
        ),
      );

  static DesignerPaymentInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DesignerPaymentInfoStruct(
        designerPaymentId: convertAlgoliaParam(
          data['designer_payment_id'],
          ParamType.String,
          false,
        ),
        designerUserRef: convertAlgoliaParam(
          data['designer_user_ref'],
          ParamType.DataStruct,
          false,
          structBuilder: DesignerApprovalsStruct.fromAlgoliaData,
        ),
        designerPrimaryPaymentType: convertAlgoliaParam(
          data['designer_primary_payment_type'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DesignerPaymentInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DesignerPaymentInfoStruct &&
        designerPaymentId == other.designerPaymentId &&
        designerUserRef == other.designerUserRef &&
        designerPrimaryPaymentType == other.designerPrimaryPaymentType;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([designerPaymentId, designerUserRef, designerPrimaryPaymentType]);
}

DesignerPaymentInfoStruct createDesignerPaymentInfoStruct({
  String? designerPaymentId,
  DesignerApprovalsStruct? designerUserRef,
  String? designerPrimaryPaymentType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DesignerPaymentInfoStruct(
      designerPaymentId: designerPaymentId,
      designerUserRef: designerUserRef ??
          (clearUnsetFields ? DesignerApprovalsStruct() : null),
      designerPrimaryPaymentType: designerPrimaryPaymentType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DesignerPaymentInfoStruct? updateDesignerPaymentInfoStruct(
  DesignerPaymentInfoStruct? designerPaymentInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    designerPaymentInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDesignerPaymentInfoStructData(
  Map<String, dynamic> firestoreData,
  DesignerPaymentInfoStruct? designerPaymentInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (designerPaymentInfo == null) {
    return;
  }
  if (designerPaymentInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && designerPaymentInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final designerPaymentInfoData =
      getDesignerPaymentInfoFirestoreData(designerPaymentInfo, forFieldValue);
  final nestedData =
      designerPaymentInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      designerPaymentInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDesignerPaymentInfoFirestoreData(
  DesignerPaymentInfoStruct? designerPaymentInfo, [
  bool forFieldValue = false,
]) {
  if (designerPaymentInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(designerPaymentInfo.toMap());

  // Handle nested data for "designer_user_ref" field.
  addDesignerApprovalsStructData(
    firestoreData,
    designerPaymentInfo.hasDesignerUserRef()
        ? designerPaymentInfo.designerUserRef
        : null,
    'designer_user_ref',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(designerPaymentInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDesignerPaymentInfoListFirestoreData(
  List<DesignerPaymentInfoStruct>? designerPaymentInfos,
) =>
    designerPaymentInfos
        ?.map((e) => getDesignerPaymentInfoFirestoreData(e, true))
        .toList() ??
    [];
