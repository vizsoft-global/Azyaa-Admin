import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThemeRecord extends FirestoreRecord {
  ThemeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "theme_status" field.
  String? _themeStatus;
  String get themeStatus => _themeStatus ?? '';
  bool hasThemeStatus() => _themeStatus != null;

  // "theme_createdAt" field.
  DateTime? _themeCreatedAt;
  DateTime? get themeCreatedAt => _themeCreatedAt;
  bool hasThemeCreatedAt() => _themeCreatedAt != null;

  // "theme_id" field.
  int? _themeId;
  int get themeId => _themeId ?? 0;
  bool hasThemeId() => _themeId != null;

  // "theme_info" field.
  ThemeColourStruct? _themeInfo;
  ThemeColourStruct get themeInfo => _themeInfo ?? ThemeColourStruct();
  bool hasThemeInfo() => _themeInfo != null;

  void _initializeFields() {
    _themeStatus = snapshotData['theme_status'] as String?;
    _themeCreatedAt = snapshotData['theme_createdAt'] as DateTime?;
    _themeId = castToType<int>(snapshotData['theme_id']);
    _themeInfo = snapshotData['theme_info'] is ThemeColourStruct
        ? snapshotData['theme_info']
        : ThemeColourStruct.maybeFromMap(snapshotData['theme_info']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('theme');

  static Stream<ThemeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ThemeRecord.fromSnapshot(s));

  static Future<ThemeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ThemeRecord.fromSnapshot(s));

  static ThemeRecord fromSnapshot(DocumentSnapshot snapshot) => ThemeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ThemeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ThemeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ThemeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ThemeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createThemeRecordData({
  String? themeStatus,
  DateTime? themeCreatedAt,
  int? themeId,
  ThemeColourStruct? themeInfo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'theme_status': themeStatus,
      'theme_createdAt': themeCreatedAt,
      'theme_id': themeId,
      'theme_info': ThemeColourStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "theme_info" field.
  addThemeColourStructData(firestoreData, themeInfo, 'theme_info');

  return firestoreData;
}

class ThemeRecordDocumentEquality implements Equality<ThemeRecord> {
  const ThemeRecordDocumentEquality();

  @override
  bool equals(ThemeRecord? e1, ThemeRecord? e2) {
    return e1?.themeStatus == e2?.themeStatus &&
        e1?.themeCreatedAt == e2?.themeCreatedAt &&
        e1?.themeId == e2?.themeId &&
        e1?.themeInfo == e2?.themeInfo;
  }

  @override
  int hash(ThemeRecord? e) => const ListEquality()
      .hash([e?.themeStatus, e?.themeCreatedAt, e?.themeId, e?.themeInfo]);

  @override
  bool isValidKey(Object? o) => o is ThemeRecord;
}
