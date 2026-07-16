import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserReferralActivitiesRecord extends FirestoreRecord {
  UserReferralActivitiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_referral_id" field.
  int? _userReferralId;
  int get userReferralId => _userReferralId ?? 0;
  bool hasUserReferralId() => _userReferralId != null;

  // "referee_new_user_id" field.
  DocumentReference? _refereeNewUserId;
  DocumentReference? get refereeNewUserId => _refereeNewUserId;
  bool hasRefereeNewUserId() => _refereeNewUserId != null;

  // "referrer_existing_user_id" field.
  DocumentReference? _referrerExistingUserId;
  DocumentReference? get referrerExistingUserId => _referrerExistingUserId;
  bool hasReferrerExistingUserId() => _referrerExistingUserId != null;

  // "reward_points" field.
  int? _rewardPoints;
  int get rewardPoints => _rewardPoints ?? 0;
  bool hasRewardPoints() => _rewardPoints != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _userReferralId = castToType<int>(snapshotData['user_referral_id']);
    _refereeNewUserId =
        snapshotData['referee_new_user_id'] as DocumentReference?;
    _referrerExistingUserId =
        snapshotData['referrer_existing_user_id'] as DocumentReference?;
    _rewardPoints = castToType<int>(snapshotData['reward_points']);
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_referral_activities');

  static Stream<UserReferralActivitiesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => UserReferralActivitiesRecord.fromSnapshot(s));

  static Future<UserReferralActivitiesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserReferralActivitiesRecord.fromSnapshot(s));

  static UserReferralActivitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserReferralActivitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserReferralActivitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserReferralActivitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserReferralActivitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserReferralActivitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserReferralActivitiesRecordData({
  int? userReferralId,
  DocumentReference? refereeNewUserId,
  DocumentReference? referrerExistingUserId,
  int? rewardPoints,
  String? status,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_referral_id': userReferralId,
      'referee_new_user_id': refereeNewUserId,
      'referrer_existing_user_id': referrerExistingUserId,
      'reward_points': rewardPoints,
      'status': status,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserReferralActivitiesRecordDocumentEquality
    implements Equality<UserReferralActivitiesRecord> {
  const UserReferralActivitiesRecordDocumentEquality();

  @override
  bool equals(
      UserReferralActivitiesRecord? e1, UserReferralActivitiesRecord? e2) {
    return e1?.userReferralId == e2?.userReferralId &&
        e1?.refereeNewUserId == e2?.refereeNewUserId &&
        e1?.referrerExistingUserId == e2?.referrerExistingUserId &&
        e1?.rewardPoints == e2?.rewardPoints &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(UserReferralActivitiesRecord? e) => const ListEquality().hash([
        e?.userReferralId,
        e?.refereeNewUserId,
        e?.referrerExistingUserId,
        e?.rewardPoints,
        e?.status,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is UserReferralActivitiesRecord;
}
