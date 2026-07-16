// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MailBodyStruct extends FFFirebaseStruct {
  MailBodyStruct({
    String? subject,
    String? html,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subject = subject,
        _html = html,
        super(firestoreUtilData);

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  // "html" field.
  String? _html;
  String get html => _html ?? '';
  set html(String? val) => _html = val;

  bool hasHtml() => _html != null;

  static MailBodyStruct fromMap(Map<String, dynamic> data) => MailBodyStruct(
        subject: data['subject'] as String?,
        html: data['html'] as String?,
      );

  static MailBodyStruct? maybeFromMap(dynamic data) =>
      data is Map ? MailBodyStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'subject': _subject,
        'html': _html,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'html': serializeParam(
          _html,
          ParamType.String,
        ),
      }.withoutNulls;

  static MailBodyStruct fromSerializableMap(Map<String, dynamic> data) =>
      MailBodyStruct(
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        html: deserializeParam(
          data['html'],
          ParamType.String,
          false,
        ),
      );

  static MailBodyStruct fromAlgoliaData(Map<String, dynamic> data) =>
      MailBodyStruct(
        subject: convertAlgoliaParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        html: convertAlgoliaParam(
          data['html'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MailBodyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MailBodyStruct &&
        subject == other.subject &&
        html == other.html;
  }

  @override
  int get hashCode => const ListEquality().hash([subject, html]);
}

MailBodyStruct createMailBodyStruct({
  String? subject,
  String? html,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MailBodyStruct(
      subject: subject,
      html: html,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MailBodyStruct? updateMailBodyStruct(
  MailBodyStruct? mailBody, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mailBody
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMailBodyStructData(
  Map<String, dynamic> firestoreData,
  MailBodyStruct? mailBody,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mailBody == null) {
    return;
  }
  if (mailBody.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && mailBody.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mailBodyData = getMailBodyFirestoreData(mailBody, forFieldValue);
  final nestedData = mailBodyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = mailBody.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMailBodyFirestoreData(
  MailBodyStruct? mailBody, [
  bool forFieldValue = false,
]) {
  if (mailBody == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mailBody.toMap());

  // Add any Firestore field values
  mapToFirestore(mailBody.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMailBodyListFirestoreData(
  List<MailBodyStruct>? mailBodys,
) =>
    mailBodys?.map((e) => getMailBodyFirestoreData(e, true)).toList() ?? [];
