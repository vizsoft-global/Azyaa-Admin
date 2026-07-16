// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PayoutInfoStruct extends FFFirebaseStruct {
  PayoutInfoStruct({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? status,
    String? accountHolderName,
    String? bankName,
    int? accountNumber,
    String? iban,
    double? totalPayout,
    double? pendingPayout,
    double? completedPayout,
    DateTime? lastPayoutDate,
    double? lastPayoutAmount,
    DocumentReference? saleHistoryRef,
    String? saleHistoryId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdAt = createdAt,
        _updatedAt = updatedAt,
        _status = status,
        _accountHolderName = accountHolderName,
        _bankName = bankName,
        _accountNumber = accountNumber,
        _iban = iban,
        _totalPayout = totalPayout,
        _pendingPayout = pendingPayout,
        _completedPayout = completedPayout,
        _lastPayoutDate = lastPayoutDate,
        _lastPayoutAmount = lastPayoutAmount,
        _saleHistoryRef = saleHistoryRef,
        _saleHistoryId = saleHistoryId,
        super(firestoreUtilData);

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "account_holder_name" field.
  String? _accountHolderName;
  String get accountHolderName => _accountHolderName ?? '';
  set accountHolderName(String? val) => _accountHolderName = val;

  bool hasAccountHolderName() => _accountHolderName != null;

  // "bank_name" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  set bankName(String? val) => _bankName = val;

  bool hasBankName() => _bankName != null;

  // "account_number" field.
  int? _accountNumber;
  int get accountNumber => _accountNumber ?? 0;
  set accountNumber(int? val) => _accountNumber = val;

  void incrementAccountNumber(int amount) =>
      accountNumber = accountNumber + amount;

  bool hasAccountNumber() => _accountNumber != null;

  // "IBAN" field.
  String? _iban;
  String get iban => _iban ?? '';
  set iban(String? val) => _iban = val;

  bool hasIban() => _iban != null;

  // "total_payout" field.
  double? _totalPayout;
  double get totalPayout => _totalPayout ?? 0.0;
  set totalPayout(double? val) => _totalPayout = val;

  void incrementTotalPayout(double amount) =>
      totalPayout = totalPayout + amount;

  bool hasTotalPayout() => _totalPayout != null;

  // "pending_payout" field.
  double? _pendingPayout;
  double get pendingPayout => _pendingPayout ?? 0.0;
  set pendingPayout(double? val) => _pendingPayout = val;

  void incrementPendingPayout(double amount) =>
      pendingPayout = pendingPayout + amount;

  bool hasPendingPayout() => _pendingPayout != null;

  // "completed_payout" field.
  double? _completedPayout;
  double get completedPayout => _completedPayout ?? 0.0;
  set completedPayout(double? val) => _completedPayout = val;

  void incrementCompletedPayout(double amount) =>
      completedPayout = completedPayout + amount;

  bool hasCompletedPayout() => _completedPayout != null;

  // "last_payout_date" field.
  DateTime? _lastPayoutDate;
  DateTime? get lastPayoutDate => _lastPayoutDate;
  set lastPayoutDate(DateTime? val) => _lastPayoutDate = val;

  bool hasLastPayoutDate() => _lastPayoutDate != null;

  // "last_payout_amount" field.
  double? _lastPayoutAmount;
  double get lastPayoutAmount => _lastPayoutAmount ?? 0.0;
  set lastPayoutAmount(double? val) => _lastPayoutAmount = val;

  void incrementLastPayoutAmount(double amount) =>
      lastPayoutAmount = lastPayoutAmount + amount;

  bool hasLastPayoutAmount() => _lastPayoutAmount != null;

  // "sale_history_ref" field.
  DocumentReference? _saleHistoryRef;
  DocumentReference? get saleHistoryRef => _saleHistoryRef;
  set saleHistoryRef(DocumentReference? val) => _saleHistoryRef = val;

  bool hasSaleHistoryRef() => _saleHistoryRef != null;

  // "sale_history_id" field.
  String? _saleHistoryId;
  String get saleHistoryId => _saleHistoryId ?? '';
  set saleHistoryId(String? val) => _saleHistoryId = val;

  bool hasSaleHistoryId() => _saleHistoryId != null;

  static PayoutInfoStruct fromMap(Map<String, dynamic> data) =>
      PayoutInfoStruct(
        createdAt: data['created_at'] as DateTime?,
        updatedAt: data['updated_at'] as DateTime?,
        status: data['status'] as String?,
        accountHolderName: data['account_holder_name'] as String?,
        bankName: data['bank_name'] as String?,
        accountNumber: castToType<int>(data['account_number']),
        iban: data['IBAN'] as String?,
        totalPayout: castToType<double>(data['total_payout']),
        pendingPayout: castToType<double>(data['pending_payout']),
        completedPayout: castToType<double>(data['completed_payout']),
        lastPayoutDate: data['last_payout_date'] as DateTime?,
        lastPayoutAmount: castToType<double>(data['last_payout_amount']),
        saleHistoryRef: data['sale_history_ref'] as DocumentReference?,
        saleHistoryId: data['sale_history_id'] as String?,
      );

  static PayoutInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? PayoutInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'status': _status,
        'account_holder_name': _accountHolderName,
        'bank_name': _bankName,
        'account_number': _accountNumber,
        'IBAN': _iban,
        'total_payout': _totalPayout,
        'pending_payout': _pendingPayout,
        'completed_payout': _completedPayout,
        'last_payout_date': _lastPayoutDate,
        'last_payout_amount': _lastPayoutAmount,
        'sale_history_ref': _saleHistoryRef,
        'sale_history_id': _saleHistoryId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'account_holder_name': serializeParam(
          _accountHolderName,
          ParamType.String,
        ),
        'bank_name': serializeParam(
          _bankName,
          ParamType.String,
        ),
        'account_number': serializeParam(
          _accountNumber,
          ParamType.int,
        ),
        'IBAN': serializeParam(
          _iban,
          ParamType.String,
        ),
        'total_payout': serializeParam(
          _totalPayout,
          ParamType.double,
        ),
        'pending_payout': serializeParam(
          _pendingPayout,
          ParamType.double,
        ),
        'completed_payout': serializeParam(
          _completedPayout,
          ParamType.double,
        ),
        'last_payout_date': serializeParam(
          _lastPayoutDate,
          ParamType.DateTime,
        ),
        'last_payout_amount': serializeParam(
          _lastPayoutAmount,
          ParamType.double,
        ),
        'sale_history_ref': serializeParam(
          _saleHistoryRef,
          ParamType.DocumentReference,
        ),
        'sale_history_id': serializeParam(
          _saleHistoryId,
          ParamType.String,
        ),
      }.withoutNulls;

  static PayoutInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PayoutInfoStruct(
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        accountHolderName: deserializeParam(
          data['account_holder_name'],
          ParamType.String,
          false,
        ),
        bankName: deserializeParam(
          data['bank_name'],
          ParamType.String,
          false,
        ),
        accountNumber: deserializeParam(
          data['account_number'],
          ParamType.int,
          false,
        ),
        iban: deserializeParam(
          data['IBAN'],
          ParamType.String,
          false,
        ),
        totalPayout: deserializeParam(
          data['total_payout'],
          ParamType.double,
          false,
        ),
        pendingPayout: deserializeParam(
          data['pending_payout'],
          ParamType.double,
          false,
        ),
        completedPayout: deserializeParam(
          data['completed_payout'],
          ParamType.double,
          false,
        ),
        lastPayoutDate: deserializeParam(
          data['last_payout_date'],
          ParamType.DateTime,
          false,
        ),
        lastPayoutAmount: deserializeParam(
          data['last_payout_amount'],
          ParamType.double,
          false,
        ),
        saleHistoryRef: deserializeParam(
          data['sale_history_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['sales_history'],
        ),
        saleHistoryId: deserializeParam(
          data['sale_history_id'],
          ParamType.String,
          false,
        ),
      );

  static PayoutInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PayoutInfoStruct(
        createdAt: convertAlgoliaParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: convertAlgoliaParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        status: convertAlgoliaParam(
          data['status'],
          ParamType.String,
          false,
        ),
        accountHolderName: convertAlgoliaParam(
          data['account_holder_name'],
          ParamType.String,
          false,
        ),
        bankName: convertAlgoliaParam(
          data['bank_name'],
          ParamType.String,
          false,
        ),
        accountNumber: convertAlgoliaParam(
          data['account_number'],
          ParamType.int,
          false,
        ),
        iban: convertAlgoliaParam(
          data['IBAN'],
          ParamType.String,
          false,
        ),
        totalPayout: convertAlgoliaParam(
          data['total_payout'],
          ParamType.double,
          false,
        ),
        pendingPayout: convertAlgoliaParam(
          data['pending_payout'],
          ParamType.double,
          false,
        ),
        completedPayout: convertAlgoliaParam(
          data['completed_payout'],
          ParamType.double,
          false,
        ),
        lastPayoutDate: convertAlgoliaParam(
          data['last_payout_date'],
          ParamType.DateTime,
          false,
        ),
        lastPayoutAmount: convertAlgoliaParam(
          data['last_payout_amount'],
          ParamType.double,
          false,
        ),
        saleHistoryRef: convertAlgoliaParam(
          data['sale_history_ref'],
          ParamType.DocumentReference,
          false,
        ),
        saleHistoryId: convertAlgoliaParam(
          data['sale_history_id'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PayoutInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PayoutInfoStruct &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        status == other.status &&
        accountHolderName == other.accountHolderName &&
        bankName == other.bankName &&
        accountNumber == other.accountNumber &&
        iban == other.iban &&
        totalPayout == other.totalPayout &&
        pendingPayout == other.pendingPayout &&
        completedPayout == other.completedPayout &&
        lastPayoutDate == other.lastPayoutDate &&
        lastPayoutAmount == other.lastPayoutAmount &&
        saleHistoryRef == other.saleHistoryRef &&
        saleHistoryId == other.saleHistoryId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        createdAt,
        updatedAt,
        status,
        accountHolderName,
        bankName,
        accountNumber,
        iban,
        totalPayout,
        pendingPayout,
        completedPayout,
        lastPayoutDate,
        lastPayoutAmount,
        saleHistoryRef,
        saleHistoryId
      ]);
}

PayoutInfoStruct createPayoutInfoStruct({
  DateTime? createdAt,
  DateTime? updatedAt,
  String? status,
  String? accountHolderName,
  String? bankName,
  int? accountNumber,
  String? iban,
  double? totalPayout,
  double? pendingPayout,
  double? completedPayout,
  DateTime? lastPayoutDate,
  double? lastPayoutAmount,
  DocumentReference? saleHistoryRef,
  String? saleHistoryId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PayoutInfoStruct(
      createdAt: createdAt,
      updatedAt: updatedAt,
      status: status,
      accountHolderName: accountHolderName,
      bankName: bankName,
      accountNumber: accountNumber,
      iban: iban,
      totalPayout: totalPayout,
      pendingPayout: pendingPayout,
      completedPayout: completedPayout,
      lastPayoutDate: lastPayoutDate,
      lastPayoutAmount: lastPayoutAmount,
      saleHistoryRef: saleHistoryRef,
      saleHistoryId: saleHistoryId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PayoutInfoStruct? updatePayoutInfoStruct(
  PayoutInfoStruct? payoutInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    payoutInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPayoutInfoStructData(
  Map<String, dynamic> firestoreData,
  PayoutInfoStruct? payoutInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (payoutInfo == null) {
    return;
  }
  if (payoutInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && payoutInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final payoutInfoData = getPayoutInfoFirestoreData(payoutInfo, forFieldValue);
  final nestedData = payoutInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = payoutInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPayoutInfoFirestoreData(
  PayoutInfoStruct? payoutInfo, [
  bool forFieldValue = false,
]) {
  if (payoutInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(payoutInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(payoutInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPayoutInfoListFirestoreData(
  List<PayoutInfoStruct>? payoutInfos,
) =>
    payoutInfos?.map((e) => getPayoutInfoFirestoreData(e, true)).toList() ?? [];
