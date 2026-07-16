// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DeliveryTimelineStruct extends FFFirebaseStruct {
  DeliveryTimelineStruct({
    String? status,
    DateTime? dateTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _status = status,
        _dateTime = dateTime,
        super(firestoreUtilData);

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  set dateTime(DateTime? val) => _dateTime = val;

  bool hasDateTime() => _dateTime != null;

  static DeliveryTimelineStruct fromMap(Map<String, dynamic> data) =>
      DeliveryTimelineStruct(
        status: data['status'] as String?,
        dateTime: data['dateTime'] as DateTime?,
      );

  static DeliveryTimelineStruct? maybeFromMap(dynamic data) => data is Map
      ? DeliveryTimelineStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'dateTime': _dateTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'dateTime': serializeParam(
          _dateTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DeliveryTimelineStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DeliveryTimelineStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        dateTime: deserializeParam(
          data['dateTime'],
          ParamType.DateTime,
          false,
        ),
      );

  static DeliveryTimelineStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DeliveryTimelineStruct(
        status: convertAlgoliaParam(
          data['status'],
          ParamType.String,
          false,
        ),
        dateTime: convertAlgoliaParam(
          data['dateTime'],
          ParamType.DateTime,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DeliveryTimelineStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DeliveryTimelineStruct &&
        status == other.status &&
        dateTime == other.dateTime;
  }

  @override
  int get hashCode => const ListEquality().hash([status, dateTime]);
}

DeliveryTimelineStruct createDeliveryTimelineStruct({
  String? status,
  DateTime? dateTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DeliveryTimelineStruct(
      status: status,
      dateTime: dateTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DeliveryTimelineStruct? updateDeliveryTimelineStruct(
  DeliveryTimelineStruct? deliveryTimeline, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    deliveryTimeline
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDeliveryTimelineStructData(
  Map<String, dynamic> firestoreData,
  DeliveryTimelineStruct? deliveryTimeline,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (deliveryTimeline == null) {
    return;
  }
  if (deliveryTimeline.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && deliveryTimeline.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final deliveryTimelineData =
      getDeliveryTimelineFirestoreData(deliveryTimeline, forFieldValue);
  final nestedData =
      deliveryTimelineData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = deliveryTimeline.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDeliveryTimelineFirestoreData(
  DeliveryTimelineStruct? deliveryTimeline, [
  bool forFieldValue = false,
]) {
  if (deliveryTimeline == null) {
    return {};
  }
  final firestoreData = mapToFirestore(deliveryTimeline.toMap());

  // Add any Firestore field values
  mapToFirestore(deliveryTimeline.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDeliveryTimelineListFirestoreData(
  List<DeliveryTimelineStruct>? deliveryTimelines,
) =>
    deliveryTimelines
        ?.map((e) => getDeliveryTimelineFirestoreData(e, true))
        .toList() ??
    [];
