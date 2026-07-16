// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MailInfoStruct extends FFFirebaseStruct {
  MailInfoStruct({
    String? name,
    MailDataStruct? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _data = data,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "data" field.
  MailDataStruct? _data;
  MailDataStruct get data => _data ?? MailDataStruct();
  set data(MailDataStruct? val) => _data = val;

  void updateData(Function(MailDataStruct) updateFn) {
    updateFn(_data ??= MailDataStruct());
  }

  bool hasData() => _data != null;

  static MailInfoStruct fromMap(Map<String, dynamic> data) => MailInfoStruct(
        name: data['name'] as String?,
        data: data['data'] is MailDataStruct
            ? data['data']
            : MailDataStruct.maybeFromMap(data['data']),
      );

  static MailInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? MailInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'data': _data?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static MailInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      MailInfoStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: MailDataStruct.fromSerializableMap,
        ),
      );

  static MailInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      MailInfoStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        data: convertAlgoliaParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: MailDataStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MailInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MailInfoStruct && name == other.name && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([name, data]);
}

MailInfoStruct createMailInfoStruct({
  String? name,
  MailDataStruct? data,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MailInfoStruct(
      name: name,
      data: data ?? (clearUnsetFields ? MailDataStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MailInfoStruct? updateMailInfoStruct(
  MailInfoStruct? mailInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mailInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMailInfoStructData(
  Map<String, dynamic> firestoreData,
  MailInfoStruct? mailInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mailInfo == null) {
    return;
  }
  if (mailInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && mailInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mailInfoData = getMailInfoFirestoreData(mailInfo, forFieldValue);
  final nestedData = mailInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = mailInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMailInfoFirestoreData(
  MailInfoStruct? mailInfo, [
  bool forFieldValue = false,
]) {
  if (mailInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mailInfo.toMap());

  // Handle nested data for "data" field.
  addMailDataStructData(
    firestoreData,
    mailInfo.hasData() ? mailInfo.data : null,
    'data',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(mailInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMailInfoListFirestoreData(
  List<MailInfoStruct>? mailInfos,
) =>
    mailInfos?.map((e) => getMailInfoFirestoreData(e, true)).toList() ?? [];
