// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MovementInfoStruct extends FFFirebaseStruct {
  MovementInfoStruct({
    DateTime? movementDate,
    String? movementInfo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _movementDate = movementDate,
        _movementInfo = movementInfo,
        super(firestoreUtilData);

  // "movement_date" field.
  DateTime? _movementDate;
  DateTime? get movementDate => _movementDate;
  set movementDate(DateTime? val) => _movementDate = val;

  bool hasMovementDate() => _movementDate != null;

  // "movement_info" field.
  String? _movementInfo;
  String get movementInfo => _movementInfo ?? '';
  set movementInfo(String? val) => _movementInfo = val;

  bool hasMovementInfo() => _movementInfo != null;

  static MovementInfoStruct fromMap(Map<String, dynamic> data) =>
      MovementInfoStruct(
        movementDate: data['movement_date'] as DateTime?,
        movementInfo: data['movement_info'] as String?,
      );

  static MovementInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? MovementInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'movement_date': _movementDate,
        'movement_info': _movementInfo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'movement_date': serializeParam(
          _movementDate,
          ParamType.DateTime,
        ),
        'movement_info': serializeParam(
          _movementInfo,
          ParamType.String,
        ),
      }.withoutNulls;

  static MovementInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      MovementInfoStruct(
        movementDate: deserializeParam(
          data['movement_date'],
          ParamType.DateTime,
          false,
        ),
        movementInfo: deserializeParam(
          data['movement_info'],
          ParamType.String,
          false,
        ),
      );

  static MovementInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      MovementInfoStruct(
        movementDate: convertAlgoliaParam(
          data['movement_date'],
          ParamType.DateTime,
          false,
        ),
        movementInfo: convertAlgoliaParam(
          data['movement_info'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MovementInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MovementInfoStruct &&
        movementDate == other.movementDate &&
        movementInfo == other.movementInfo;
  }

  @override
  int get hashCode => const ListEquality().hash([movementDate, movementInfo]);
}

MovementInfoStruct createMovementInfoStruct({
  DateTime? movementDate,
  String? movementInfo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MovementInfoStruct(
      movementDate: movementDate,
      movementInfo: movementInfo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MovementInfoStruct? updateMovementInfoStruct(
  MovementInfoStruct? movementInfoStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    movementInfoStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMovementInfoStructData(
  Map<String, dynamic> firestoreData,
  MovementInfoStruct? movementInfoStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (movementInfoStruct == null) {
    return;
  }
  if (movementInfoStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && movementInfoStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final movementInfoStructData =
      getMovementInfoFirestoreData(movementInfoStruct, forFieldValue);
  final nestedData =
      movementInfoStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      movementInfoStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMovementInfoFirestoreData(
  MovementInfoStruct? movementInfoStruct, [
  bool forFieldValue = false,
]) {
  if (movementInfoStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(movementInfoStruct.toMap());

  // Add any Firestore field values
  mapToFirestore(movementInfoStruct.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMovementInfoListFirestoreData(
  List<MovementInfoStruct>? movementInfoStructs,
) =>
    movementInfoStructs
        ?.map((e) => getMovementInfoFirestoreData(e, true))
        .toList() ??
    [];
