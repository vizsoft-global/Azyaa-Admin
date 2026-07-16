import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserMembershipPlansRecord extends FirestoreRecord {
  UserMembershipPlansRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "membership_plan_id" field.
  int? _membershipPlanId;
  int get membershipPlanId => _membershipPlanId ?? 0;
  bool hasMembershipPlanId() => _membershipPlanId != null;

  // "plan_info" field.
  InfoStruct? _planInfo;
  InfoStruct get planInfo => _planInfo ?? InfoStruct();
  bool hasPlanInfo() => _planInfo != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "plan_feature" field.
  UserMembershipPlanFeatureStruct? _planFeature;
  UserMembershipPlanFeatureStruct get planFeature =>
      _planFeature ?? UserMembershipPlanFeatureStruct();
  bool hasPlanFeature() => _planFeature != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _membershipPlanId = castToType<int>(snapshotData['membership_plan_id']);
    _planInfo = snapshotData['plan_info'] is InfoStruct
        ? snapshotData['plan_info']
        : InfoStruct.maybeFromMap(snapshotData['plan_info']);
    _price = castToType<double>(snapshotData['price']);
    _duration = snapshotData['duration'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _planFeature =
        snapshotData['plan_feature'] is UserMembershipPlanFeatureStruct
            ? snapshotData['plan_feature']
            : UserMembershipPlanFeatureStruct.maybeFromMap(
                snapshotData['plan_feature']);
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_membership_plans');

  static Stream<UserMembershipPlansRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserMembershipPlansRecord.fromSnapshot(s));

  static Future<UserMembershipPlansRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserMembershipPlansRecord.fromSnapshot(s));

  static UserMembershipPlansRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserMembershipPlansRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserMembershipPlansRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserMembershipPlansRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserMembershipPlansRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserMembershipPlansRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserMembershipPlansRecordData({
  int? membershipPlanId,
  InfoStruct? planInfo,
  double? price,
  String? duration,
  DateTime? createdAt,
  DateTime? updatedAt,
  UserMembershipPlanFeatureStruct? planFeature,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'membership_plan_id': membershipPlanId,
      'plan_info': InfoStruct().toMap(),
      'price': price,
      'duration': duration,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'plan_feature': UserMembershipPlanFeatureStruct().toMap(),
      'status': status,
    }.withoutNulls,
  );

  // Handle nested data for "plan_info" field.
  addInfoStructData(firestoreData, planInfo, 'plan_info');

  // Handle nested data for "plan_feature" field.
  addUserMembershipPlanFeatureStructData(
      firestoreData, planFeature, 'plan_feature');

  return firestoreData;
}

class UserMembershipPlansRecordDocumentEquality
    implements Equality<UserMembershipPlansRecord> {
  const UserMembershipPlansRecordDocumentEquality();

  @override
  bool equals(UserMembershipPlansRecord? e1, UserMembershipPlansRecord? e2) {
    return e1?.membershipPlanId == e2?.membershipPlanId &&
        e1?.planInfo == e2?.planInfo &&
        e1?.price == e2?.price &&
        e1?.duration == e2?.duration &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.planFeature == e2?.planFeature &&
        e1?.status == e2?.status;
  }

  @override
  int hash(UserMembershipPlansRecord? e) => const ListEquality().hash([
        e?.membershipPlanId,
        e?.planInfo,
        e?.price,
        e?.duration,
        e?.createdAt,
        e?.updatedAt,
        e?.planFeature,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is UserMembershipPlansRecord;
}
