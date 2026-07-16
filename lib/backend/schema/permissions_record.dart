import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PermissionsRecord extends FirestoreRecord {
  PermissionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "permission_id" field.
  int? _permissionId;
  int get permissionId => _permissionId ?? 0;
  bool hasPermissionId() => _permissionId != null;

  // "permission_key" field.
  String? _permissionKey;
  String get permissionKey => _permissionKey ?? '';
  bool hasPermissionKey() => _permissionKey != null;

  // "permission_info" field.
  InfoStruct? _permissionInfo;
  InfoStruct get permissionInfo => _permissionInfo ?? InfoStruct();
  bool hasPermissionInfo() => _permissionInfo != null;

  // "permission_type" field.
  String? _permissionType;
  String get permissionType => _permissionType ?? '';
  bool hasPermissionType() => _permissionType != null;

  // "parent_id" field.
  int? _parentId;
  int get parentId => _parentId ?? 0;
  bool hasParentId() => _parentId != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _permissionId = castToType<int>(snapshotData['permission_id']);
    _permissionKey = snapshotData['permission_key'] as String?;
    _permissionInfo = snapshotData['permission_info'] is InfoStruct
        ? snapshotData['permission_info']
        : InfoStruct.maybeFromMap(snapshotData['permission_info']);
    _permissionType = snapshotData['permission_type'] as String?;
    _parentId = castToType<int>(snapshotData['parent_id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('permissions');

  static Stream<PermissionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PermissionsRecord.fromSnapshot(s));

  static Future<PermissionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PermissionsRecord.fromSnapshot(s));

  static PermissionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PermissionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PermissionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PermissionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PermissionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PermissionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPermissionsRecordData({
  DateTime? createdAt,
  DateTime? updatedAt,
  int? permissionId,
  String? permissionKey,
  InfoStruct? permissionInfo,
  String? permissionType,
  int? parentId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'updated_at': updatedAt,
      'permission_id': permissionId,
      'permission_key': permissionKey,
      'permission_info': InfoStruct().toMap(),
      'permission_type': permissionType,
      'parent_id': parentId,
    }.withoutNulls,
  );

  // Handle nested data for "permission_info" field.
  addInfoStructData(firestoreData, permissionInfo, 'permission_info');

  return firestoreData;
}

class PermissionsRecordDocumentEquality implements Equality<PermissionsRecord> {
  const PermissionsRecordDocumentEquality();

  @override
  bool equals(PermissionsRecord? e1, PermissionsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.permissionId == e2?.permissionId &&
        e1?.permissionKey == e2?.permissionKey &&
        e1?.permissionInfo == e2?.permissionInfo &&
        e1?.permissionType == e2?.permissionType &&
        e1?.parentId == e2?.parentId;
  }

  @override
  int hash(PermissionsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.updatedAt,
        e?.permissionId,
        e?.permissionKey,
        e?.permissionInfo,
        e?.permissionType,
        e?.parentId
      ]);

  @override
  bool isValidKey(Object? o) => o is PermissionsRecord;
}
