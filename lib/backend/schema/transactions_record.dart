import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "transaction_id" field.
  int? _transactionId;
  int get transactionId => _transactionId ?? 0;
  bool hasTransactionId() => _transactionId != null;

  // "partner_type" field.
  String? _partnerType;
  String get partnerType => _partnerType ?? '';
  bool hasPartnerType() => _partnerType != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "account_holder_name" field.
  String? _accountHolderName;
  String get accountHolderName => _accountHolderName ?? '';
  bool hasAccountHolderName() => _accountHolderName != null;

  // "bank_name" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  bool hasBankName() => _bankName != null;

  // "IBAN" field.
  String? _iban;
  String get iban => _iban ?? '';
  bool hasIban() => _iban != null;

  // "previous_balance" field.
  double? _previousBalance;
  double get previousBalance => _previousBalance ?? 0.0;
  bool hasPreviousBalance() => _previousBalance != null;

  // "payout_amount" field.
  double? _payoutAmount;
  double get payoutAmount => _payoutAmount ?? 0.0;
  bool hasPayoutAmount() => _payoutAmount != null;

  // "current_balance" field.
  double? _currentBalance;
  double get currentBalance => _currentBalance ?? 0.0;
  bool hasCurrentBalance() => _currentBalance != null;

  // "doneby_user_ref" field.
  DocumentReference? _donebyUserRef;
  DocumentReference? get donebyUserRef => _donebyUserRef;
  bool hasDonebyUserRef() => _donebyUserRef != null;

  // "doneby_name" field.
  String? _donebyName;
  String get donebyName => _donebyName ?? '';
  bool hasDonebyName() => _donebyName != null;

  // "doneby_user_role" field.
  String? _donebyUserRole;
  String get donebyUserRole => _donebyUserRole ?? '';
  bool hasDonebyUserRole() => _donebyUserRole != null;

  // "account_number" field.
  int? _accountNumber;
  int get accountNumber => _accountNumber ?? 0;
  bool hasAccountNumber() => _accountNumber != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _transactionId = castToType<int>(snapshotData['transaction_id']);
    _partnerType = snapshotData['partner_type'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _email = snapshotData['email'] as String?;
    _name = snapshotData['name'] as String?;
    _accountHolderName = snapshotData['account_holder_name'] as String?;
    _bankName = snapshotData['bank_name'] as String?;
    _iban = snapshotData['IBAN'] as String?;
    _previousBalance = castToType<double>(snapshotData['previous_balance']);
    _payoutAmount = castToType<double>(snapshotData['payout_amount']);
    _currentBalance = castToType<double>(snapshotData['current_balance']);
    _donebyUserRef = snapshotData['doneby_user_ref'] as DocumentReference?;
    _donebyName = snapshotData['doneby_name'] as String?;
    _donebyUserRole = snapshotData['doneby_user_role'] as String?;
    _accountNumber = castToType<int>(snapshotData['account_number']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  DateTime? createdAt,
  DateTime? updatedAt,
  String? status,
  int? transactionId,
  String? partnerType,
  DocumentReference? userRef,
  String? email,
  String? name,
  String? accountHolderName,
  String? bankName,
  String? iban,
  double? previousBalance,
  double? payoutAmount,
  double? currentBalance,
  DocumentReference? donebyUserRef,
  String? donebyName,
  String? donebyUserRole,
  int? accountNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'updated_at': updatedAt,
      'status': status,
      'transaction_id': transactionId,
      'partner_type': partnerType,
      'user_ref': userRef,
      'email': email,
      'name': name,
      'account_holder_name': accountHolderName,
      'bank_name': bankName,
      'IBAN': iban,
      'previous_balance': previousBalance,
      'payout_amount': payoutAmount,
      'current_balance': currentBalance,
      'doneby_user_ref': donebyUserRef,
      'doneby_name': donebyName,
      'doneby_user_role': donebyUserRole,
      'account_number': accountNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.status == e2?.status &&
        e1?.transactionId == e2?.transactionId &&
        e1?.partnerType == e2?.partnerType &&
        e1?.userRef == e2?.userRef &&
        e1?.email == e2?.email &&
        e1?.name == e2?.name &&
        e1?.accountHolderName == e2?.accountHolderName &&
        e1?.bankName == e2?.bankName &&
        e1?.iban == e2?.iban &&
        e1?.previousBalance == e2?.previousBalance &&
        e1?.payoutAmount == e2?.payoutAmount &&
        e1?.currentBalance == e2?.currentBalance &&
        e1?.donebyUserRef == e2?.donebyUserRef &&
        e1?.donebyName == e2?.donebyName &&
        e1?.donebyUserRole == e2?.donebyUserRole &&
        e1?.accountNumber == e2?.accountNumber;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.updatedAt,
        e?.status,
        e?.transactionId,
        e?.partnerType,
        e?.userRef,
        e?.email,
        e?.name,
        e?.accountHolderName,
        e?.bankName,
        e?.iban,
        e?.previousBalance,
        e?.payoutAmount,
        e?.currentBalance,
        e?.donebyUserRef,
        e?.donebyName,
        e?.donebyUserRole,
        e?.accountNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
