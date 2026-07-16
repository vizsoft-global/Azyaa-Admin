import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserWaitlistRecord extends FirestoreRecord {
  UserWaitlistRecord._(
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

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "user_waitlist_id" field.
  int? _userWaitlistId;
  int get userWaitlistId => _userWaitlistId ?? 0;
  bool hasUserWaitlistId() => _userWaitlistId != null;

  // "user_info" field.
  UserInfoStruct? _userInfo;
  UserInfoStruct get userInfo => _userInfo ?? UserInfoStruct();
  bool hasUserInfo() => _userInfo != null;

  // "user_app_access_data" field.
  SettingsAppAccessDataStruct? _userAppAccessData;
  SettingsAppAccessDataStruct get userAppAccessData =>
      _userAppAccessData ?? SettingsAppAccessDataStruct();
  bool hasUserAppAccessData() => _userAppAccessData != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _userWaitlistId = castToType<int>(snapshotData['user_waitlist_id']);
    _userInfo = snapshotData['user_info'] is UserInfoStruct
        ? snapshotData['user_info']
        : UserInfoStruct.maybeFromMap(snapshotData['user_info']);
    _userAppAccessData =
        snapshotData['user_app_access_data'] is SettingsAppAccessDataStruct
            ? snapshotData['user_app_access_data']
            : SettingsAppAccessDataStruct.maybeFromMap(
                snapshotData['user_app_access_data']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_waitlist');

  static Stream<UserWaitlistRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserWaitlistRecord.fromSnapshot(s));

  static Future<UserWaitlistRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserWaitlistRecord.fromSnapshot(s));

  static UserWaitlistRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserWaitlistRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserWaitlistRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserWaitlistRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserWaitlistRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserWaitlistRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserWaitlistRecordData({
  DateTime? createdAt,
  DateTime? updatedAt,
  String? status,
  int? userWaitlistId,
  UserInfoStruct? userInfo,
  SettingsAppAccessDataStruct? userAppAccessData,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'updated_at': updatedAt,
      'status': status,
      'user_waitlist_id': userWaitlistId,
      'user_info': UserInfoStruct().toMap(),
      'user_app_access_data': SettingsAppAccessDataStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "user_info" field.
  addUserInfoStructData(firestoreData, userInfo, 'user_info');

  // Handle nested data for "user_app_access_data" field.
  addSettingsAppAccessDataStructData(
      firestoreData, userAppAccessData, 'user_app_access_data');

  return firestoreData;
}

class UserWaitlistRecordDocumentEquality
    implements Equality<UserWaitlistRecord> {
  const UserWaitlistRecordDocumentEquality();

  @override
  bool equals(UserWaitlistRecord? e1, UserWaitlistRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.status == e2?.status &&
        e1?.userWaitlistId == e2?.userWaitlistId &&
        e1?.userInfo == e2?.userInfo &&
        e1?.userAppAccessData == e2?.userAppAccessData;
  }

  @override
  int hash(UserWaitlistRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.updatedAt,
        e?.status,
        e?.userWaitlistId,
        e?.userInfo,
        e?.userAppAccessData
      ]);

  @override
  bool isValidKey(Object? o) => o is UserWaitlistRecord;
}
