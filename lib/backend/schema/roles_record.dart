import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RolesRecord extends FirestoreRecord {
  RolesRecord._(
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

  // "role_info" field.
  InfoStruct? _roleInfo;
  InfoStruct get roleInfo => _roleInfo ?? InfoStruct();
  bool hasRoleInfo() => _roleInfo != null;

  // "role_id" field.
  int? _roleId;
  int get roleId => _roleId ?? 0;
  bool hasRoleId() => _roleId != null;

  // "role_unique_key" field.
  String? _roleUniqueKey;
  String get roleUniqueKey => _roleUniqueKey ?? '';
  bool hasRoleUniqueKey() => _roleUniqueKey != null;

  // "permissions_list" field.
  List<String>? _permissionsList;
  List<String> get permissionsList => _permissionsList ?? const [];
  bool hasPermissionsList() => _permissionsList != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _roleInfo = snapshotData['role_info'] is InfoStruct
        ? snapshotData['role_info']
        : InfoStruct.maybeFromMap(snapshotData['role_info']);
    _roleId = castToType<int>(snapshotData['role_id']);
    _roleUniqueKey = snapshotData['role_unique_key'] as String?;
    _permissionsList = getDataList(snapshotData['permissions_list']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('roles');

  static Stream<RolesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RolesRecord.fromSnapshot(s));

  static Future<RolesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RolesRecord.fromSnapshot(s));

  static RolesRecord fromSnapshot(DocumentSnapshot snapshot) => RolesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RolesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RolesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RolesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RolesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRolesRecordData({
  DateTime? createdAt,
  DateTime? updatedAt,
  InfoStruct? roleInfo,
  int? roleId,
  String? roleUniqueKey,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'updated_at': updatedAt,
      'role_info': InfoStruct().toMap(),
      'role_id': roleId,
      'role_unique_key': roleUniqueKey,
    }.withoutNulls,
  );

  // Handle nested data for "role_info" field.
  addInfoStructData(firestoreData, roleInfo, 'role_info');

  return firestoreData;
}

class RolesRecordDocumentEquality implements Equality<RolesRecord> {
  const RolesRecordDocumentEquality();

  @override
  bool equals(RolesRecord? e1, RolesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.roleInfo == e2?.roleInfo &&
        e1?.roleId == e2?.roleId &&
        e1?.roleUniqueKey == e2?.roleUniqueKey &&
        listEquality.equals(e1?.permissionsList, e2?.permissionsList);
  }

  @override
  int hash(RolesRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.updatedAt,
        e?.roleInfo,
        e?.roleId,
        e?.roleUniqueKey,
        e?.permissionsList
      ]);

  @override
  bool isValidKey(Object? o) => o is RolesRecord;
}
