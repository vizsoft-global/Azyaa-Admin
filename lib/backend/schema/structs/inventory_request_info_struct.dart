// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class InventoryRequestInfoStruct extends FFFirebaseStruct {
  InventoryRequestInfoStruct({
    String? inventoryRequestId,
    String? requestStatus,
    String? fulfillStatus,
    String? requestType,
    DateTime? adminPreferredDate,
    String? adminNotes,
    DateTime? designerPreferredNotes,
    String? designerNotes,
    String? raisedBy,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _inventoryRequestId = inventoryRequestId,
        _requestStatus = requestStatus,
        _fulfillStatus = fulfillStatus,
        _requestType = requestType,
        _adminPreferredDate = adminPreferredDate,
        _adminNotes = adminNotes,
        _designerPreferredNotes = designerPreferredNotes,
        _designerNotes = designerNotes,
        _raisedBy = raisedBy,
        super(firestoreUtilData);

  // "inventory_request_id" field.
  String? _inventoryRequestId;
  String get inventoryRequestId => _inventoryRequestId ?? '';
  set inventoryRequestId(String? val) => _inventoryRequestId = val;

  bool hasInventoryRequestId() => _inventoryRequestId != null;

  // "request_status" field.
  String? _requestStatus;
  String get requestStatus => _requestStatus ?? '';
  set requestStatus(String? val) => _requestStatus = val;

  bool hasRequestStatus() => _requestStatus != null;

  // "fulfill_status" field.
  String? _fulfillStatus;
  String get fulfillStatus => _fulfillStatus ?? '';
  set fulfillStatus(String? val) => _fulfillStatus = val;

  bool hasFulfillStatus() => _fulfillStatus != null;

  // "request_type" field.
  String? _requestType;
  String get requestType => _requestType ?? '';
  set requestType(String? val) => _requestType = val;

  bool hasRequestType() => _requestType != null;

  // "admin_preferred_date" field.
  DateTime? _adminPreferredDate;
  DateTime? get adminPreferredDate => _adminPreferredDate;
  set adminPreferredDate(DateTime? val) => _adminPreferredDate = val;

  bool hasAdminPreferredDate() => _adminPreferredDate != null;

  // "admin_notes" field.
  String? _adminNotes;
  String get adminNotes => _adminNotes ?? '';
  set adminNotes(String? val) => _adminNotes = val;

  bool hasAdminNotes() => _adminNotes != null;

  // "designer_preferred_notes" field.
  DateTime? _designerPreferredNotes;
  DateTime? get designerPreferredNotes => _designerPreferredNotes;
  set designerPreferredNotes(DateTime? val) => _designerPreferredNotes = val;

  bool hasDesignerPreferredNotes() => _designerPreferredNotes != null;

  // "designer_notes" field.
  String? _designerNotes;
  String get designerNotes => _designerNotes ?? '';
  set designerNotes(String? val) => _designerNotes = val;

  bool hasDesignerNotes() => _designerNotes != null;

  String? _raisedBy;
  String get raisedBy => _raisedBy ?? '';
  set raisedBy(String? val) => _raisedBy = val;

  bool hasRaisedBy() => _raisedBy != null;

  static InventoryRequestInfoStruct fromMap(Map<String, dynamic> data) =>
      InventoryRequestInfoStruct(
        inventoryRequestId: data['inventory_request_id'] as String?,
        requestStatus: data['request_status'] as String?,
        fulfillStatus: data['fulfill_status'] as String?,
        requestType: data['request_type'] as String?,
        adminPreferredDate: data['admin_preferred_date'] as DateTime?,
        adminNotes: data['admin_notes'] as String?,
        designerPreferredNotes: data['designer_preferred_notes'] as DateTime?,
        designerNotes: data['designer_notes'] as String?,
        raisedBy: data['raised_by'] as String?,
      );

  static InventoryRequestInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? InventoryRequestInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'inventory_request_id': _inventoryRequestId,
        'request_status': _requestStatus,
        'fulfill_status': _fulfillStatus,
        'request_type': _requestType,
        'admin_preferred_date': _adminPreferredDate,
        'admin_notes': _adminNotes,
        'designer_preferred_notes': _designerPreferredNotes,
        'designer_notes': _designerNotes,
        'raised_by': _raisedBy,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'inventory_request_id': serializeParam(
          _inventoryRequestId,
          ParamType.String,
        ),
        'request_status': serializeParam(
          _requestStatus,
          ParamType.String,
        ),
        'fulfill_status': serializeParam(
          _fulfillStatus,
          ParamType.String,
        ),
        'request_type': serializeParam(
          _requestType,
          ParamType.String,
        ),
        'admin_preferred_date': serializeParam(
          _adminPreferredDate,
          ParamType.DateTime,
        ),
        'admin_notes': serializeParam(
          _adminNotes,
          ParamType.String,
        ),
        'designer_preferred_notes': serializeParam(
          _designerPreferredNotes,
          ParamType.DateTime,
        ),
        'designer_notes': serializeParam(
          _designerNotes,
          ParamType.String,
        ),
        'raised_by': serializeParam(
          _raisedBy,
          ParamType.String,
        ),
      }.withoutNulls;

  static InventoryRequestInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InventoryRequestInfoStruct(
        inventoryRequestId: deserializeParam(
          data['inventory_request_id'],
          ParamType.String,
          false,
        ),
        requestStatus: deserializeParam(
          data['request_status'],
          ParamType.String,
          false,
        ),
        fulfillStatus: deserializeParam(
          data['fulfill_status'],
          ParamType.String,
          false,
        ),
        requestType: deserializeParam(
          data['request_type'],
          ParamType.String,
          false,
        ),
        adminPreferredDate: deserializeParam(
          data['admin_preferred_date'],
          ParamType.DateTime,
          false,
        ),
        adminNotes: deserializeParam(
          data['admin_notes'],
          ParamType.String,
          false,
        ),
        designerPreferredNotes: deserializeParam(
          data['designer_preferred_notes'],
          ParamType.DateTime,
          false,
        ),
        designerNotes: deserializeParam(
          data['designer_notes'],
          ParamType.String,
          false,
        ),
        raisedBy: deserializeParam(
          data['raised_by'],
          ParamType.String,
          false,
        ),
      );

  static InventoryRequestInfoStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      InventoryRequestInfoStruct(
        inventoryRequestId: convertAlgoliaParam(
          data['inventory_request_id'],
          ParamType.String,
          false,
        ),
        requestStatus: convertAlgoliaParam(
          data['request_status'],
          ParamType.String,
          false,
        ),
        fulfillStatus: convertAlgoliaParam(
          data['fulfill_status'],
          ParamType.String,
          false,
        ),
        requestType: convertAlgoliaParam(
          data['request_type'],
          ParamType.String,
          false,
        ),
        adminPreferredDate: convertAlgoliaParam(
          data['admin_preferred_date'],
          ParamType.DateTime,
          false,
        ),
        adminNotes: convertAlgoliaParam(
          data['admin_notes'],
          ParamType.String,
          false,
        ),
        designerPreferredNotes: convertAlgoliaParam(
          data['designer_preferred_notes'],
          ParamType.DateTime,
          false,
        ),
        designerNotes: convertAlgoliaParam(
          data['designer_notes'],
          ParamType.String,
          false,
        ),
        raisedBy: convertAlgoliaParam(
          data['raised_by'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'InventoryRequestInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InventoryRequestInfoStruct &&
        inventoryRequestId == other.inventoryRequestId &&
        requestStatus == other.requestStatus &&
        fulfillStatus == other.fulfillStatus &&
        requestType == other.requestType &&
        adminPreferredDate == other.adminPreferredDate &&
        adminNotes == other.adminNotes &&
        designerPreferredNotes == other.designerPreferredNotes &&
        designerNotes == other.designerNotes &&
        raisedBy == other.raisedBy;
  }

  @override
  int get hashCode => const ListEquality().hash([
        inventoryRequestId,
        requestStatus,
        fulfillStatus,
        requestType,
        adminPreferredDate,
        adminNotes,
        designerPreferredNotes,
        designerNotes,
        raisedBy,
      ]);
}

InventoryRequestInfoStruct createInventoryRequestInfoStruct({
  String? inventoryRequestId,
  String? requestStatus,
  String? fulfillStatus,
  String? requestType,
  DateTime? adminPreferredDate,
  String? adminNotes,
  DateTime? designerPreferredNotes,
  String? designerNotes,
  String? raisedBy,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InventoryRequestInfoStruct(
      inventoryRequestId: inventoryRequestId,
      requestStatus: requestStatus,
      fulfillStatus: fulfillStatus,
      requestType: requestType,
      adminPreferredDate: adminPreferredDate,
      adminNotes: adminNotes,
      designerPreferredNotes: designerPreferredNotes,
      designerNotes: designerNotes,
      raisedBy: raisedBy,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InventoryRequestInfoStruct? updateInventoryRequestInfoStruct(
  InventoryRequestInfoStruct? inventoryRequestInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    inventoryRequestInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInventoryRequestInfoStructData(
  Map<String, dynamic> firestoreData,
  InventoryRequestInfoStruct? inventoryRequestInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (inventoryRequestInfo == null) {
    return;
  }
  if (inventoryRequestInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && inventoryRequestInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final inventoryRequestInfoData =
      getInventoryRequestInfoFirestoreData(inventoryRequestInfo, forFieldValue);
  final nestedData =
      inventoryRequestInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      inventoryRequestInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInventoryRequestInfoFirestoreData(
  InventoryRequestInfoStruct? inventoryRequestInfo, [
  bool forFieldValue = false,
]) {
  if (inventoryRequestInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(inventoryRequestInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(inventoryRequestInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInventoryRequestInfoListFirestoreData(
  List<InventoryRequestInfoStruct>? inventoryRequestInfos,
) =>
    inventoryRequestInfos
        ?.map((e) => getInventoryRequestInfoFirestoreData(e, true))
        .toList() ??
    [];
