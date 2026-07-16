// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SubServicesStruct extends FFFirebaseStruct {
  SubServicesStruct({
    String? subServiceId,
    String? subServiceName,
    String? subServiceDescription,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subServiceId = subServiceId,
        _subServiceName = subServiceName,
        _subServiceDescription = subServiceDescription,
        super(firestoreUtilData);

  // "sub_service_id" field.
  String? _subServiceId;
  String get subServiceId => _subServiceId ?? '';
  set subServiceId(String? val) => _subServiceId = val;

  bool hasSubServiceId() => _subServiceId != null;

  // "sub_service_name" field.
  String? _subServiceName;
  String get subServiceName => _subServiceName ?? '';
  set subServiceName(String? val) => _subServiceName = val;

  bool hasSubServiceName() => _subServiceName != null;

  // "sub_service_description" field.
  String? _subServiceDescription;
  String get subServiceDescription => _subServiceDescription ?? '';
  set subServiceDescription(String? val) => _subServiceDescription = val;

  bool hasSubServiceDescription() => _subServiceDescription != null;

  static SubServicesStruct fromMap(Map<String, dynamic> data) =>
      SubServicesStruct(
        subServiceId: data['sub_service_id'] as String?,
        subServiceName: data['sub_service_name'] as String?,
        subServiceDescription: data['sub_service_description'] as String?,
      );

  static SubServicesStruct? maybeFromMap(dynamic data) => data is Map
      ? SubServicesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sub_service_id': _subServiceId,
        'sub_service_name': _subServiceName,
        'sub_service_description': _subServiceDescription,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sub_service_id': serializeParam(
          _subServiceId,
          ParamType.String,
        ),
        'sub_service_name': serializeParam(
          _subServiceName,
          ParamType.String,
        ),
        'sub_service_description': serializeParam(
          _subServiceDescription,
          ParamType.String,
        ),
      }.withoutNulls;

  static SubServicesStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubServicesStruct(
        subServiceId: deserializeParam(
          data['sub_service_id'],
          ParamType.String,
          false,
        ),
        subServiceName: deserializeParam(
          data['sub_service_name'],
          ParamType.String,
          false,
        ),
        subServiceDescription: deserializeParam(
          data['sub_service_description'],
          ParamType.String,
          false,
        ),
      );

  static SubServicesStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SubServicesStruct(
        subServiceId: convertAlgoliaParam(
          data['sub_service_id'],
          ParamType.String,
          false,
        ),
        subServiceName: convertAlgoliaParam(
          data['sub_service_name'],
          ParamType.String,
          false,
        ),
        subServiceDescription: convertAlgoliaParam(
          data['sub_service_description'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SubServicesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubServicesStruct &&
        subServiceId == other.subServiceId &&
        subServiceName == other.subServiceName &&
        subServiceDescription == other.subServiceDescription;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([subServiceId, subServiceName, subServiceDescription]);
}

SubServicesStruct createSubServicesStruct({
  String? subServiceId,
  String? subServiceName,
  String? subServiceDescription,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubServicesStruct(
      subServiceId: subServiceId,
      subServiceName: subServiceName,
      subServiceDescription: subServiceDescription,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SubServicesStruct? updateSubServicesStruct(
  SubServicesStruct? subServices, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    subServices
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSubServicesStructData(
  Map<String, dynamic> firestoreData,
  SubServicesStruct? subServices,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subServices == null) {
    return;
  }
  if (subServices.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && subServices.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subServicesData =
      getSubServicesFirestoreData(subServices, forFieldValue);
  final nestedData =
      subServicesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = subServices.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSubServicesFirestoreData(
  SubServicesStruct? subServices, [
  bool forFieldValue = false,
]) {
  if (subServices == null) {
    return {};
  }
  final firestoreData = mapToFirestore(subServices.toMap());

  // Add any Firestore field values
  mapToFirestore(subServices.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubServicesListFirestoreData(
  List<SubServicesStruct>? subServicess,
) =>
    subServicess?.map((e) => getSubServicesFirestoreData(e, true)).toList() ??
    [];
