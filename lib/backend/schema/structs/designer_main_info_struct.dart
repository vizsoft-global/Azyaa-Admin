// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DesignerMainInfoStruct extends FFFirebaseStruct {
  DesignerMainInfoStruct({
    String? designerId,
    String? designerStatus,
    FormListStruct? designerInfo,
    DesignerZoomDetailsStruct? designerZoomDetails,
    DesignerRequestsStruct? designerRequests,
    DesignerApprovalsStruct? designerApproval,
    AddressInfoStruct? designerAddressInfo,
    UserShippingaddressInfoStruct? designerPickupAddress,
    List<DocumentReference>? designerFollowersList,
    List<SessionListStruct>? deisgnerSessionList,
    bool? designerConsulationAvailable,
    ContractInfoStruct? designerContractInfo,
    BankDetailsStruct? designerBankInfo,
    List<DesignerSizeChartsStruct>? designerSizeChartList,
    PayoutInfoStruct? designerPayoutInfo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _designerId = designerId,
        _designerStatus = designerStatus,
        _designerInfo = designerInfo,
        _designerZoomDetails = designerZoomDetails,
        _designerRequests = designerRequests,
        _designerApproval = designerApproval,
        _designerAddressInfo = designerAddressInfo,
        _designerPickupAddress = designerPickupAddress,
        _designerFollowersList = designerFollowersList,
        _deisgnerSessionList = deisgnerSessionList,
        _designerConsulationAvailable = designerConsulationAvailable,
        _designerContractInfo = designerContractInfo,
        _designerBankInfo = designerBankInfo,
        _designerSizeChartList = designerSizeChartList,
        _designerPayoutInfo = designerPayoutInfo,
        super(firestoreUtilData);

  // "designer_id" field.
  String? _designerId;
  String get designerId => _designerId ?? '';
  set designerId(String? val) => _designerId = val;

  bool hasDesignerId() => _designerId != null;

  // "designer_status" field.
  String? _designerStatus;
  String get designerStatus => _designerStatus ?? '';
  set designerStatus(String? val) => _designerStatus = val;

  bool hasDesignerStatus() => _designerStatus != null;

  // "designer_info" field.
  FormListStruct? _designerInfo;
  FormListStruct get designerInfo => _designerInfo ?? FormListStruct();
  set designerInfo(FormListStruct? val) => _designerInfo = val;

  void updateDesignerInfo(Function(FormListStruct) updateFn) {
    updateFn(_designerInfo ??= FormListStruct());
  }

  bool hasDesignerInfo() => _designerInfo != null;

  // "designer_zoom_details" field.
  DesignerZoomDetailsStruct? _designerZoomDetails;
  DesignerZoomDetailsStruct get designerZoomDetails =>
      _designerZoomDetails ?? DesignerZoomDetailsStruct();
  set designerZoomDetails(DesignerZoomDetailsStruct? val) =>
      _designerZoomDetails = val;

  void updateDesignerZoomDetails(Function(DesignerZoomDetailsStruct) updateFn) {
    updateFn(_designerZoomDetails ??= DesignerZoomDetailsStruct());
  }

  bool hasDesignerZoomDetails() => _designerZoomDetails != null;

  // "designer_requests" field.
  DesignerRequestsStruct? _designerRequests;
  DesignerRequestsStruct get designerRequests =>
      _designerRequests ?? DesignerRequestsStruct();
  set designerRequests(DesignerRequestsStruct? val) => _designerRequests = val;

  void updateDesignerRequests(Function(DesignerRequestsStruct) updateFn) {
    updateFn(_designerRequests ??= DesignerRequestsStruct());
  }

  bool hasDesignerRequests() => _designerRequests != null;

  // "designer_approval" field.
  DesignerApprovalsStruct? _designerApproval;
  DesignerApprovalsStruct get designerApproval =>
      _designerApproval ?? DesignerApprovalsStruct();
  set designerApproval(DesignerApprovalsStruct? val) => _designerApproval = val;

  void updateDesignerApproval(Function(DesignerApprovalsStruct) updateFn) {
    updateFn(_designerApproval ??= DesignerApprovalsStruct());
  }

  bool hasDesignerApproval() => _designerApproval != null;

  // "designer_address_info" field.
  AddressInfoStruct? _designerAddressInfo;
  AddressInfoStruct get designerAddressInfo =>
      _designerAddressInfo ?? AddressInfoStruct();
  set designerAddressInfo(AddressInfoStruct? val) => _designerAddressInfo = val;

  void updateDesignerAddressInfo(Function(AddressInfoStruct) updateFn) {
    updateFn(_designerAddressInfo ??= AddressInfoStruct());
  }

  bool hasDesignerAddressInfo() => _designerAddressInfo != null;

  // "designer_pickup_address" field.
  UserShippingaddressInfoStruct? _designerPickupAddress;
  UserShippingaddressInfoStruct get designerPickupAddress =>
      _designerPickupAddress ?? UserShippingaddressInfoStruct();
  set designerPickupAddress(UserShippingaddressInfoStruct? val) =>
      _designerPickupAddress = val;

  void updateDesignerPickupAddress(
      Function(UserShippingaddressInfoStruct) updateFn) {
    updateFn(_designerPickupAddress ??= UserShippingaddressInfoStruct());
  }

  bool hasDesignerPickupAddress() => _designerPickupAddress != null;

  // "designer_followers_list" field.
  List<DocumentReference>? _designerFollowersList;
  List<DocumentReference> get designerFollowersList =>
      _designerFollowersList ?? const [];
  set designerFollowersList(List<DocumentReference>? val) =>
      _designerFollowersList = val;

  void updateDesignerFollowersList(Function(List<DocumentReference>) updateFn) {
    updateFn(_designerFollowersList ??= []);
  }

  bool hasDesignerFollowersList() => _designerFollowersList != null;

  // "deisgner_session_list" field.
  List<SessionListStruct>? _deisgnerSessionList;
  List<SessionListStruct> get deisgnerSessionList =>
      _deisgnerSessionList ?? const [];
  set deisgnerSessionList(List<SessionListStruct>? val) =>
      _deisgnerSessionList = val;

  void updateDeisgnerSessionList(Function(List<SessionListStruct>) updateFn) {
    updateFn(_deisgnerSessionList ??= []);
  }

  bool hasDeisgnerSessionList() => _deisgnerSessionList != null;

  // "designer_consulation_available" field.
  bool? _designerConsulationAvailable;
  bool get designerConsulationAvailable =>
      _designerConsulationAvailable ?? false;
  set designerConsulationAvailable(bool? val) =>
      _designerConsulationAvailable = val;

  bool hasDesignerConsulationAvailable() =>
      _designerConsulationAvailable != null;

  // "designer_contract_info" field.
  ContractInfoStruct? _designerContractInfo;
  ContractInfoStruct get designerContractInfo =>
      _designerContractInfo ?? ContractInfoStruct();
  set designerContractInfo(ContractInfoStruct? val) =>
      _designerContractInfo = val;

  void updateDesignerContractInfo(Function(ContractInfoStruct) updateFn) {
    updateFn(_designerContractInfo ??= ContractInfoStruct());
  }

  bool hasDesignerContractInfo() => _designerContractInfo != null;

  // "designer_bank_info" field.
  BankDetailsStruct? _designerBankInfo;
  BankDetailsStruct get designerBankInfo =>
      _designerBankInfo ?? BankDetailsStruct();
  set designerBankInfo(BankDetailsStruct? val) => _designerBankInfo = val;

  void updateDesignerBankInfo(Function(BankDetailsStruct) updateFn) {
    updateFn(_designerBankInfo ??= BankDetailsStruct());
  }

  bool hasDesignerBankInfo() => _designerBankInfo != null;

  // "designer_size_chart_list" field.
  List<DesignerSizeChartsStruct>? _designerSizeChartList;
  List<DesignerSizeChartsStruct> get designerSizeChartList =>
      _designerSizeChartList ?? const [];
  set designerSizeChartList(List<DesignerSizeChartsStruct>? val) =>
      _designerSizeChartList = val;

  void updateDesignerSizeChartList(
      Function(List<DesignerSizeChartsStruct>) updateFn) {
    updateFn(_designerSizeChartList ??= []);
  }

  bool hasDesignerSizeChartList() => _designerSizeChartList != null;

  // "designer_payout_info" field.
  PayoutInfoStruct? _designerPayoutInfo;
  PayoutInfoStruct get designerPayoutInfo =>
      _designerPayoutInfo ?? PayoutInfoStruct();
  set designerPayoutInfo(PayoutInfoStruct? val) => _designerPayoutInfo = val;

  void updateDesignerPayoutInfo(Function(PayoutInfoStruct) updateFn) {
    updateFn(_designerPayoutInfo ??= PayoutInfoStruct());
  }

  bool hasDesignerPayoutInfo() => _designerPayoutInfo != null;

  static DesignerMainInfoStruct fromMap(Map<String, dynamic> data) =>
      DesignerMainInfoStruct(
        designerId: data['designer_id'] as String?,
        designerStatus: data['designer_status'] as String?,
        designerInfo: data['designer_info'] is FormListStruct
            ? data['designer_info']
            : FormListStruct.maybeFromMap(data['designer_info']),
        designerZoomDetails:
            data['designer_zoom_details'] is DesignerZoomDetailsStruct
                ? data['designer_zoom_details']
                : DesignerZoomDetailsStruct.maybeFromMap(
                    data['designer_zoom_details']),
        designerRequests: data['designer_requests'] is DesignerRequestsStruct
            ? data['designer_requests']
            : DesignerRequestsStruct.maybeFromMap(data['designer_requests']),
        designerApproval: data['designer_approval'] is DesignerApprovalsStruct
            ? data['designer_approval']
            : DesignerApprovalsStruct.maybeFromMap(data['designer_approval']),
        designerAddressInfo: data['designer_address_info'] is AddressInfoStruct
            ? data['designer_address_info']
            : AddressInfoStruct.maybeFromMap(data['designer_address_info']),
        designerPickupAddress:
            data['designer_pickup_address'] is UserShippingaddressInfoStruct
                ? data['designer_pickup_address']
                : UserShippingaddressInfoStruct.maybeFromMap(
                    data['designer_pickup_address']),
        designerFollowersList: getDataList(data['designer_followers_list']),
        deisgnerSessionList: getStructList(
          data['deisgner_session_list'],
          SessionListStruct.fromMap,
        ),
        designerConsulationAvailable:
            data['designer_consulation_available'] as bool?,
        designerContractInfo: data['designer_contract_info']
                is ContractInfoStruct
            ? data['designer_contract_info']
            : ContractInfoStruct.maybeFromMap(data['designer_contract_info']),
        designerBankInfo: data['designer_bank_info'] is BankDetailsStruct
            ? data['designer_bank_info']
            : BankDetailsStruct.maybeFromMap(data['designer_bank_info']),
        designerSizeChartList: getStructList(
          data['designer_size_chart_list'],
          DesignerSizeChartsStruct.fromMap,
        ),
        designerPayoutInfo: data['designer_payout_info'] is PayoutInfoStruct
            ? data['designer_payout_info']
            : PayoutInfoStruct.maybeFromMap(data['designer_payout_info']),
      );

  static DesignerMainInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? DesignerMainInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'designer_id': _designerId,
        'designer_status': _designerStatus,
        'designer_info': _designerInfo?.toMap(),
        'designer_zoom_details': _designerZoomDetails?.toMap(),
        'designer_requests': _designerRequests?.toMap(),
        'designer_approval': _designerApproval?.toMap(),
        'designer_address_info': _designerAddressInfo?.toMap(),
        'designer_pickup_address': _designerPickupAddress?.toMap(),
        'designer_followers_list': _designerFollowersList,
        'deisgner_session_list':
            _deisgnerSessionList?.map((e) => e.toMap()).toList(),
        'designer_consulation_available': _designerConsulationAvailable,
        'designer_contract_info': _designerContractInfo?.toMap(),
        'designer_bank_info': _designerBankInfo?.toMap(),
        'designer_size_chart_list':
            _designerSizeChartList?.map((e) => e.toMap()).toList(),
        'designer_payout_info': _designerPayoutInfo?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'designer_id': serializeParam(
          _designerId,
          ParamType.String,
        ),
        'designer_status': serializeParam(
          _designerStatus,
          ParamType.String,
        ),
        'designer_info': serializeParam(
          _designerInfo,
          ParamType.DataStruct,
        ),
        'designer_zoom_details': serializeParam(
          _designerZoomDetails,
          ParamType.DataStruct,
        ),
        'designer_requests': serializeParam(
          _designerRequests,
          ParamType.DataStruct,
        ),
        'designer_approval': serializeParam(
          _designerApproval,
          ParamType.DataStruct,
        ),
        'designer_address_info': serializeParam(
          _designerAddressInfo,
          ParamType.DataStruct,
        ),
        'designer_pickup_address': serializeParam(
          _designerPickupAddress,
          ParamType.DataStruct,
        ),
        'designer_followers_list': serializeParam(
          _designerFollowersList,
          ParamType.DocumentReference,
          isList: true,
        ),
        'deisgner_session_list': serializeParam(
          _deisgnerSessionList,
          ParamType.DataStruct,
          isList: true,
        ),
        'designer_consulation_available': serializeParam(
          _designerConsulationAvailable,
          ParamType.bool,
        ),
        'designer_contract_info': serializeParam(
          _designerContractInfo,
          ParamType.DataStruct,
        ),
        'designer_bank_info': serializeParam(
          _designerBankInfo,
          ParamType.DataStruct,
        ),
        'designer_size_chart_list': serializeParam(
          _designerSizeChartList,
          ParamType.DataStruct,
          isList: true,
        ),
        'designer_payout_info': serializeParam(
          _designerPayoutInfo,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static DesignerMainInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DesignerMainInfoStruct(
        designerId: deserializeParam(
          data['designer_id'],
          ParamType.String,
          false,
        ),
        designerStatus: deserializeParam(
          data['designer_status'],
          ParamType.String,
          false,
        ),
        designerInfo: deserializeStructParam(
          data['designer_info'],
          ParamType.DataStruct,
          false,
          structBuilder: FormListStruct.fromSerializableMap,
        ),
        designerZoomDetails: deserializeStructParam(
          data['designer_zoom_details'],
          ParamType.DataStruct,
          false,
          structBuilder: DesignerZoomDetailsStruct.fromSerializableMap,
        ),
        designerRequests: deserializeStructParam(
          data['designer_requests'],
          ParamType.DataStruct,
          false,
          structBuilder: DesignerRequestsStruct.fromSerializableMap,
        ),
        designerApproval: deserializeStructParam(
          data['designer_approval'],
          ParamType.DataStruct,
          false,
          structBuilder: DesignerApprovalsStruct.fromSerializableMap,
        ),
        designerAddressInfo: deserializeStructParam(
          data['designer_address_info'],
          ParamType.DataStruct,
          false,
          structBuilder: AddressInfoStruct.fromSerializableMap,
        ),
        designerPickupAddress: deserializeStructParam(
          data['designer_pickup_address'],
          ParamType.DataStruct,
          false,
          structBuilder: UserShippingaddressInfoStruct.fromSerializableMap,
        ),
        designerFollowersList: deserializeParam<DocumentReference>(
          data['designer_followers_list'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['users'],
        ),
        deisgnerSessionList: deserializeStructParam<SessionListStruct>(
          data['deisgner_session_list'],
          ParamType.DataStruct,
          true,
          structBuilder: SessionListStruct.fromSerializableMap,
        ),
        designerConsulationAvailable: deserializeParam(
          data['designer_consulation_available'],
          ParamType.bool,
          false,
        ),
        designerContractInfo: deserializeStructParam(
          data['designer_contract_info'],
          ParamType.DataStruct,
          false,
          structBuilder: ContractInfoStruct.fromSerializableMap,
        ),
        designerBankInfo: deserializeStructParam(
          data['designer_bank_info'],
          ParamType.DataStruct,
          false,
          structBuilder: BankDetailsStruct.fromSerializableMap,
        ),
        designerSizeChartList: deserializeStructParam<DesignerSizeChartsStruct>(
          data['designer_size_chart_list'],
          ParamType.DataStruct,
          true,
          structBuilder: DesignerSizeChartsStruct.fromSerializableMap,
        ),
        designerPayoutInfo: deserializeStructParam(
          data['designer_payout_info'],
          ParamType.DataStruct,
          false,
          structBuilder: PayoutInfoStruct.fromSerializableMap,
        ),
      );

  static DesignerMainInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DesignerMainInfoStruct(
        designerId: convertAlgoliaParam(
          data['designer_id'],
          ParamType.String,
          false,
        ),
        designerStatus: convertAlgoliaParam(
          data['designer_status'],
          ParamType.String,
          false,
        ),
        designerInfo: convertAlgoliaParam(
          data['designer_info'],
          ParamType.DataStruct,
          false,
          structBuilder: FormListStruct.fromAlgoliaData,
        ),
        designerZoomDetails: convertAlgoliaParam(
          data['designer_zoom_details'],
          ParamType.DataStruct,
          false,
          structBuilder: DesignerZoomDetailsStruct.fromAlgoliaData,
        ),
        designerRequests: convertAlgoliaParam(
          data['designer_requests'],
          ParamType.DataStruct,
          false,
          structBuilder: DesignerRequestsStruct.fromAlgoliaData,
        ),
        designerApproval: convertAlgoliaParam(
          data['designer_approval'],
          ParamType.DataStruct,
          false,
          structBuilder: DesignerApprovalsStruct.fromAlgoliaData,
        ),
        designerAddressInfo: convertAlgoliaParam(
          data['designer_address_info'],
          ParamType.DataStruct,
          false,
          structBuilder: AddressInfoStruct.fromAlgoliaData,
        ),
        designerPickupAddress: convertAlgoliaParam(
          data['designer_pickup_address'],
          ParamType.DataStruct,
          false,
          structBuilder: UserShippingaddressInfoStruct.fromAlgoliaData,
        ),
        designerFollowersList: convertAlgoliaParam<DocumentReference>(
          data['designer_followers_list'],
          ParamType.DocumentReference,
          true,
        ),
        deisgnerSessionList: convertAlgoliaParam<SessionListStruct>(
          data['deisgner_session_list'],
          ParamType.DataStruct,
          true,
          structBuilder: SessionListStruct.fromAlgoliaData,
        ),
        designerConsulationAvailable: convertAlgoliaParam(
          data['designer_consulation_available'],
          ParamType.bool,
          false,
        ),
        designerContractInfo: convertAlgoliaParam(
          data['designer_contract_info'],
          ParamType.DataStruct,
          false,
          structBuilder: ContractInfoStruct.fromAlgoliaData,
        ),
        designerBankInfo: convertAlgoliaParam(
          data['designer_bank_info'],
          ParamType.DataStruct,
          false,
          structBuilder: BankDetailsStruct.fromAlgoliaData,
        ),
        designerSizeChartList: convertAlgoliaParam<DesignerSizeChartsStruct>(
          data['designer_size_chart_list'],
          ParamType.DataStruct,
          true,
          structBuilder: DesignerSizeChartsStruct.fromAlgoliaData,
        ),
        designerPayoutInfo: convertAlgoliaParam(
          data['designer_payout_info'],
          ParamType.DataStruct,
          false,
          structBuilder: PayoutInfoStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DesignerMainInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DesignerMainInfoStruct &&
        designerId == other.designerId &&
        designerStatus == other.designerStatus &&
        designerInfo == other.designerInfo &&
        designerZoomDetails == other.designerZoomDetails &&
        designerRequests == other.designerRequests &&
        designerApproval == other.designerApproval &&
        designerAddressInfo == other.designerAddressInfo &&
        designerPickupAddress == other.designerPickupAddress &&
        listEquality.equals(
            designerFollowersList, other.designerFollowersList) &&
        listEquality.equals(deisgnerSessionList, other.deisgnerSessionList) &&
        designerConsulationAvailable == other.designerConsulationAvailable &&
        designerContractInfo == other.designerContractInfo &&
        designerBankInfo == other.designerBankInfo &&
        listEquality.equals(
            designerSizeChartList, other.designerSizeChartList) &&
        designerPayoutInfo == other.designerPayoutInfo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        designerId,
        designerStatus,
        designerInfo,
        designerZoomDetails,
        designerRequests,
        designerApproval,
        designerAddressInfo,
        designerPickupAddress,
        designerFollowersList,
        deisgnerSessionList,
        designerConsulationAvailable,
        designerContractInfo,
        designerBankInfo,
        designerSizeChartList,
        designerPayoutInfo
      ]);
}

DesignerMainInfoStruct createDesignerMainInfoStruct({
  String? designerId,
  String? designerStatus,
  FormListStruct? designerInfo,
  DesignerZoomDetailsStruct? designerZoomDetails,
  DesignerRequestsStruct? designerRequests,
  DesignerApprovalsStruct? designerApproval,
  AddressInfoStruct? designerAddressInfo,
  UserShippingaddressInfoStruct? designerPickupAddress,
  bool? designerConsulationAvailable,
  ContractInfoStruct? designerContractInfo,
  BankDetailsStruct? designerBankInfo,
  PayoutInfoStruct? designerPayoutInfo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DesignerMainInfoStruct(
      designerId: designerId,
      designerStatus: designerStatus,
      designerInfo:
          designerInfo ?? (clearUnsetFields ? FormListStruct() : null),
      designerZoomDetails: designerZoomDetails ??
          (clearUnsetFields ? DesignerZoomDetailsStruct() : null),
      designerRequests: designerRequests ??
          (clearUnsetFields ? DesignerRequestsStruct() : null),
      designerApproval: designerApproval ??
          (clearUnsetFields ? DesignerApprovalsStruct() : null),
      designerAddressInfo: designerAddressInfo ??
          (clearUnsetFields ? AddressInfoStruct() : null),
      designerPickupAddress: designerPickupAddress ??
          (clearUnsetFields ? UserShippingaddressInfoStruct() : null),
      designerConsulationAvailable: designerConsulationAvailable,
      designerContractInfo: designerContractInfo ??
          (clearUnsetFields ? ContractInfoStruct() : null),
      designerBankInfo:
          designerBankInfo ?? (clearUnsetFields ? BankDetailsStruct() : null),
      designerPayoutInfo:
          designerPayoutInfo ?? (clearUnsetFields ? PayoutInfoStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DesignerMainInfoStruct? updateDesignerMainInfoStruct(
  DesignerMainInfoStruct? designerMainInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    designerMainInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDesignerMainInfoStructData(
  Map<String, dynamic> firestoreData,
  DesignerMainInfoStruct? designerMainInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (designerMainInfo == null) {
    return;
  }
  if (designerMainInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && designerMainInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final designerMainInfoData =
      getDesignerMainInfoFirestoreData(designerMainInfo, forFieldValue);
  final nestedData =
      designerMainInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = designerMainInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDesignerMainInfoFirestoreData(
  DesignerMainInfoStruct? designerMainInfo, [
  bool forFieldValue = false,
]) {
  if (designerMainInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(designerMainInfo.toMap());

  // Handle nested data for "designer_info" field.
  addFormListStructData(
    firestoreData,
    designerMainInfo.hasDesignerInfo() ? designerMainInfo.designerInfo : null,
    'designer_info',
    forFieldValue,
  );

  // Handle nested data for "designer_zoom_details" field.
  addDesignerZoomDetailsStructData(
    firestoreData,
    designerMainInfo.hasDesignerZoomDetails()
        ? designerMainInfo.designerZoomDetails
        : null,
    'designer_zoom_details',
    forFieldValue,
  );

  // Handle nested data for "designer_requests" field.
  addDesignerRequestsStructData(
    firestoreData,
    designerMainInfo.hasDesignerRequests()
        ? designerMainInfo.designerRequests
        : null,
    'designer_requests',
    forFieldValue,
  );

  // Handle nested data for "designer_approval" field.
  addDesignerApprovalsStructData(
    firestoreData,
    designerMainInfo.hasDesignerApproval()
        ? designerMainInfo.designerApproval
        : null,
    'designer_approval',
    forFieldValue,
  );

  // Handle nested data for "designer_address_info" field.
  addAddressInfoStructData(
    firestoreData,
    designerMainInfo.hasDesignerAddressInfo()
        ? designerMainInfo.designerAddressInfo
        : null,
    'designer_address_info',
    forFieldValue,
  );

  // Handle nested data for "designer_pickup_address" field.
  addUserShippingaddressInfoStructData(
    firestoreData,
    designerMainInfo.hasDesignerPickupAddress()
        ? designerMainInfo.designerPickupAddress
        : null,
    'designer_pickup_address',
    forFieldValue,
  );

  // Handle nested data for "designer_contract_info" field.
  addContractInfoStructData(
    firestoreData,
    designerMainInfo.hasDesignerContractInfo()
        ? designerMainInfo.designerContractInfo
        : null,
    'designer_contract_info',
    forFieldValue,
  );

  // Handle nested data for "designer_bank_info" field.
  addBankDetailsStructData(
    firestoreData,
    designerMainInfo.hasDesignerBankInfo()
        ? designerMainInfo.designerBankInfo
        : null,
    'designer_bank_info',
    forFieldValue,
  );

  // Handle nested data for "designer_payout_info" field.
  addPayoutInfoStructData(
    firestoreData,
    designerMainInfo.hasDesignerPayoutInfo()
        ? designerMainInfo.designerPayoutInfo
        : null,
    'designer_payout_info',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(designerMainInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDesignerMainInfoListFirestoreData(
  List<DesignerMainInfoStruct>? designerMainInfos,
) =>
    designerMainInfos
        ?.map((e) => getDesignerMainInfoFirestoreData(e, true))
        .toList() ??
    [];
