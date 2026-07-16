import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SalesHistoryRecord extends FirestoreRecord {
  SalesHistoryRecord._(
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

  // "user_role" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  bool hasUserRole() => _userRole != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "account_holder_name" field.
  String? _accountHolderName;
  String get accountHolderName => _accountHolderName ?? '';
  bool hasAccountHolderName() => _accountHolderName != null;

  // "bank_name" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  bool hasBankName() => _bankName != null;

  // "account_number" field.
  int? _accountNumber;
  int get accountNumber => _accountNumber ?? 0;
  bool hasAccountNumber() => _accountNumber != null;

  // "IBAN" field.
  String? _iban;
  String get iban => _iban ?? '';
  bool hasIban() => _iban != null;

  // "total_earning" field.
  double? _totalEarning;
  double get totalEarning => _totalEarning ?? 0.0;
  bool hasTotalEarning() => _totalEarning != null;

  // "remaining_balance" field.
  double? _remainingBalance;
  double get remainingBalance => _remainingBalance ?? 0.0;
  bool hasRemainingBalance() => _remainingBalance != null;

  // "available_for_payout" field.
  double? _availableForPayout;
  double get availableForPayout => _availableForPayout ?? 0.0;
  bool hasAvailableForPayout() => _availableForPayout != null;

  // "last_payout_date" field.
  DateTime? _lastPayoutDate;
  DateTime? get lastPayoutDate => _lastPayoutDate;
  bool hasLastPayoutDate() => _lastPayoutDate != null;

  // "last_payout_amount" field.
  double? _lastPayoutAmount;
  double get lastPayoutAmount => _lastPayoutAmount ?? 0.0;
  bool hasLastPayoutAmount() => _lastPayoutAmount != null;

  // "sales_history" field.
  List<SaleInfoStruct>? _salesHistory;
  List<SaleInfoStruct> get salesHistory => _salesHistory ?? const [];
  bool hasSalesHistory() => _salesHistory != null;

  // "sale_history_id" field.
  String? _saleHistoryId;
  String get saleHistoryId => _saleHistoryId ?? '';
  bool hasSaleHistoryId() => _saleHistoryId != null;

  // "total_sales" field.
  int? _totalSales;
  int get totalSales => _totalSales ?? 0;
  bool hasTotalSales() => _totalSales != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _userRole = snapshotData['user_role'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _accountHolderName = snapshotData['account_holder_name'] as String?;
    _bankName = snapshotData['bank_name'] as String?;
    _accountNumber = castToType<int>(snapshotData['account_number']);
    _iban = snapshotData['IBAN'] as String?;
    _totalEarning = castToType<double>(snapshotData['total_earning']);
    _remainingBalance = castToType<double>(snapshotData['remaining_balance']);
    _availableForPayout =
        castToType<double>(snapshotData['available_for_payout']);
    _lastPayoutDate = snapshotData['last_payout_date'] as DateTime?;
    _lastPayoutAmount = castToType<double>(snapshotData['last_payout_amount']);
    _salesHistory = getStructList(
      snapshotData['sales_history'],
      SaleInfoStruct.fromMap,
    );
    _saleHistoryId = snapshotData['sale_history_id'] as String?;
    _totalSales = castToType<int>(snapshotData['total_sales']);
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sales_history');

  static Stream<SalesHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SalesHistoryRecord.fromSnapshot(s));

  static Future<SalesHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SalesHistoryRecord.fromSnapshot(s));

  static SalesHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SalesHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SalesHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SalesHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SalesHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SalesHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSalesHistoryRecordData({
  DateTime? createdAt,
  DateTime? updatedAt,
  String? status,
  String? userRole,
  DocumentReference? userRef,
  String? accountHolderName,
  String? bankName,
  int? accountNumber,
  String? iban,
  double? totalEarning,
  double? remainingBalance,
  double? availableForPayout,
  DateTime? lastPayoutDate,
  double? lastPayoutAmount,
  String? saleHistoryId,
  int? totalSales,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'updated_at': updatedAt,
      'status': status,
      'user_role': userRole,
      'user_ref': userRef,
      'account_holder_name': accountHolderName,
      'bank_name': bankName,
      'account_number': accountNumber,
      'IBAN': iban,
      'total_earning': totalEarning,
      'remaining_balance': remainingBalance,
      'available_for_payout': availableForPayout,
      'last_payout_date': lastPayoutDate,
      'last_payout_amount': lastPayoutAmount,
      'sale_history_id': saleHistoryId,
      'total_sales': totalSales,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class SalesHistoryRecordDocumentEquality
    implements Equality<SalesHistoryRecord> {
  const SalesHistoryRecordDocumentEquality();

  @override
  bool equals(SalesHistoryRecord? e1, SalesHistoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.status == e2?.status &&
        e1?.userRole == e2?.userRole &&
        e1?.userRef == e2?.userRef &&
        e1?.accountHolderName == e2?.accountHolderName &&
        e1?.bankName == e2?.bankName &&
        e1?.accountNumber == e2?.accountNumber &&
        e1?.iban == e2?.iban &&
        e1?.totalEarning == e2?.totalEarning &&
        e1?.remainingBalance == e2?.remainingBalance &&
        e1?.availableForPayout == e2?.availableForPayout &&
        e1?.lastPayoutDate == e2?.lastPayoutDate &&
        e1?.lastPayoutAmount == e2?.lastPayoutAmount &&
        listEquality.equals(e1?.salesHistory, e2?.salesHistory) &&
        e1?.saleHistoryId == e2?.saleHistoryId &&
        e1?.totalSales == e2?.totalSales &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(SalesHistoryRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.updatedAt,
        e?.status,
        e?.userRole,
        e?.userRef,
        e?.accountHolderName,
        e?.bankName,
        e?.accountNumber,
        e?.iban,
        e?.totalEarning,
        e?.remainingBalance,
        e?.availableForPayout,
        e?.lastPayoutDate,
        e?.lastPayoutAmount,
        e?.salesHistory,
        e?.saleHistoryId,
        e?.totalSales,
        e?.uid
      ]);

  @override
  bool isValidKey(Object? o) => o is SalesHistoryRecord;
}
