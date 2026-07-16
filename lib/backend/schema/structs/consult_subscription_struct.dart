// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConsultSubscriptionStruct extends FFFirebaseStruct {
  ConsultSubscriptionStruct({
    SessionListStruct? subscriptionSessionInfo,
    SessionSlotStruct? subscriptionSessionSlotInfo,
    DateTime? subscriptionFrom,
    DateTime? subscriptionTo,
    DateTime? subscriptionDate,
    DocumentReference? subscriptionDesignerRef,
    DesignerMainInfoStruct? subscriptionDesignerMainInfo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subscriptionSessionInfo = subscriptionSessionInfo,
        _subscriptionSessionSlotInfo = subscriptionSessionSlotInfo,
        _subscriptionFrom = subscriptionFrom,
        _subscriptionTo = subscriptionTo,
        _subscriptionDate = subscriptionDate,
        _subscriptionDesignerRef = subscriptionDesignerRef,
        _subscriptionDesignerMainInfo = subscriptionDesignerMainInfo,
        super(firestoreUtilData);

  // "subscription_session_info" field.
  SessionListStruct? _subscriptionSessionInfo;
  SessionListStruct get subscriptionSessionInfo =>
      _subscriptionSessionInfo ?? SessionListStruct();
  set subscriptionSessionInfo(SessionListStruct? val) =>
      _subscriptionSessionInfo = val;

  void updateSubscriptionSessionInfo(Function(SessionListStruct) updateFn) {
    updateFn(_subscriptionSessionInfo ??= SessionListStruct());
  }

  bool hasSubscriptionSessionInfo() => _subscriptionSessionInfo != null;

  // "subscription_session_slot_info" field.
  SessionSlotStruct? _subscriptionSessionSlotInfo;
  SessionSlotStruct get subscriptionSessionSlotInfo =>
      _subscriptionSessionSlotInfo ?? SessionSlotStruct();
  set subscriptionSessionSlotInfo(SessionSlotStruct? val) =>
      _subscriptionSessionSlotInfo = val;

  void updateSubscriptionSessionSlotInfo(Function(SessionSlotStruct) updateFn) {
    updateFn(_subscriptionSessionSlotInfo ??= SessionSlotStruct());
  }

  bool hasSubscriptionSessionSlotInfo() => _subscriptionSessionSlotInfo != null;

  // "subscription_from" field.
  DateTime? _subscriptionFrom;
  DateTime? get subscriptionFrom => _subscriptionFrom;
  set subscriptionFrom(DateTime? val) => _subscriptionFrom = val;

  bool hasSubscriptionFrom() => _subscriptionFrom != null;

  // "subscription_to" field.
  DateTime? _subscriptionTo;
  DateTime? get subscriptionTo => _subscriptionTo;
  set subscriptionTo(DateTime? val) => _subscriptionTo = val;

  bool hasSubscriptionTo() => _subscriptionTo != null;

  // "subscription_date" field.
  DateTime? _subscriptionDate;
  DateTime? get subscriptionDate => _subscriptionDate;
  set subscriptionDate(DateTime? val) => _subscriptionDate = val;

  bool hasSubscriptionDate() => _subscriptionDate != null;

  // "subscription_designer_ref" field.
  DocumentReference? _subscriptionDesignerRef;
  DocumentReference? get subscriptionDesignerRef => _subscriptionDesignerRef;
  set subscriptionDesignerRef(DocumentReference? val) =>
      _subscriptionDesignerRef = val;

  bool hasSubscriptionDesignerRef() => _subscriptionDesignerRef != null;

  // "subscription_designer_main_info" field.
  DesignerMainInfoStruct? _subscriptionDesignerMainInfo;
  DesignerMainInfoStruct get subscriptionDesignerMainInfo =>
      _subscriptionDesignerMainInfo ?? DesignerMainInfoStruct();
  set subscriptionDesignerMainInfo(DesignerMainInfoStruct? val) =>
      _subscriptionDesignerMainInfo = val;

  void updateSubscriptionDesignerMainInfo(
      Function(DesignerMainInfoStruct) updateFn) {
    updateFn(_subscriptionDesignerMainInfo ??= DesignerMainInfoStruct());
  }

  bool hasSubscriptionDesignerMainInfo() =>
      _subscriptionDesignerMainInfo != null;

  static ConsultSubscriptionStruct fromMap(Map<String, dynamic> data) =>
      ConsultSubscriptionStruct(
        subscriptionSessionInfo: data['subscription_session_info']
                is SessionListStruct
            ? data['subscription_session_info']
            : SessionListStruct.maybeFromMap(data['subscription_session_info']),
        subscriptionSessionSlotInfo:
            data['subscription_session_slot_info'] is SessionSlotStruct
                ? data['subscription_session_slot_info']
                : SessionSlotStruct.maybeFromMap(
                    data['subscription_session_slot_info']),
        subscriptionFrom: data['subscription_from'] as DateTime?,
        subscriptionTo: data['subscription_to'] as DateTime?,
        subscriptionDate: data['subscription_date'] as DateTime?,
        subscriptionDesignerRef:
            data['subscription_designer_ref'] as DocumentReference?,
        subscriptionDesignerMainInfo:
            data['subscription_designer_main_info'] is DesignerMainInfoStruct
                ? data['subscription_designer_main_info']
                : DesignerMainInfoStruct.maybeFromMap(
                    data['subscription_designer_main_info']),
      );

  static ConsultSubscriptionStruct? maybeFromMap(dynamic data) => data is Map
      ? ConsultSubscriptionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'subscription_session_info': _subscriptionSessionInfo?.toMap(),
        'subscription_session_slot_info': _subscriptionSessionSlotInfo?.toMap(),
        'subscription_from': _subscriptionFrom,
        'subscription_to': _subscriptionTo,
        'subscription_date': _subscriptionDate,
        'subscription_designer_ref': _subscriptionDesignerRef,
        'subscription_designer_main_info':
            _subscriptionDesignerMainInfo?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subscription_session_info': serializeParam(
          _subscriptionSessionInfo,
          ParamType.DataStruct,
        ),
        'subscription_session_slot_info': serializeParam(
          _subscriptionSessionSlotInfo,
          ParamType.DataStruct,
        ),
        'subscription_from': serializeParam(
          _subscriptionFrom,
          ParamType.DateTime,
        ),
        'subscription_to': serializeParam(
          _subscriptionTo,
          ParamType.DateTime,
        ),
        'subscription_date': serializeParam(
          _subscriptionDate,
          ParamType.DateTime,
        ),
        'subscription_designer_ref': serializeParam(
          _subscriptionDesignerRef,
          ParamType.DocumentReference,
        ),
        'subscription_designer_main_info': serializeParam(
          _subscriptionDesignerMainInfo,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ConsultSubscriptionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ConsultSubscriptionStruct(
        subscriptionSessionInfo: deserializeStructParam(
          data['subscription_session_info'],
          ParamType.DataStruct,
          false,
          structBuilder: SessionListStruct.fromSerializableMap,
        ),
        subscriptionSessionSlotInfo: deserializeStructParam(
          data['subscription_session_slot_info'],
          ParamType.DataStruct,
          false,
          structBuilder: SessionSlotStruct.fromSerializableMap,
        ),
        subscriptionFrom: deserializeParam(
          data['subscription_from'],
          ParamType.DateTime,
          false,
        ),
        subscriptionTo: deserializeParam(
          data['subscription_to'],
          ParamType.DateTime,
          false,
        ),
        subscriptionDate: deserializeParam(
          data['subscription_date'],
          ParamType.DateTime,
          false,
        ),
        subscriptionDesignerRef: deserializeParam(
          data['subscription_designer_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        subscriptionDesignerMainInfo: deserializeStructParam(
          data['subscription_designer_main_info'],
          ParamType.DataStruct,
          false,
          structBuilder: DesignerMainInfoStruct.fromSerializableMap,
        ),
      );

  static ConsultSubscriptionStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ConsultSubscriptionStruct(
        subscriptionSessionInfo: convertAlgoliaParam(
          data['subscription_session_info'],
          ParamType.DataStruct,
          false,
          structBuilder: SessionListStruct.fromAlgoliaData,
        ),
        subscriptionSessionSlotInfo: convertAlgoliaParam(
          data['subscription_session_slot_info'],
          ParamType.DataStruct,
          false,
          structBuilder: SessionSlotStruct.fromAlgoliaData,
        ),
        subscriptionFrom: convertAlgoliaParam(
          data['subscription_from'],
          ParamType.DateTime,
          false,
        ),
        subscriptionTo: convertAlgoliaParam(
          data['subscription_to'],
          ParamType.DateTime,
          false,
        ),
        subscriptionDate: convertAlgoliaParam(
          data['subscription_date'],
          ParamType.DateTime,
          false,
        ),
        subscriptionDesignerRef: convertAlgoliaParam(
          data['subscription_designer_ref'],
          ParamType.DocumentReference,
          false,
        ),
        subscriptionDesignerMainInfo: convertAlgoliaParam(
          data['subscription_designer_main_info'],
          ParamType.DataStruct,
          false,
          structBuilder: DesignerMainInfoStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ConsultSubscriptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConsultSubscriptionStruct &&
        subscriptionSessionInfo == other.subscriptionSessionInfo &&
        subscriptionSessionSlotInfo == other.subscriptionSessionSlotInfo &&
        subscriptionFrom == other.subscriptionFrom &&
        subscriptionTo == other.subscriptionTo &&
        subscriptionDate == other.subscriptionDate &&
        subscriptionDesignerRef == other.subscriptionDesignerRef &&
        subscriptionDesignerMainInfo == other.subscriptionDesignerMainInfo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        subscriptionSessionInfo,
        subscriptionSessionSlotInfo,
        subscriptionFrom,
        subscriptionTo,
        subscriptionDate,
        subscriptionDesignerRef,
        subscriptionDesignerMainInfo
      ]);
}

ConsultSubscriptionStruct createConsultSubscriptionStruct({
  SessionListStruct? subscriptionSessionInfo,
  SessionSlotStruct? subscriptionSessionSlotInfo,
  DateTime? subscriptionFrom,
  DateTime? subscriptionTo,
  DateTime? subscriptionDate,
  DocumentReference? subscriptionDesignerRef,
  DesignerMainInfoStruct? subscriptionDesignerMainInfo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConsultSubscriptionStruct(
      subscriptionSessionInfo: subscriptionSessionInfo ??
          (clearUnsetFields ? SessionListStruct() : null),
      subscriptionSessionSlotInfo: subscriptionSessionSlotInfo ??
          (clearUnsetFields ? SessionSlotStruct() : null),
      subscriptionFrom: subscriptionFrom,
      subscriptionTo: subscriptionTo,
      subscriptionDate: subscriptionDate,
      subscriptionDesignerRef: subscriptionDesignerRef,
      subscriptionDesignerMainInfo: subscriptionDesignerMainInfo ??
          (clearUnsetFields ? DesignerMainInfoStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConsultSubscriptionStruct? updateConsultSubscriptionStruct(
  ConsultSubscriptionStruct? consultSubscription, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    consultSubscription
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConsultSubscriptionStructData(
  Map<String, dynamic> firestoreData,
  ConsultSubscriptionStruct? consultSubscription,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (consultSubscription == null) {
    return;
  }
  if (consultSubscription.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && consultSubscription.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final consultSubscriptionData =
      getConsultSubscriptionFirestoreData(consultSubscription, forFieldValue);
  final nestedData =
      consultSubscriptionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      consultSubscription.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConsultSubscriptionFirestoreData(
  ConsultSubscriptionStruct? consultSubscription, [
  bool forFieldValue = false,
]) {
  if (consultSubscription == null) {
    return {};
  }
  final firestoreData = mapToFirestore(consultSubscription.toMap());

  // Handle nested data for "subscription_session_info" field.
  addSessionListStructData(
    firestoreData,
    consultSubscription.hasSubscriptionSessionInfo()
        ? consultSubscription.subscriptionSessionInfo
        : null,
    'subscription_session_info',
    forFieldValue,
  );

  // Handle nested data for "subscription_session_slot_info" field.
  addSessionSlotStructData(
    firestoreData,
    consultSubscription.hasSubscriptionSessionSlotInfo()
        ? consultSubscription.subscriptionSessionSlotInfo
        : null,
    'subscription_session_slot_info',
    forFieldValue,
  );

  // Handle nested data for "subscription_designer_main_info" field.
  addDesignerMainInfoStructData(
    firestoreData,
    consultSubscription.hasSubscriptionDesignerMainInfo()
        ? consultSubscription.subscriptionDesignerMainInfo
        : null,
    'subscription_designer_main_info',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(consultSubscription.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConsultSubscriptionListFirestoreData(
  List<ConsultSubscriptionStruct>? consultSubscriptions,
) =>
    consultSubscriptions
        ?.map((e) => getConsultSubscriptionFirestoreData(e, true))
        .toList() ??
    [];
