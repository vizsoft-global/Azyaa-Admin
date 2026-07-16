import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicesRecord extends FirestoreRecord {
  ServicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "service_id" field.
  String? _serviceId;
  String get serviceId => _serviceId ?? '';
  bool hasServiceId() => _serviceId != null;

  // "service_info" field.
  InfoStruct? _serviceInfo;
  InfoStruct get serviceInfo => _serviceInfo ?? InfoStruct();
  bool hasServiceInfo() => _serviceInfo != null;

  // "sub_services_list" field.
  List<SubServicesStruct>? _subServicesList;
  List<SubServicesStruct> get subServicesList => _subServicesList ?? const [];
  bool hasSubServicesList() => _subServicesList != null;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _serviceId = snapshotData['service_id'] as String?;
    _serviceInfo = snapshotData['service_info'] is InfoStruct
        ? snapshotData['service_info']
        : InfoStruct.maybeFromMap(snapshotData['service_info']);
    _subServicesList = getStructList(
      snapshotData['sub_services_list'],
      SubServicesStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('services');

  static Stream<ServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicesRecord.fromSnapshot(s));

  static Future<ServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServicesRecord.fromSnapshot(s));

  static ServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicesRecordData({
  String? status,
  String? serviceId,
  InfoStruct? serviceInfo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'service_id': serviceId,
      'service_info': InfoStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "service_info" field.
  addInfoStructData(firestoreData, serviceInfo, 'service_info');

  return firestoreData;
}

class ServicesRecordDocumentEquality implements Equality<ServicesRecord> {
  const ServicesRecordDocumentEquality();

  @override
  bool equals(ServicesRecord? e1, ServicesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.status == e2?.status &&
        e1?.serviceId == e2?.serviceId &&
        e1?.serviceInfo == e2?.serviceInfo &&
        listEquality.equals(e1?.subServicesList, e2?.subServicesList);
  }

  @override
  int hash(ServicesRecord? e) => const ListEquality()
      .hash([e?.status, e?.serviceId, e?.serviceInfo, e?.subServicesList]);

  @override
  bool isValidKey(Object? o) => o is ServicesRecord;
}
