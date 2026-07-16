// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ContractInfoStruct extends FFFirebaseStruct {
  ContractInfoStruct({
    String? contractType,
    DateTime? contractStartDate,
    DateTime? contractEndDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _contractType = contractType,
        _contractStartDate = contractStartDate,
        _contractEndDate = contractEndDate,
        super(firestoreUtilData);

  // "contract_type" field.
  String? _contractType;
  String get contractType => _contractType ?? '';
  set contractType(String? val) => _contractType = val;

  bool hasContractType() => _contractType != null;

  // "contract_start_date" field.
  DateTime? _contractStartDate;
  DateTime? get contractStartDate => _contractStartDate;
  set contractStartDate(DateTime? val) => _contractStartDate = val;

  bool hasContractStartDate() => _contractStartDate != null;

  // "contract_end_date" field.
  DateTime? _contractEndDate;
  DateTime? get contractEndDate => _contractEndDate;
  set contractEndDate(DateTime? val) => _contractEndDate = val;

  bool hasContractEndDate() => _contractEndDate != null;

  static ContractInfoStruct fromMap(Map<String, dynamic> data) =>
      ContractInfoStruct(
        contractType: data['contract_type'] as String?,
        contractStartDate: data['contract_start_date'] as DateTime?,
        contractEndDate: data['contract_end_date'] as DateTime?,
      );

  static ContractInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? ContractInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'contract_type': _contractType,
        'contract_start_date': _contractStartDate,
        'contract_end_date': _contractEndDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'contract_type': serializeParam(
          _contractType,
          ParamType.String,
        ),
        'contract_start_date': serializeParam(
          _contractStartDate,
          ParamType.DateTime,
        ),
        'contract_end_date': serializeParam(
          _contractEndDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ContractInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContractInfoStruct(
        contractType: deserializeParam(
          data['contract_type'],
          ParamType.String,
          false,
        ),
        contractStartDate: deserializeParam(
          data['contract_start_date'],
          ParamType.DateTime,
          false,
        ),
        contractEndDate: deserializeParam(
          data['contract_end_date'],
          ParamType.DateTime,
          false,
        ),
      );

  static ContractInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ContractInfoStruct(
        contractType: convertAlgoliaParam(
          data['contract_type'],
          ParamType.String,
          false,
        ),
        contractStartDate: convertAlgoliaParam(
          data['contract_start_date'],
          ParamType.DateTime,
          false,
        ),
        contractEndDate: convertAlgoliaParam(
          data['contract_end_date'],
          ParamType.DateTime,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ContractInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContractInfoStruct &&
        contractType == other.contractType &&
        contractStartDate == other.contractStartDate &&
        contractEndDate == other.contractEndDate;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([contractType, contractStartDate, contractEndDate]);
}

ContractInfoStruct createContractInfoStruct({
  String? contractType,
  DateTime? contractStartDate,
  DateTime? contractEndDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContractInfoStruct(
      contractType: contractType,
      contractStartDate: contractStartDate,
      contractEndDate: contractEndDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContractInfoStruct? updateContractInfoStruct(
  ContractInfoStruct? contractInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contractInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContractInfoStructData(
  Map<String, dynamic> firestoreData,
  ContractInfoStruct? contractInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contractInfo == null) {
    return;
  }
  if (contractInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && contractInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contractInfoData =
      getContractInfoFirestoreData(contractInfo, forFieldValue);
  final nestedData =
      contractInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = contractInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContractInfoFirestoreData(
  ContractInfoStruct? contractInfo, [
  bool forFieldValue = false,
]) {
  if (contractInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contractInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(contractInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContractInfoListFirestoreData(
  List<ContractInfoStruct>? contractInfos,
) =>
    contractInfos?.map((e) => getContractInfoFirestoreData(e, true)).toList() ??
    [];
