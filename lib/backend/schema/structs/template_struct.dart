// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TemplateStruct extends FFFirebaseStruct {
  TemplateStruct({
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static TemplateStruct fromMap(Map<String, dynamic> data) => TemplateStruct(
        name: data['name'] as String?,
      );

  static TemplateStruct? maybeFromMap(dynamic data) =>
      data is Map ? TemplateStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static TemplateStruct fromSerializableMap(Map<String, dynamic> data) =>
      TemplateStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  static TemplateStruct fromAlgoliaData(Map<String, dynamic> data) =>
      TemplateStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'TemplateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TemplateStruct && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([name]);
}

TemplateStruct createTemplateStruct({
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TemplateStruct(
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TemplateStruct? updateTemplateStruct(
  TemplateStruct? template, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    template
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTemplateStructData(
  Map<String, dynamic> firestoreData,
  TemplateStruct? template,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (template == null) {
    return;
  }
  if (template.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && template.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final templateData = getTemplateFirestoreData(template, forFieldValue);
  final nestedData = templateData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = template.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTemplateFirestoreData(
  TemplateStruct? template, [
  bool forFieldValue = false,
]) {
  if (template == null) {
    return {};
  }
  final firestoreData = mapToFirestore(template.toMap());

  // Add any Firestore field values
  mapToFirestore(template.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTemplateListFirestoreData(
  List<TemplateStruct>? templates,
) =>
    templates?.map((e) => getTemplateFirestoreData(e, true)).toList() ?? [];
