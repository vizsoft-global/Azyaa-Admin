// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TimingStruct extends FFFirebaseStruct {
  TimingStruct({
    String? id,
    DateTime? actualDropDateEnd,
    DateTime? actualDropDateStart,
    DateTime? actualPickupDateEnd,
    DateTime? actualPickupDateStart,
    DateTime? arrivedAtCustomer,
    DateTime? arrivedAtPickup,
    DateTime? createdAt,
    DateTime? deliveryRequestedTime,
    DateTime? expectedDropDateEnd,
    DateTime? expectedDropDateStart,
    DateTime? expectedPickupDateEnd,
    DateTime? expectedPickupDateStart,
    DateTime? firstAttemptTime,
    DateTime? firstFailedAttempt,
    DateTime? inputDate,
    DateTime? lastAttemptTime,
    DateTime? lastFailedAttempt,
    DateTime? pickupFromPartnerTime,
    DateTime? receivedAtWarehouseTime,
    DateTime? slaEnd,
    DateTime? slaStart,
    DateTime? updatedAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _actualDropDateEnd = actualDropDateEnd,
        _actualDropDateStart = actualDropDateStart,
        _actualPickupDateEnd = actualPickupDateEnd,
        _actualPickupDateStart = actualPickupDateStart,
        _arrivedAtCustomer = arrivedAtCustomer,
        _arrivedAtPickup = arrivedAtPickup,
        _createdAt = createdAt,
        _deliveryRequestedTime = deliveryRequestedTime,
        _expectedDropDateEnd = expectedDropDateEnd,
        _expectedDropDateStart = expectedDropDateStart,
        _expectedPickupDateEnd = expectedPickupDateEnd,
        _expectedPickupDateStart = expectedPickupDateStart,
        _firstAttemptTime = firstAttemptTime,
        _firstFailedAttempt = firstFailedAttempt,
        _inputDate = inputDate,
        _lastAttemptTime = lastAttemptTime,
        _lastFailedAttempt = lastFailedAttempt,
        _pickupFromPartnerTime = pickupFromPartnerTime,
        _receivedAtWarehouseTime = receivedAtWarehouseTime,
        _slaEnd = slaEnd,
        _slaStart = slaStart,
        _updatedAt = updatedAt,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "actualDropDateEnd" field.
  DateTime? _actualDropDateEnd;
  DateTime? get actualDropDateEnd => _actualDropDateEnd;
  set actualDropDateEnd(DateTime? val) => _actualDropDateEnd = val;

  bool hasActualDropDateEnd() => _actualDropDateEnd != null;

  // "actualDropDateStart" field.
  DateTime? _actualDropDateStart;
  DateTime? get actualDropDateStart => _actualDropDateStart;
  set actualDropDateStart(DateTime? val) => _actualDropDateStart = val;

  bool hasActualDropDateStart() => _actualDropDateStart != null;

  // "actualPickupDateEnd" field.
  DateTime? _actualPickupDateEnd;
  DateTime? get actualPickupDateEnd => _actualPickupDateEnd;
  set actualPickupDateEnd(DateTime? val) => _actualPickupDateEnd = val;

  bool hasActualPickupDateEnd() => _actualPickupDateEnd != null;

  // "actualPickupDateStart" field.
  DateTime? _actualPickupDateStart;
  DateTime? get actualPickupDateStart => _actualPickupDateStart;
  set actualPickupDateStart(DateTime? val) => _actualPickupDateStart = val;

  bool hasActualPickupDateStart() => _actualPickupDateStart != null;

  // "arrivedAtCustomer" field.
  DateTime? _arrivedAtCustomer;
  DateTime? get arrivedAtCustomer => _arrivedAtCustomer;
  set arrivedAtCustomer(DateTime? val) => _arrivedAtCustomer = val;

  bool hasArrivedAtCustomer() => _arrivedAtCustomer != null;

  // "arrivedAtPickup" field.
  DateTime? _arrivedAtPickup;
  DateTime? get arrivedAtPickup => _arrivedAtPickup;
  set arrivedAtPickup(DateTime? val) => _arrivedAtPickup = val;

  bool hasArrivedAtPickup() => _arrivedAtPickup != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "deliveryRequestedTime" field.
  DateTime? _deliveryRequestedTime;
  DateTime? get deliveryRequestedTime => _deliveryRequestedTime;
  set deliveryRequestedTime(DateTime? val) => _deliveryRequestedTime = val;

  bool hasDeliveryRequestedTime() => _deliveryRequestedTime != null;

  // "expectedDropDateEnd" field.
  DateTime? _expectedDropDateEnd;
  DateTime? get expectedDropDateEnd => _expectedDropDateEnd;
  set expectedDropDateEnd(DateTime? val) => _expectedDropDateEnd = val;

  bool hasExpectedDropDateEnd() => _expectedDropDateEnd != null;

  // "expectedDropDateStart" field.
  DateTime? _expectedDropDateStart;
  DateTime? get expectedDropDateStart => _expectedDropDateStart;
  set expectedDropDateStart(DateTime? val) => _expectedDropDateStart = val;

  bool hasExpectedDropDateStart() => _expectedDropDateStart != null;

  // "expectedPickupDateEnd" field.
  DateTime? _expectedPickupDateEnd;
  DateTime? get expectedPickupDateEnd => _expectedPickupDateEnd;
  set expectedPickupDateEnd(DateTime? val) => _expectedPickupDateEnd = val;

  bool hasExpectedPickupDateEnd() => _expectedPickupDateEnd != null;

  // "expectedPickupDateStart" field.
  DateTime? _expectedPickupDateStart;
  DateTime? get expectedPickupDateStart => _expectedPickupDateStart;
  set expectedPickupDateStart(DateTime? val) => _expectedPickupDateStart = val;

  bool hasExpectedPickupDateStart() => _expectedPickupDateStart != null;

  // "firstAttemptTime" field.
  DateTime? _firstAttemptTime;
  DateTime? get firstAttemptTime => _firstAttemptTime;
  set firstAttemptTime(DateTime? val) => _firstAttemptTime = val;

  bool hasFirstAttemptTime() => _firstAttemptTime != null;

  // "firstFailedAttempt" field.
  DateTime? _firstFailedAttempt;
  DateTime? get firstFailedAttempt => _firstFailedAttempt;
  set firstFailedAttempt(DateTime? val) => _firstFailedAttempt = val;

  bool hasFirstFailedAttempt() => _firstFailedAttempt != null;

  // "inputDate" field.
  DateTime? _inputDate;
  DateTime? get inputDate => _inputDate;
  set inputDate(DateTime? val) => _inputDate = val;

  bool hasInputDate() => _inputDate != null;

  // "lastAttemptTime" field.
  DateTime? _lastAttemptTime;
  DateTime? get lastAttemptTime => _lastAttemptTime;
  set lastAttemptTime(DateTime? val) => _lastAttemptTime = val;

  bool hasLastAttemptTime() => _lastAttemptTime != null;

  // "lastFailedAttempt" field.
  DateTime? _lastFailedAttempt;
  DateTime? get lastFailedAttempt => _lastFailedAttempt;
  set lastFailedAttempt(DateTime? val) => _lastFailedAttempt = val;

  bool hasLastFailedAttempt() => _lastFailedAttempt != null;

  // "pickupFromPartnerTime" field.
  DateTime? _pickupFromPartnerTime;
  DateTime? get pickupFromPartnerTime => _pickupFromPartnerTime;
  set pickupFromPartnerTime(DateTime? val) => _pickupFromPartnerTime = val;

  bool hasPickupFromPartnerTime() => _pickupFromPartnerTime != null;

  // "receivedAtWarehouseTime" field.
  DateTime? _receivedAtWarehouseTime;
  DateTime? get receivedAtWarehouseTime => _receivedAtWarehouseTime;
  set receivedAtWarehouseTime(DateTime? val) => _receivedAtWarehouseTime = val;

  bool hasReceivedAtWarehouseTime() => _receivedAtWarehouseTime != null;

  // "slaEnd" field.
  DateTime? _slaEnd;
  DateTime? get slaEnd => _slaEnd;
  set slaEnd(DateTime? val) => _slaEnd = val;

  bool hasSlaEnd() => _slaEnd != null;

  // "slaStart" field.
  DateTime? _slaStart;
  DateTime? get slaStart => _slaStart;
  set slaStart(DateTime? val) => _slaStart = val;

  bool hasSlaStart() => _slaStart != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  static TimingStruct fromMap(Map<String, dynamic> data) => TimingStruct(
        id: data['id'] as String?,
        actualDropDateEnd: data['actualDropDateEnd'] as DateTime?,
        actualDropDateStart: data['actualDropDateStart'] as DateTime?,
        actualPickupDateEnd: data['actualPickupDateEnd'] as DateTime?,
        actualPickupDateStart: data['actualPickupDateStart'] as DateTime?,
        arrivedAtCustomer: data['arrivedAtCustomer'] as DateTime?,
        arrivedAtPickup: data['arrivedAtPickup'] as DateTime?,
        createdAt: data['createdAt'] as DateTime?,
        deliveryRequestedTime: data['deliveryRequestedTime'] as DateTime?,
        expectedDropDateEnd: data['expectedDropDateEnd'] as DateTime?,
        expectedDropDateStart: data['expectedDropDateStart'] as DateTime?,
        expectedPickupDateEnd: data['expectedPickupDateEnd'] as DateTime?,
        expectedPickupDateStart: data['expectedPickupDateStart'] as DateTime?,
        firstAttemptTime: data['firstAttemptTime'] as DateTime?,
        firstFailedAttempt: data['firstFailedAttempt'] as DateTime?,
        inputDate: data['inputDate'] as DateTime?,
        lastAttemptTime: data['lastAttemptTime'] as DateTime?,
        lastFailedAttempt: data['lastFailedAttempt'] as DateTime?,
        pickupFromPartnerTime: data['pickupFromPartnerTime'] as DateTime?,
        receivedAtWarehouseTime: data['receivedAtWarehouseTime'] as DateTime?,
        slaEnd: data['slaEnd'] as DateTime?,
        slaStart: data['slaStart'] as DateTime?,
        updatedAt: data['updated_at'] as DateTime?,
      );

  static TimingStruct? maybeFromMap(dynamic data) =>
      data is Map ? TimingStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'actualDropDateEnd': _actualDropDateEnd,
        'actualDropDateStart': _actualDropDateStart,
        'actualPickupDateEnd': _actualPickupDateEnd,
        'actualPickupDateStart': _actualPickupDateStart,
        'arrivedAtCustomer': _arrivedAtCustomer,
        'arrivedAtPickup': _arrivedAtPickup,
        'createdAt': _createdAt,
        'deliveryRequestedTime': _deliveryRequestedTime,
        'expectedDropDateEnd': _expectedDropDateEnd,
        'expectedDropDateStart': _expectedDropDateStart,
        'expectedPickupDateEnd': _expectedPickupDateEnd,
        'expectedPickupDateStart': _expectedPickupDateStart,
        'firstAttemptTime': _firstAttemptTime,
        'firstFailedAttempt': _firstFailedAttempt,
        'inputDate': _inputDate,
        'lastAttemptTime': _lastAttemptTime,
        'lastFailedAttempt': _lastFailedAttempt,
        'pickupFromPartnerTime': _pickupFromPartnerTime,
        'receivedAtWarehouseTime': _receivedAtWarehouseTime,
        'slaEnd': _slaEnd,
        'slaStart': _slaStart,
        'updated_at': _updatedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'actualDropDateEnd': serializeParam(
          _actualDropDateEnd,
          ParamType.DateTime,
        ),
        'actualDropDateStart': serializeParam(
          _actualDropDateStart,
          ParamType.DateTime,
        ),
        'actualPickupDateEnd': serializeParam(
          _actualPickupDateEnd,
          ParamType.DateTime,
        ),
        'actualPickupDateStart': serializeParam(
          _actualPickupDateStart,
          ParamType.DateTime,
        ),
        'arrivedAtCustomer': serializeParam(
          _arrivedAtCustomer,
          ParamType.DateTime,
        ),
        'arrivedAtPickup': serializeParam(
          _arrivedAtPickup,
          ParamType.DateTime,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'deliveryRequestedTime': serializeParam(
          _deliveryRequestedTime,
          ParamType.DateTime,
        ),
        'expectedDropDateEnd': serializeParam(
          _expectedDropDateEnd,
          ParamType.DateTime,
        ),
        'expectedDropDateStart': serializeParam(
          _expectedDropDateStart,
          ParamType.DateTime,
        ),
        'expectedPickupDateEnd': serializeParam(
          _expectedPickupDateEnd,
          ParamType.DateTime,
        ),
        'expectedPickupDateStart': serializeParam(
          _expectedPickupDateStart,
          ParamType.DateTime,
        ),
        'firstAttemptTime': serializeParam(
          _firstAttemptTime,
          ParamType.DateTime,
        ),
        'firstFailedAttempt': serializeParam(
          _firstFailedAttempt,
          ParamType.DateTime,
        ),
        'inputDate': serializeParam(
          _inputDate,
          ParamType.DateTime,
        ),
        'lastAttemptTime': serializeParam(
          _lastAttemptTime,
          ParamType.DateTime,
        ),
        'lastFailedAttempt': serializeParam(
          _lastFailedAttempt,
          ParamType.DateTime,
        ),
        'pickupFromPartnerTime': serializeParam(
          _pickupFromPartnerTime,
          ParamType.DateTime,
        ),
        'receivedAtWarehouseTime': serializeParam(
          _receivedAtWarehouseTime,
          ParamType.DateTime,
        ),
        'slaEnd': serializeParam(
          _slaEnd,
          ParamType.DateTime,
        ),
        'slaStart': serializeParam(
          _slaStart,
          ParamType.DateTime,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static TimingStruct fromSerializableMap(Map<String, dynamic> data) =>
      TimingStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        actualDropDateEnd: deserializeParam(
          data['actualDropDateEnd'],
          ParamType.DateTime,
          false,
        ),
        actualDropDateStart: deserializeParam(
          data['actualDropDateStart'],
          ParamType.DateTime,
          false,
        ),
        actualPickupDateEnd: deserializeParam(
          data['actualPickupDateEnd'],
          ParamType.DateTime,
          false,
        ),
        actualPickupDateStart: deserializeParam(
          data['actualPickupDateStart'],
          ParamType.DateTime,
          false,
        ),
        arrivedAtCustomer: deserializeParam(
          data['arrivedAtCustomer'],
          ParamType.DateTime,
          false,
        ),
        arrivedAtPickup: deserializeParam(
          data['arrivedAtPickup'],
          ParamType.DateTime,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        deliveryRequestedTime: deserializeParam(
          data['deliveryRequestedTime'],
          ParamType.DateTime,
          false,
        ),
        expectedDropDateEnd: deserializeParam(
          data['expectedDropDateEnd'],
          ParamType.DateTime,
          false,
        ),
        expectedDropDateStart: deserializeParam(
          data['expectedDropDateStart'],
          ParamType.DateTime,
          false,
        ),
        expectedPickupDateEnd: deserializeParam(
          data['expectedPickupDateEnd'],
          ParamType.DateTime,
          false,
        ),
        expectedPickupDateStart: deserializeParam(
          data['expectedPickupDateStart'],
          ParamType.DateTime,
          false,
        ),
        firstAttemptTime: deserializeParam(
          data['firstAttemptTime'],
          ParamType.DateTime,
          false,
        ),
        firstFailedAttempt: deserializeParam(
          data['firstFailedAttempt'],
          ParamType.DateTime,
          false,
        ),
        inputDate: deserializeParam(
          data['inputDate'],
          ParamType.DateTime,
          false,
        ),
        lastAttemptTime: deserializeParam(
          data['lastAttemptTime'],
          ParamType.DateTime,
          false,
        ),
        lastFailedAttempt: deserializeParam(
          data['lastFailedAttempt'],
          ParamType.DateTime,
          false,
        ),
        pickupFromPartnerTime: deserializeParam(
          data['pickupFromPartnerTime'],
          ParamType.DateTime,
          false,
        ),
        receivedAtWarehouseTime: deserializeParam(
          data['receivedAtWarehouseTime'],
          ParamType.DateTime,
          false,
        ),
        slaEnd: deserializeParam(
          data['slaEnd'],
          ParamType.DateTime,
          false,
        ),
        slaStart: deserializeParam(
          data['slaStart'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
      );

  static TimingStruct fromAlgoliaData(Map<String, dynamic> data) =>
      TimingStruct(
        id: convertAlgoliaParam(
          data['id'],
          ParamType.String,
          false,
        ),
        actualDropDateEnd: convertAlgoliaParam(
          data['actualDropDateEnd'],
          ParamType.DateTime,
          false,
        ),
        actualDropDateStart: convertAlgoliaParam(
          data['actualDropDateStart'],
          ParamType.DateTime,
          false,
        ),
        actualPickupDateEnd: convertAlgoliaParam(
          data['actualPickupDateEnd'],
          ParamType.DateTime,
          false,
        ),
        actualPickupDateStart: convertAlgoliaParam(
          data['actualPickupDateStart'],
          ParamType.DateTime,
          false,
        ),
        arrivedAtCustomer: convertAlgoliaParam(
          data['arrivedAtCustomer'],
          ParamType.DateTime,
          false,
        ),
        arrivedAtPickup: convertAlgoliaParam(
          data['arrivedAtPickup'],
          ParamType.DateTime,
          false,
        ),
        createdAt: convertAlgoliaParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        deliveryRequestedTime: convertAlgoliaParam(
          data['deliveryRequestedTime'],
          ParamType.DateTime,
          false,
        ),
        expectedDropDateEnd: convertAlgoliaParam(
          data['expectedDropDateEnd'],
          ParamType.DateTime,
          false,
        ),
        expectedDropDateStart: convertAlgoliaParam(
          data['expectedDropDateStart'],
          ParamType.DateTime,
          false,
        ),
        expectedPickupDateEnd: convertAlgoliaParam(
          data['expectedPickupDateEnd'],
          ParamType.DateTime,
          false,
        ),
        expectedPickupDateStart: convertAlgoliaParam(
          data['expectedPickupDateStart'],
          ParamType.DateTime,
          false,
        ),
        firstAttemptTime: convertAlgoliaParam(
          data['firstAttemptTime'],
          ParamType.DateTime,
          false,
        ),
        firstFailedAttempt: convertAlgoliaParam(
          data['firstFailedAttempt'],
          ParamType.DateTime,
          false,
        ),
        inputDate: convertAlgoliaParam(
          data['inputDate'],
          ParamType.DateTime,
          false,
        ),
        lastAttemptTime: convertAlgoliaParam(
          data['lastAttemptTime'],
          ParamType.DateTime,
          false,
        ),
        lastFailedAttempt: convertAlgoliaParam(
          data['lastFailedAttempt'],
          ParamType.DateTime,
          false,
        ),
        pickupFromPartnerTime: convertAlgoliaParam(
          data['pickupFromPartnerTime'],
          ParamType.DateTime,
          false,
        ),
        receivedAtWarehouseTime: convertAlgoliaParam(
          data['receivedAtWarehouseTime'],
          ParamType.DateTime,
          false,
        ),
        slaEnd: convertAlgoliaParam(
          data['slaEnd'],
          ParamType.DateTime,
          false,
        ),
        slaStart: convertAlgoliaParam(
          data['slaStart'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: convertAlgoliaParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'TimingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TimingStruct &&
        id == other.id &&
        actualDropDateEnd == other.actualDropDateEnd &&
        actualDropDateStart == other.actualDropDateStart &&
        actualPickupDateEnd == other.actualPickupDateEnd &&
        actualPickupDateStart == other.actualPickupDateStart &&
        arrivedAtCustomer == other.arrivedAtCustomer &&
        arrivedAtPickup == other.arrivedAtPickup &&
        createdAt == other.createdAt &&
        deliveryRequestedTime == other.deliveryRequestedTime &&
        expectedDropDateEnd == other.expectedDropDateEnd &&
        expectedDropDateStart == other.expectedDropDateStart &&
        expectedPickupDateEnd == other.expectedPickupDateEnd &&
        expectedPickupDateStart == other.expectedPickupDateStart &&
        firstAttemptTime == other.firstAttemptTime &&
        firstFailedAttempt == other.firstFailedAttempt &&
        inputDate == other.inputDate &&
        lastAttemptTime == other.lastAttemptTime &&
        lastFailedAttempt == other.lastFailedAttempt &&
        pickupFromPartnerTime == other.pickupFromPartnerTime &&
        receivedAtWarehouseTime == other.receivedAtWarehouseTime &&
        slaEnd == other.slaEnd &&
        slaStart == other.slaStart &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        actualDropDateEnd,
        actualDropDateStart,
        actualPickupDateEnd,
        actualPickupDateStart,
        arrivedAtCustomer,
        arrivedAtPickup,
        createdAt,
        deliveryRequestedTime,
        expectedDropDateEnd,
        expectedDropDateStart,
        expectedPickupDateEnd,
        expectedPickupDateStart,
        firstAttemptTime,
        firstFailedAttempt,
        inputDate,
        lastAttemptTime,
        lastFailedAttempt,
        pickupFromPartnerTime,
        receivedAtWarehouseTime,
        slaEnd,
        slaStart,
        updatedAt
      ]);
}

TimingStruct createTimingStruct({
  String? id,
  DateTime? actualDropDateEnd,
  DateTime? actualDropDateStart,
  DateTime? actualPickupDateEnd,
  DateTime? actualPickupDateStart,
  DateTime? arrivedAtCustomer,
  DateTime? arrivedAtPickup,
  DateTime? createdAt,
  DateTime? deliveryRequestedTime,
  DateTime? expectedDropDateEnd,
  DateTime? expectedDropDateStart,
  DateTime? expectedPickupDateEnd,
  DateTime? expectedPickupDateStart,
  DateTime? firstAttemptTime,
  DateTime? firstFailedAttempt,
  DateTime? inputDate,
  DateTime? lastAttemptTime,
  DateTime? lastFailedAttempt,
  DateTime? pickupFromPartnerTime,
  DateTime? receivedAtWarehouseTime,
  DateTime? slaEnd,
  DateTime? slaStart,
  DateTime? updatedAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TimingStruct(
      id: id,
      actualDropDateEnd: actualDropDateEnd,
      actualDropDateStart: actualDropDateStart,
      actualPickupDateEnd: actualPickupDateEnd,
      actualPickupDateStart: actualPickupDateStart,
      arrivedAtCustomer: arrivedAtCustomer,
      arrivedAtPickup: arrivedAtPickup,
      createdAt: createdAt,
      deliveryRequestedTime: deliveryRequestedTime,
      expectedDropDateEnd: expectedDropDateEnd,
      expectedDropDateStart: expectedDropDateStart,
      expectedPickupDateEnd: expectedPickupDateEnd,
      expectedPickupDateStart: expectedPickupDateStart,
      firstAttemptTime: firstAttemptTime,
      firstFailedAttempt: firstFailedAttempt,
      inputDate: inputDate,
      lastAttemptTime: lastAttemptTime,
      lastFailedAttempt: lastFailedAttempt,
      pickupFromPartnerTime: pickupFromPartnerTime,
      receivedAtWarehouseTime: receivedAtWarehouseTime,
      slaEnd: slaEnd,
      slaStart: slaStart,
      updatedAt: updatedAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TimingStruct? updateTimingStruct(
  TimingStruct? timing, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    timing
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTimingStructData(
  Map<String, dynamic> firestoreData,
  TimingStruct? timing,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (timing == null) {
    return;
  }
  if (timing.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && timing.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final timingData = getTimingFirestoreData(timing, forFieldValue);
  final nestedData = timingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = timing.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTimingFirestoreData(
  TimingStruct? timing, [
  bool forFieldValue = false,
]) {
  if (timing == null) {
    return {};
  }
  final firestoreData = mapToFirestore(timing.toMap());

  // Add any Firestore field values
  mapToFirestore(timing.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTimingListFirestoreData(
  List<TimingStruct>? timings,
) =>
    timings?.map((e) => getTimingFirestoreData(e, true)).toList() ?? [];
