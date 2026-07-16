// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BankDetailsStruct extends FFFirebaseStruct {
  BankDetailsStruct({
    String? bankName,
    String? accountHolderName,
    String? accountNumber,
    String? ibanOrIfscCode,
    String? paymentMethod,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _bankName = bankName,
        _accountHolderName = accountHolderName,
        _accountNumber = accountNumber,
        _ibanOrIfscCode = ibanOrIfscCode,
        _paymentMethod = paymentMethod,
        super(firestoreUtilData);

  // "bank_name" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  set bankName(String? val) => _bankName = val;

  bool hasBankName() => _bankName != null;

  // "account_holder_name" field.
  String? _accountHolderName;
  String get accountHolderName => _accountHolderName ?? '';
  set accountHolderName(String? val) => _accountHolderName = val;

  bool hasAccountHolderName() => _accountHolderName != null;

  // "account_number" field.
  String? _accountNumber;
  String get accountNumber => _accountNumber ?? '';
  set accountNumber(String? val) => _accountNumber = val;

  bool hasAccountNumber() => _accountNumber != null;

  // "iban_or_ifsc_code" field.
  String? _ibanOrIfscCode;
  String get ibanOrIfscCode => _ibanOrIfscCode ?? '';
  set ibanOrIfscCode(String? val) => _ibanOrIfscCode = val;

  bool hasIbanOrIfscCode() => _ibanOrIfscCode != null;

  // "payment_method" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  set paymentMethod(String? val) => _paymentMethod = val;

  bool hasPaymentMethod() => _paymentMethod != null;

  static BankDetailsStruct fromMap(Map<String, dynamic> data) =>
      BankDetailsStruct(
        bankName: data['bank_name'] as String?,
        accountHolderName: data['account_holder_name'] as String?,
        accountNumber: data['account_number'] as String?,
        ibanOrIfscCode: data['iban_or_ifsc_code'] as String?,
        paymentMethod: data['payment_method'] as String?,
      );

  static BankDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? BankDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'bank_name': _bankName,
        'account_holder_name': _accountHolderName,
        'account_number': _accountNumber,
        'iban_or_ifsc_code': _ibanOrIfscCode,
        'payment_method': _paymentMethod,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bank_name': serializeParam(
          _bankName,
          ParamType.String,
        ),
        'account_holder_name': serializeParam(
          _accountHolderName,
          ParamType.String,
        ),
        'account_number': serializeParam(
          _accountNumber,
          ParamType.String,
        ),
        'iban_or_ifsc_code': serializeParam(
          _ibanOrIfscCode,
          ParamType.String,
        ),
        'payment_method': serializeParam(
          _paymentMethod,
          ParamType.String,
        ),
      }.withoutNulls;

  static BankDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      BankDetailsStruct(
        bankName: deserializeParam(
          data['bank_name'],
          ParamType.String,
          false,
        ),
        accountHolderName: deserializeParam(
          data['account_holder_name'],
          ParamType.String,
          false,
        ),
        accountNumber: deserializeParam(
          data['account_number'],
          ParamType.String,
          false,
        ),
        ibanOrIfscCode: deserializeParam(
          data['iban_or_ifsc_code'],
          ParamType.String,
          false,
        ),
        paymentMethod: deserializeParam(
          data['payment_method'],
          ParamType.String,
          false,
        ),
      );

  static BankDetailsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      BankDetailsStruct(
        bankName: convertAlgoliaParam(
          data['bank_name'],
          ParamType.String,
          false,
        ),
        accountHolderName: convertAlgoliaParam(
          data['account_holder_name'],
          ParamType.String,
          false,
        ),
        accountNumber: convertAlgoliaParam(
          data['account_number'],
          ParamType.String,
          false,
        ),
        ibanOrIfscCode: convertAlgoliaParam(
          data['iban_or_ifsc_code'],
          ParamType.String,
          false,
        ),
        paymentMethod: convertAlgoliaParam(
          data['payment_method'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'BankDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BankDetailsStruct &&
        bankName == other.bankName &&
        accountHolderName == other.accountHolderName &&
        accountNumber == other.accountNumber &&
        ibanOrIfscCode == other.ibanOrIfscCode &&
        paymentMethod == other.paymentMethod;
  }

  @override
  int get hashCode => const ListEquality().hash([
        bankName,
        accountHolderName,
        accountNumber,
        ibanOrIfscCode,
        paymentMethod
      ]);
}

BankDetailsStruct createBankDetailsStruct({
  String? bankName,
  String? accountHolderName,
  String? accountNumber,
  String? ibanOrIfscCode,
  String? paymentMethod,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BankDetailsStruct(
      bankName: bankName,
      accountHolderName: accountHolderName,
      accountNumber: accountNumber,
      ibanOrIfscCode: ibanOrIfscCode,
      paymentMethod: paymentMethod,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BankDetailsStruct? updateBankDetailsStruct(
  BankDetailsStruct? bankDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bankDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBankDetailsStructData(
  Map<String, dynamic> firestoreData,
  BankDetailsStruct? bankDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bankDetails == null) {
    return;
  }
  if (bankDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bankDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bankDetailsData =
      getBankDetailsFirestoreData(bankDetails, forFieldValue);
  final nestedData =
      bankDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bankDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBankDetailsFirestoreData(
  BankDetailsStruct? bankDetails, [
  bool forFieldValue = false,
]) {
  if (bankDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bankDetails.toMap());

  // Add any Firestore field values
  mapToFirestore(bankDetails.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBankDetailsListFirestoreData(
  List<BankDetailsStruct>? bankDetailss,
) =>
    bankDetailss?.map((e) => getBankDetailsFirestoreData(e, true)).toList() ??
    [];
