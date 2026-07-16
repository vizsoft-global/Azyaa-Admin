// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreatorMainInfoStruct extends FFFirebaseStruct {
  CreatorMainInfoStruct({
    String? creatorMainId,
    String? creatorStatus,
    FormListStruct? creatorInfo,
    List<CreatorPromotionsStruct>? creatorPromotions,
    AddressInfoStruct? creatorAddressInfo,
    CreatorRequestsStruct? creatorRequestsInfo,
    CreatorSocialInfoStruct? creatorSocials,
    CreatorApprovalsStruct? creatorApprovals,
    List<DocumentReference>? creatorFollowersList,
    int? creatorTotalPromotionSales,
    double? creatorTotalPromotionEarning,
    ContractInfoStruct? creatorContractInfo,
    PayoutInfoStruct? creatorPayoutInfo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _creatorMainId = creatorMainId,
        _creatorStatus = creatorStatus,
        _creatorInfo = creatorInfo,
        _creatorPromotions = creatorPromotions,
        _creatorAddressInfo = creatorAddressInfo,
        _creatorRequestsInfo = creatorRequestsInfo,
        _creatorSocials = creatorSocials,
        _creatorApprovals = creatorApprovals,
        _creatorFollowersList = creatorFollowersList,
        _creatorTotalPromotionSales = creatorTotalPromotionSales,
        _creatorTotalPromotionEarning = creatorTotalPromotionEarning,
        _creatorContractInfo = creatorContractInfo,
        _creatorPayoutInfo = creatorPayoutInfo,
        super(firestoreUtilData);

  // "creator_main_id" field.
  String? _creatorMainId;
  String get creatorMainId => _creatorMainId ?? '';
  set creatorMainId(String? val) => _creatorMainId = val;

  bool hasCreatorMainId() => _creatorMainId != null;

  // "creator_status" field.
  String? _creatorStatus;
  String get creatorStatus => _creatorStatus ?? '';
  set creatorStatus(String? val) => _creatorStatus = val;

  bool hasCreatorStatus() => _creatorStatus != null;

  // "creator_info" field.
  FormListStruct? _creatorInfo;
  FormListStruct get creatorInfo => _creatorInfo ?? FormListStruct();
  set creatorInfo(FormListStruct? val) => _creatorInfo = val;

  void updateCreatorInfo(Function(FormListStruct) updateFn) {
    updateFn(_creatorInfo ??= FormListStruct());
  }

  bool hasCreatorInfo() => _creatorInfo != null;

  // "creator_promotions" field.
  List<CreatorPromotionsStruct>? _creatorPromotions;
  List<CreatorPromotionsStruct> get creatorPromotions =>
      _creatorPromotions ?? const [];
  set creatorPromotions(List<CreatorPromotionsStruct>? val) =>
      _creatorPromotions = val;

  void updateCreatorPromotions(
      Function(List<CreatorPromotionsStruct>) updateFn) {
    updateFn(_creatorPromotions ??= []);
  }

  bool hasCreatorPromotions() => _creatorPromotions != null;

  // "creator_address_info" field.
  AddressInfoStruct? _creatorAddressInfo;
  AddressInfoStruct get creatorAddressInfo =>
      _creatorAddressInfo ?? AddressInfoStruct();
  set creatorAddressInfo(AddressInfoStruct? val) => _creatorAddressInfo = val;

  void updateCreatorAddressInfo(Function(AddressInfoStruct) updateFn) {
    updateFn(_creatorAddressInfo ??= AddressInfoStruct());
  }

  bool hasCreatorAddressInfo() => _creatorAddressInfo != null;

  // "creator_requests_info" field.
  CreatorRequestsStruct? _creatorRequestsInfo;
  CreatorRequestsStruct get creatorRequestsInfo =>
      _creatorRequestsInfo ?? CreatorRequestsStruct();
  set creatorRequestsInfo(CreatorRequestsStruct? val) =>
      _creatorRequestsInfo = val;

  void updateCreatorRequestsInfo(Function(CreatorRequestsStruct) updateFn) {
    updateFn(_creatorRequestsInfo ??= CreatorRequestsStruct());
  }

  bool hasCreatorRequestsInfo() => _creatorRequestsInfo != null;

  // "creator_socials" field.
  CreatorSocialInfoStruct? _creatorSocials;
  CreatorSocialInfoStruct get creatorSocials =>
      _creatorSocials ?? CreatorSocialInfoStruct();
  set creatorSocials(CreatorSocialInfoStruct? val) => _creatorSocials = val;

  void updateCreatorSocials(Function(CreatorSocialInfoStruct) updateFn) {
    updateFn(_creatorSocials ??= CreatorSocialInfoStruct());
  }

  bool hasCreatorSocials() => _creatorSocials != null;

  // "creator_approvals" field.
  CreatorApprovalsStruct? _creatorApprovals;
  CreatorApprovalsStruct get creatorApprovals =>
      _creatorApprovals ?? CreatorApprovalsStruct();
  set creatorApprovals(CreatorApprovalsStruct? val) => _creatorApprovals = val;

  void updateCreatorApprovals(Function(CreatorApprovalsStruct) updateFn) {
    updateFn(_creatorApprovals ??= CreatorApprovalsStruct());
  }

  bool hasCreatorApprovals() => _creatorApprovals != null;

  // "creator_followers_list" field.
  List<DocumentReference>? _creatorFollowersList;
  List<DocumentReference> get creatorFollowersList =>
      _creatorFollowersList ?? const [];
  set creatorFollowersList(List<DocumentReference>? val) =>
      _creatorFollowersList = val;

  void updateCreatorFollowersList(Function(List<DocumentReference>) updateFn) {
    updateFn(_creatorFollowersList ??= []);
  }

  bool hasCreatorFollowersList() => _creatorFollowersList != null;

  // "creator_total_promotion_sales" field.
  int? _creatorTotalPromotionSales;
  int get creatorTotalPromotionSales => _creatorTotalPromotionSales ?? 0;
  set creatorTotalPromotionSales(int? val) => _creatorTotalPromotionSales = val;

  void incrementCreatorTotalPromotionSales(int amount) =>
      creatorTotalPromotionSales = creatorTotalPromotionSales + amount;

  bool hasCreatorTotalPromotionSales() => _creatorTotalPromotionSales != null;

  // "creator_total_promotion_earning" field.
  double? _creatorTotalPromotionEarning;
  double get creatorTotalPromotionEarning =>
      _creatorTotalPromotionEarning ?? 0.0;
  set creatorTotalPromotionEarning(double? val) =>
      _creatorTotalPromotionEarning = val;

  void incrementCreatorTotalPromotionEarning(double amount) =>
      creatorTotalPromotionEarning = creatorTotalPromotionEarning + amount;

  bool hasCreatorTotalPromotionEarning() =>
      _creatorTotalPromotionEarning != null;

  // "creator_contract_info" field.
  ContractInfoStruct? _creatorContractInfo;
  ContractInfoStruct get creatorContractInfo =>
      _creatorContractInfo ?? ContractInfoStruct();
  set creatorContractInfo(ContractInfoStruct? val) =>
      _creatorContractInfo = val;

  void updateCreatorContractInfo(Function(ContractInfoStruct) updateFn) {
    updateFn(_creatorContractInfo ??= ContractInfoStruct());
  }

  bool hasCreatorContractInfo() => _creatorContractInfo != null;

  // "creator_payout_info" field.
  PayoutInfoStruct? _creatorPayoutInfo;
  PayoutInfoStruct get creatorPayoutInfo =>
      _creatorPayoutInfo ?? PayoutInfoStruct();
  set creatorPayoutInfo(PayoutInfoStruct? val) => _creatorPayoutInfo = val;

  void updateCreatorPayoutInfo(Function(PayoutInfoStruct) updateFn) {
    updateFn(_creatorPayoutInfo ??= PayoutInfoStruct());
  }

  bool hasCreatorPayoutInfo() => _creatorPayoutInfo != null;

  static CreatorMainInfoStruct fromMap(Map<String, dynamic> data) =>
      CreatorMainInfoStruct(
        creatorMainId: data['creator_main_id'] as String?,
        creatorStatus: data['creator_status'] as String?,
        creatorInfo: data['creator_info'] is FormListStruct
            ? data['creator_info']
            : FormListStruct.maybeFromMap(data['creator_info']),
        creatorPromotions: getStructList(
          data['creator_promotions'],
          CreatorPromotionsStruct.fromMap,
        ),
        creatorAddressInfo: data['creator_address_info'] is AddressInfoStruct
            ? data['creator_address_info']
            : AddressInfoStruct.maybeFromMap(data['creator_address_info']),
        creatorRequestsInfo: data['creator_requests_info']
                is CreatorRequestsStruct
            ? data['creator_requests_info']
            : CreatorRequestsStruct.maybeFromMap(data['creator_requests_info']),
        creatorSocials: data['creator_socials'] is CreatorSocialInfoStruct
            ? data['creator_socials']
            : CreatorSocialInfoStruct.maybeFromMap(data['creator_socials']),
        creatorApprovals: data['creator_approvals'] is CreatorApprovalsStruct
            ? data['creator_approvals']
            : CreatorApprovalsStruct.maybeFromMap(data['creator_approvals']),
        creatorFollowersList: getDataList(data['creator_followers_list']),
        creatorTotalPromotionSales:
            castToType<int>(data['creator_total_promotion_sales']),
        creatorTotalPromotionEarning:
            castToType<double>(data['creator_total_promotion_earning']),
        creatorContractInfo: data['creator_contract_info'] is ContractInfoStruct
            ? data['creator_contract_info']
            : ContractInfoStruct.maybeFromMap(data['creator_contract_info']),
        creatorPayoutInfo: data['creator_payout_info'] is PayoutInfoStruct
            ? data['creator_payout_info']
            : PayoutInfoStruct.maybeFromMap(data['creator_payout_info']),
      );

  static CreatorMainInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? CreatorMainInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'creator_main_id': _creatorMainId,
        'creator_status': _creatorStatus,
        'creator_info': _creatorInfo?.toMap(),
        'creator_promotions':
            _creatorPromotions?.map((e) => e.toMap()).toList(),
        'creator_address_info': _creatorAddressInfo?.toMap(),
        'creator_requests_info': _creatorRequestsInfo?.toMap(),
        'creator_socials': _creatorSocials?.toMap(),
        'creator_approvals': _creatorApprovals?.toMap(),
        'creator_followers_list': _creatorFollowersList,
        'creator_total_promotion_sales': _creatorTotalPromotionSales,
        'creator_total_promotion_earning': _creatorTotalPromotionEarning,
        'creator_contract_info': _creatorContractInfo?.toMap(),
        'creator_payout_info': _creatorPayoutInfo?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'creator_main_id': serializeParam(
          _creatorMainId,
          ParamType.String,
        ),
        'creator_status': serializeParam(
          _creatorStatus,
          ParamType.String,
        ),
        'creator_info': serializeParam(
          _creatorInfo,
          ParamType.DataStruct,
        ),
        'creator_promotions': serializeParam(
          _creatorPromotions,
          ParamType.DataStruct,
          isList: true,
        ),
        'creator_address_info': serializeParam(
          _creatorAddressInfo,
          ParamType.DataStruct,
        ),
        'creator_requests_info': serializeParam(
          _creatorRequestsInfo,
          ParamType.DataStruct,
        ),
        'creator_socials': serializeParam(
          _creatorSocials,
          ParamType.DataStruct,
        ),
        'creator_approvals': serializeParam(
          _creatorApprovals,
          ParamType.DataStruct,
        ),
        'creator_followers_list': serializeParam(
          _creatorFollowersList,
          ParamType.DocumentReference,
          isList: true,
        ),
        'creator_total_promotion_sales': serializeParam(
          _creatorTotalPromotionSales,
          ParamType.int,
        ),
        'creator_total_promotion_earning': serializeParam(
          _creatorTotalPromotionEarning,
          ParamType.double,
        ),
        'creator_contract_info': serializeParam(
          _creatorContractInfo,
          ParamType.DataStruct,
        ),
        'creator_payout_info': serializeParam(
          _creatorPayoutInfo,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static CreatorMainInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      CreatorMainInfoStruct(
        creatorMainId: deserializeParam(
          data['creator_main_id'],
          ParamType.String,
          false,
        ),
        creatorStatus: deserializeParam(
          data['creator_status'],
          ParamType.String,
          false,
        ),
        creatorInfo: deserializeStructParam(
          data['creator_info'],
          ParamType.DataStruct,
          false,
          structBuilder: FormListStruct.fromSerializableMap,
        ),
        creatorPromotions: deserializeStructParam<CreatorPromotionsStruct>(
          data['creator_promotions'],
          ParamType.DataStruct,
          true,
          structBuilder: CreatorPromotionsStruct.fromSerializableMap,
        ),
        creatorAddressInfo: deserializeStructParam(
          data['creator_address_info'],
          ParamType.DataStruct,
          false,
          structBuilder: AddressInfoStruct.fromSerializableMap,
        ),
        creatorRequestsInfo: deserializeStructParam(
          data['creator_requests_info'],
          ParamType.DataStruct,
          false,
          structBuilder: CreatorRequestsStruct.fromSerializableMap,
        ),
        creatorSocials: deserializeStructParam(
          data['creator_socials'],
          ParamType.DataStruct,
          false,
          structBuilder: CreatorSocialInfoStruct.fromSerializableMap,
        ),
        creatorApprovals: deserializeStructParam(
          data['creator_approvals'],
          ParamType.DataStruct,
          false,
          structBuilder: CreatorApprovalsStruct.fromSerializableMap,
        ),
        creatorFollowersList: deserializeParam<DocumentReference>(
          data['creator_followers_list'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['users'],
        ),
        creatorTotalPromotionSales: deserializeParam(
          data['creator_total_promotion_sales'],
          ParamType.int,
          false,
        ),
        creatorTotalPromotionEarning: deserializeParam(
          data['creator_total_promotion_earning'],
          ParamType.double,
          false,
        ),
        creatorContractInfo: deserializeStructParam(
          data['creator_contract_info'],
          ParamType.DataStruct,
          false,
          structBuilder: ContractInfoStruct.fromSerializableMap,
        ),
        creatorPayoutInfo: deserializeStructParam(
          data['creator_payout_info'],
          ParamType.DataStruct,
          false,
          structBuilder: PayoutInfoStruct.fromSerializableMap,
        ),
      );

  static CreatorMainInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CreatorMainInfoStruct(
        creatorMainId: convertAlgoliaParam(
          data['creator_main_id'],
          ParamType.String,
          false,
        ),
        creatorStatus: convertAlgoliaParam(
          data['creator_status'],
          ParamType.String,
          false,
        ),
        creatorInfo: convertAlgoliaParam(
          data['creator_info'],
          ParamType.DataStruct,
          false,
          structBuilder: FormListStruct.fromAlgoliaData,
        ),
        creatorPromotions: convertAlgoliaParam<CreatorPromotionsStruct>(
          data['creator_promotions'],
          ParamType.DataStruct,
          true,
          structBuilder: CreatorPromotionsStruct.fromAlgoliaData,
        ),
        creatorAddressInfo: convertAlgoliaParam(
          data['creator_address_info'],
          ParamType.DataStruct,
          false,
          structBuilder: AddressInfoStruct.fromAlgoliaData,
        ),
        creatorRequestsInfo: convertAlgoliaParam(
          data['creator_requests_info'],
          ParamType.DataStruct,
          false,
          structBuilder: CreatorRequestsStruct.fromAlgoliaData,
        ),
        creatorSocials: convertAlgoliaParam(
          data['creator_socials'],
          ParamType.DataStruct,
          false,
          structBuilder: CreatorSocialInfoStruct.fromAlgoliaData,
        ),
        creatorApprovals: convertAlgoliaParam(
          data['creator_approvals'],
          ParamType.DataStruct,
          false,
          structBuilder: CreatorApprovalsStruct.fromAlgoliaData,
        ),
        creatorFollowersList: convertAlgoliaParam<DocumentReference>(
          data['creator_followers_list'],
          ParamType.DocumentReference,
          true,
        ),
        creatorTotalPromotionSales: convertAlgoliaParam(
          data['creator_total_promotion_sales'],
          ParamType.int,
          false,
        ),
        creatorTotalPromotionEarning: convertAlgoliaParam(
          data['creator_total_promotion_earning'],
          ParamType.double,
          false,
        ),
        creatorContractInfo: convertAlgoliaParam(
          data['creator_contract_info'],
          ParamType.DataStruct,
          false,
          structBuilder: ContractInfoStruct.fromAlgoliaData,
        ),
        creatorPayoutInfo: convertAlgoliaParam(
          data['creator_payout_info'],
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
  String toString() => 'CreatorMainInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CreatorMainInfoStruct &&
        creatorMainId == other.creatorMainId &&
        creatorStatus == other.creatorStatus &&
        creatorInfo == other.creatorInfo &&
        listEquality.equals(creatorPromotions, other.creatorPromotions) &&
        creatorAddressInfo == other.creatorAddressInfo &&
        creatorRequestsInfo == other.creatorRequestsInfo &&
        creatorSocials == other.creatorSocials &&
        creatorApprovals == other.creatorApprovals &&
        listEquality.equals(creatorFollowersList, other.creatorFollowersList) &&
        creatorTotalPromotionSales == other.creatorTotalPromotionSales &&
        creatorTotalPromotionEarning == other.creatorTotalPromotionEarning &&
        creatorContractInfo == other.creatorContractInfo &&
        creatorPayoutInfo == other.creatorPayoutInfo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        creatorMainId,
        creatorStatus,
        creatorInfo,
        creatorPromotions,
        creatorAddressInfo,
        creatorRequestsInfo,
        creatorSocials,
        creatorApprovals,
        creatorFollowersList,
        creatorTotalPromotionSales,
        creatorTotalPromotionEarning,
        creatorContractInfo,
        creatorPayoutInfo
      ]);
}

CreatorMainInfoStruct createCreatorMainInfoStruct({
  String? creatorMainId,
  String? creatorStatus,
  FormListStruct? creatorInfo,
  AddressInfoStruct? creatorAddressInfo,
  CreatorRequestsStruct? creatorRequestsInfo,
  CreatorSocialInfoStruct? creatorSocials,
  CreatorApprovalsStruct? creatorApprovals,
  int? creatorTotalPromotionSales,
  double? creatorTotalPromotionEarning,
  ContractInfoStruct? creatorContractInfo,
  PayoutInfoStruct? creatorPayoutInfo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CreatorMainInfoStruct(
      creatorMainId: creatorMainId,
      creatorStatus: creatorStatus,
      creatorInfo: creatorInfo ?? (clearUnsetFields ? FormListStruct() : null),
      creatorAddressInfo:
          creatorAddressInfo ?? (clearUnsetFields ? AddressInfoStruct() : null),
      creatorRequestsInfo: creatorRequestsInfo ??
          (clearUnsetFields ? CreatorRequestsStruct() : null),
      creatorSocials: creatorSocials ??
          (clearUnsetFields ? CreatorSocialInfoStruct() : null),
      creatorApprovals: creatorApprovals ??
          (clearUnsetFields ? CreatorApprovalsStruct() : null),
      creatorTotalPromotionSales: creatorTotalPromotionSales,
      creatorTotalPromotionEarning: creatorTotalPromotionEarning,
      creatorContractInfo: creatorContractInfo ??
          (clearUnsetFields ? ContractInfoStruct() : null),
      creatorPayoutInfo:
          creatorPayoutInfo ?? (clearUnsetFields ? PayoutInfoStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CreatorMainInfoStruct? updateCreatorMainInfoStruct(
  CreatorMainInfoStruct? creatorMainInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    creatorMainInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCreatorMainInfoStructData(
  Map<String, dynamic> firestoreData,
  CreatorMainInfoStruct? creatorMainInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (creatorMainInfo == null) {
    return;
  }
  if (creatorMainInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && creatorMainInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final creatorMainInfoData =
      getCreatorMainInfoFirestoreData(creatorMainInfo, forFieldValue);
  final nestedData =
      creatorMainInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = creatorMainInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCreatorMainInfoFirestoreData(
  CreatorMainInfoStruct? creatorMainInfo, [
  bool forFieldValue = false,
]) {
  if (creatorMainInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(creatorMainInfo.toMap());

  // Handle nested data for "creator_info" field.
  addFormListStructData(
    firestoreData,
    creatorMainInfo.hasCreatorInfo() ? creatorMainInfo.creatorInfo : null,
    'creator_info',
    forFieldValue,
  );

  // Handle nested data for "creator_address_info" field.
  addAddressInfoStructData(
    firestoreData,
    creatorMainInfo.hasCreatorAddressInfo()
        ? creatorMainInfo.creatorAddressInfo
        : null,
    'creator_address_info',
    forFieldValue,
  );

  // Handle nested data for "creator_requests_info" field.
  addCreatorRequestsStructData(
    firestoreData,
    creatorMainInfo.hasCreatorRequestsInfo()
        ? creatorMainInfo.creatorRequestsInfo
        : null,
    'creator_requests_info',
    forFieldValue,
  );

  // Handle nested data for "creator_socials" field.
  addCreatorSocialInfoStructData(
    firestoreData,
    creatorMainInfo.hasCreatorSocials() ? creatorMainInfo.creatorSocials : null,
    'creator_socials',
    forFieldValue,
  );

  // Handle nested data for "creator_approvals" field.
  addCreatorApprovalsStructData(
    firestoreData,
    creatorMainInfo.hasCreatorApprovals()
        ? creatorMainInfo.creatorApprovals
        : null,
    'creator_approvals',
    forFieldValue,
  );

  // Handle nested data for "creator_contract_info" field.
  addContractInfoStructData(
    firestoreData,
    creatorMainInfo.hasCreatorContractInfo()
        ? creatorMainInfo.creatorContractInfo
        : null,
    'creator_contract_info',
    forFieldValue,
  );

  // Handle nested data for "creator_payout_info" field.
  addPayoutInfoStructData(
    firestoreData,
    creatorMainInfo.hasCreatorPayoutInfo()
        ? creatorMainInfo.creatorPayoutInfo
        : null,
    'creator_payout_info',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(creatorMainInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCreatorMainInfoListFirestoreData(
  List<CreatorMainInfoStruct>? creatorMainInfos,
) =>
    creatorMainInfos
        ?.map((e) => getCreatorMainInfoFirestoreData(e, true))
        .toList() ??
    [];
