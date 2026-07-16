import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LogisticsResponseRecord extends FirestoreRecord {
  LogisticsResponseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "driverName" field.
  String? _driverName;
  String get driverName => _driverName ?? '';
  bool hasDriverName() => _driverName != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "timing" field.
  TimingStruct? _timing;
  TimingStruct get timing => _timing ?? TimingStruct();
  bool hasTiming() => _timing != null;

  // "time_lines" field.
  List<DeliveryTimelineStruct>? _timeLines;
  List<DeliveryTimelineStruct> get timeLines => _timeLines ?? const [];
  bool hasTimeLines() => _timeLines != null;

  // "swftTrackID" field.
  String? _swftTrackID;
  String get swftTrackID => _swftTrackID ?? '';
  bool hasSwftTrackID() => _swftTrackID != null;

  void _initializeFields() {
    _driverName = snapshotData['driverName'] as String?;
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _state = snapshotData['state'] as String?;
    _status = snapshotData['status'] as String?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _timing = snapshotData['timing'] is TimingStruct
        ? snapshotData['timing']
        : TimingStruct.maybeFromMap(snapshotData['timing']);
    _timeLines = getStructList(
      snapshotData['time_lines'],
      DeliveryTimelineStruct.fromMap,
    );
    _swftTrackID = snapshotData['swftTrackID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('logistics_response');

  static Stream<LogisticsResponseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LogisticsResponseRecord.fromSnapshot(s));

  static Future<LogisticsResponseRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => LogisticsResponseRecord.fromSnapshot(s));

  static LogisticsResponseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LogisticsResponseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LogisticsResponseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LogisticsResponseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LogisticsResponseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LogisticsResponseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLogisticsResponseRecordData({
  String? driverName,
  String? id,
  String? name,
  String? state,
  String? status,
  DateTime? updatedAt,
  TimingStruct? timing,
  String? swftTrackID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'driverName': driverName,
      'id': id,
      'name': name,
      'state': state,
      'status': status,
      'updated_at': updatedAt,
      'timing': TimingStruct().toMap(),
      'swftTrackID': swftTrackID,
    }.withoutNulls,
  );

  // Handle nested data for "timing" field.
  addTimingStructData(firestoreData, timing, 'timing');

  return firestoreData;
}

class LogisticsResponseRecordDocumentEquality
    implements Equality<LogisticsResponseRecord> {
  const LogisticsResponseRecordDocumentEquality();

  @override
  bool equals(LogisticsResponseRecord? e1, LogisticsResponseRecord? e2) {
    const listEquality = ListEquality();
    return e1?.driverName == e2?.driverName &&
        e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.state == e2?.state &&
        e1?.status == e2?.status &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.timing == e2?.timing &&
        listEquality.equals(e1?.timeLines, e2?.timeLines) &&
        e1?.swftTrackID == e2?.swftTrackID;
  }

  @override
  int hash(LogisticsResponseRecord? e) => const ListEquality().hash([
        e?.driverName,
        e?.id,
        e?.name,
        e?.state,
        e?.status,
        e?.updatedAt,
        e?.timing,
        e?.timeLines,
        e?.swftTrackID
      ]);

  @override
  bool isValidKey(Object? o) => o is LogisticsResponseRecord;
}
