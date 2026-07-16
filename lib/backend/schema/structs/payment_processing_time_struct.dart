// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentProcessingTimeStruct extends FFFirebaseStruct {
  PaymentProcessingTimeStruct({
    DocumentReference? presentUserRef,
    String? orderId,
    String? paymentProcessesStatus,
    String? paymentType,
    String? paymentBaseUrl,
    String? mainPaymentUrl,
    String? paymentUrl,
    String? secretKey,
    UserCartStruct? paymentCart,
    UserCartStruct? paymentCartBackup,
    int? paymentCartCount,
    String? paymentId,
    String? paymentMethod,
    String? paymentMethodType,
    String? selectedPaymentType,
    int? selectedPaymentId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _presentUserRef = presentUserRef,
        _orderId = orderId,
        _paymentProcessesStatus = paymentProcessesStatus,
        _paymentType = paymentType,
        _paymentBaseUrl = paymentBaseUrl,
        _mainPaymentUrl = mainPaymentUrl,
        _paymentUrl = paymentUrl,
        _secretKey = secretKey,
        _paymentCart = paymentCart,
        _paymentCartBackup = paymentCartBackup,
        _paymentCartCount = paymentCartCount,
        _paymentId = paymentId,
        _paymentMethod = paymentMethod,
        _paymentMethodType = paymentMethodType,
        _selectedPaymentType = selectedPaymentType,
        _selectedPaymentId = selectedPaymentId,
        super(firestoreUtilData);

  // "present_user_ref" field.
  DocumentReference? _presentUserRef;
  DocumentReference? get presentUserRef => _presentUserRef;
  set presentUserRef(DocumentReference? val) => _presentUserRef = val;

  bool hasPresentUserRef() => _presentUserRef != null;

  // "order_id" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  set orderId(String? val) => _orderId = val;

  bool hasOrderId() => _orderId != null;

  // "payment_processes_status" field.
  String? _paymentProcessesStatus;
  String get paymentProcessesStatus => _paymentProcessesStatus ?? '';
  set paymentProcessesStatus(String? val) => _paymentProcessesStatus = val;

  bool hasPaymentProcessesStatus() => _paymentProcessesStatus != null;

  // "payment_type" field.
  String? _paymentType;
  String get paymentType => _paymentType ?? '';
  set paymentType(String? val) => _paymentType = val;

  bool hasPaymentType() => _paymentType != null;

  // "payment_base_url" field.
  String? _paymentBaseUrl;
  String get paymentBaseUrl => _paymentBaseUrl ?? '';
  set paymentBaseUrl(String? val) => _paymentBaseUrl = val;

  bool hasPaymentBaseUrl() => _paymentBaseUrl != null;

  // "main_payment_url" field.
  String? _mainPaymentUrl;
  String get mainPaymentUrl => _mainPaymentUrl ?? '';
  set mainPaymentUrl(String? val) => _mainPaymentUrl = val;

  bool hasMainPaymentUrl() => _mainPaymentUrl != null;

  // "payment_url" field.
  String? _paymentUrl;
  String get paymentUrl => _paymentUrl ?? '';
  set paymentUrl(String? val) => _paymentUrl = val;

  bool hasPaymentUrl() => _paymentUrl != null;

  // "secret_key" field.
  String? _secretKey;
  String get secretKey => _secretKey ?? '';
  set secretKey(String? val) => _secretKey = val;

  bool hasSecretKey() => _secretKey != null;

  // "payment_cart" field.
  UserCartStruct? _paymentCart;
  UserCartStruct get paymentCart => _paymentCart ?? UserCartStruct();
  set paymentCart(UserCartStruct? val) => _paymentCart = val;

  void updatePaymentCart(Function(UserCartStruct) updateFn) {
    updateFn(_paymentCart ??= UserCartStruct());
  }

  bool hasPaymentCart() => _paymentCart != null;

  // "payment_cart_backup" field.
  UserCartStruct? _paymentCartBackup;
  UserCartStruct get paymentCartBackup =>
      _paymentCartBackup ?? UserCartStruct();
  set paymentCartBackup(UserCartStruct? val) => _paymentCartBackup = val;

  void updatePaymentCartBackup(Function(UserCartStruct) updateFn) {
    updateFn(_paymentCartBackup ??= UserCartStruct());
  }

  bool hasPaymentCartBackup() => _paymentCartBackup != null;

  // "payment_cart_count" field.
  int? _paymentCartCount;
  int get paymentCartCount => _paymentCartCount ?? 0;
  set paymentCartCount(int? val) => _paymentCartCount = val;

  void incrementPaymentCartCount(int amount) =>
      paymentCartCount = paymentCartCount + amount;

  bool hasPaymentCartCount() => _paymentCartCount != null;

  // "payment_id" field.
  String? _paymentId;
  String get paymentId => _paymentId ?? '';
  set paymentId(String? val) => _paymentId = val;

  bool hasPaymentId() => _paymentId != null;

  // "payment_method" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  set paymentMethod(String? val) => _paymentMethod = val;

  bool hasPaymentMethod() => _paymentMethod != null;

  // "payment_method_type" field.
  String? _paymentMethodType;
  String get paymentMethodType => _paymentMethodType ?? '';
  set paymentMethodType(String? val) => _paymentMethodType = val;

  bool hasPaymentMethodType() => _paymentMethodType != null;

  // "selected_payment_type" field.
  String? _selectedPaymentType;
  String get selectedPaymentType => _selectedPaymentType ?? '';
  set selectedPaymentType(String? val) => _selectedPaymentType = val;

  bool hasSelectedPaymentType() => _selectedPaymentType != null;

  // "selected_payment_id" field.
  int? _selectedPaymentId;
  int get selectedPaymentId => _selectedPaymentId ?? 0;
  set selectedPaymentId(int? val) => _selectedPaymentId = val;

  void incrementSelectedPaymentId(int amount) =>
      selectedPaymentId = selectedPaymentId + amount;

  bool hasSelectedPaymentId() => _selectedPaymentId != null;

  static PaymentProcessingTimeStruct fromMap(Map<String, dynamic> data) =>
      PaymentProcessingTimeStruct(
        presentUserRef: data['present_user_ref'] as DocumentReference?,
        orderId: data['order_id'] as String?,
        paymentProcessesStatus: data['payment_processes_status'] as String?,
        paymentType: data['payment_type'] as String?,
        paymentBaseUrl: data['payment_base_url'] as String?,
        mainPaymentUrl: data['main_payment_url'] as String?,
        paymentUrl: data['payment_url'] as String?,
        secretKey: data['secret_key'] as String?,
        paymentCart: data['payment_cart'] is UserCartStruct
            ? data['payment_cart']
            : UserCartStruct.maybeFromMap(data['payment_cart']),
        paymentCartBackup: data['payment_cart_backup'] is UserCartStruct
            ? data['payment_cart_backup']
            : UserCartStruct.maybeFromMap(data['payment_cart_backup']),
        paymentCartCount: castToType<int>(data['payment_cart_count']),
        paymentId: data['payment_id'] as String?,
        paymentMethod: data['payment_method'] as String?,
        paymentMethodType: data['payment_method_type'] as String?,
        selectedPaymentType: data['selected_payment_type'] as String?,
        selectedPaymentId: castToType<int>(data['selected_payment_id']),
      );

  static PaymentProcessingTimeStruct? maybeFromMap(dynamic data) => data is Map
      ? PaymentProcessingTimeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'present_user_ref': _presentUserRef,
        'order_id': _orderId,
        'payment_processes_status': _paymentProcessesStatus,
        'payment_type': _paymentType,
        'payment_base_url': _paymentBaseUrl,
        'main_payment_url': _mainPaymentUrl,
        'payment_url': _paymentUrl,
        'secret_key': _secretKey,
        'payment_cart': _paymentCart?.toMap(),
        'payment_cart_backup': _paymentCartBackup?.toMap(),
        'payment_cart_count': _paymentCartCount,
        'payment_id': _paymentId,
        'payment_method': _paymentMethod,
        'payment_method_type': _paymentMethodType,
        'selected_payment_type': _selectedPaymentType,
        'selected_payment_id': _selectedPaymentId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'present_user_ref': serializeParam(
          _presentUserRef,
          ParamType.DocumentReference,
        ),
        'order_id': serializeParam(
          _orderId,
          ParamType.String,
        ),
        'payment_processes_status': serializeParam(
          _paymentProcessesStatus,
          ParamType.String,
        ),
        'payment_type': serializeParam(
          _paymentType,
          ParamType.String,
        ),
        'payment_base_url': serializeParam(
          _paymentBaseUrl,
          ParamType.String,
        ),
        'main_payment_url': serializeParam(
          _mainPaymentUrl,
          ParamType.String,
        ),
        'payment_url': serializeParam(
          _paymentUrl,
          ParamType.String,
        ),
        'secret_key': serializeParam(
          _secretKey,
          ParamType.String,
        ),
        'payment_cart': serializeParam(
          _paymentCart,
          ParamType.DataStruct,
        ),
        'payment_cart_backup': serializeParam(
          _paymentCartBackup,
          ParamType.DataStruct,
        ),
        'payment_cart_count': serializeParam(
          _paymentCartCount,
          ParamType.int,
        ),
        'payment_id': serializeParam(
          _paymentId,
          ParamType.String,
        ),
        'payment_method': serializeParam(
          _paymentMethod,
          ParamType.String,
        ),
        'payment_method_type': serializeParam(
          _paymentMethodType,
          ParamType.String,
        ),
        'selected_payment_type': serializeParam(
          _selectedPaymentType,
          ParamType.String,
        ),
        'selected_payment_id': serializeParam(
          _selectedPaymentId,
          ParamType.int,
        ),
      }.withoutNulls;

  static PaymentProcessingTimeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PaymentProcessingTimeStruct(
        presentUserRef: deserializeParam(
          data['present_user_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        orderId: deserializeParam(
          data['order_id'],
          ParamType.String,
          false,
        ),
        paymentProcessesStatus: deserializeParam(
          data['payment_processes_status'],
          ParamType.String,
          false,
        ),
        paymentType: deserializeParam(
          data['payment_type'],
          ParamType.String,
          false,
        ),
        paymentBaseUrl: deserializeParam(
          data['payment_base_url'],
          ParamType.String,
          false,
        ),
        mainPaymentUrl: deserializeParam(
          data['main_payment_url'],
          ParamType.String,
          false,
        ),
        paymentUrl: deserializeParam(
          data['payment_url'],
          ParamType.String,
          false,
        ),
        secretKey: deserializeParam(
          data['secret_key'],
          ParamType.String,
          false,
        ),
        paymentCart: deserializeStructParam(
          data['payment_cart'],
          ParamType.DataStruct,
          false,
          structBuilder: UserCartStruct.fromSerializableMap,
        ),
        paymentCartBackup: deserializeStructParam(
          data['payment_cart_backup'],
          ParamType.DataStruct,
          false,
          structBuilder: UserCartStruct.fromSerializableMap,
        ),
        paymentCartCount: deserializeParam(
          data['payment_cart_count'],
          ParamType.int,
          false,
        ),
        paymentId: deserializeParam(
          data['payment_id'],
          ParamType.String,
          false,
        ),
        paymentMethod: deserializeParam(
          data['payment_method'],
          ParamType.String,
          false,
        ),
        paymentMethodType: deserializeParam(
          data['payment_method_type'],
          ParamType.String,
          false,
        ),
        selectedPaymentType: deserializeParam(
          data['selected_payment_type'],
          ParamType.String,
          false,
        ),
        selectedPaymentId: deserializeParam(
          data['selected_payment_id'],
          ParamType.int,
          false,
        ),
      );

  static PaymentProcessingTimeStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      PaymentProcessingTimeStruct(
        presentUserRef: convertAlgoliaParam(
          data['present_user_ref'],
          ParamType.DocumentReference,
          false,
        ),
        orderId: convertAlgoliaParam(
          data['order_id'],
          ParamType.String,
          false,
        ),
        paymentProcessesStatus: convertAlgoliaParam(
          data['payment_processes_status'],
          ParamType.String,
          false,
        ),
        paymentType: convertAlgoliaParam(
          data['payment_type'],
          ParamType.String,
          false,
        ),
        paymentBaseUrl: convertAlgoliaParam(
          data['payment_base_url'],
          ParamType.String,
          false,
        ),
        mainPaymentUrl: convertAlgoliaParam(
          data['main_payment_url'],
          ParamType.String,
          false,
        ),
        paymentUrl: convertAlgoliaParam(
          data['payment_url'],
          ParamType.String,
          false,
        ),
        secretKey: convertAlgoliaParam(
          data['secret_key'],
          ParamType.String,
          false,
        ),
        paymentCart: convertAlgoliaParam(
          data['payment_cart'],
          ParamType.DataStruct,
          false,
          structBuilder: UserCartStruct.fromAlgoliaData,
        ),
        paymentCartBackup: convertAlgoliaParam(
          data['payment_cart_backup'],
          ParamType.DataStruct,
          false,
          structBuilder: UserCartStruct.fromAlgoliaData,
        ),
        paymentCartCount: convertAlgoliaParam(
          data['payment_cart_count'],
          ParamType.int,
          false,
        ),
        paymentId: convertAlgoliaParam(
          data['payment_id'],
          ParamType.String,
          false,
        ),
        paymentMethod: convertAlgoliaParam(
          data['payment_method'],
          ParamType.String,
          false,
        ),
        paymentMethodType: convertAlgoliaParam(
          data['payment_method_type'],
          ParamType.String,
          false,
        ),
        selectedPaymentType: convertAlgoliaParam(
          data['selected_payment_type'],
          ParamType.String,
          false,
        ),
        selectedPaymentId: convertAlgoliaParam(
          data['selected_payment_id'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PaymentProcessingTimeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentProcessingTimeStruct &&
        presentUserRef == other.presentUserRef &&
        orderId == other.orderId &&
        paymentProcessesStatus == other.paymentProcessesStatus &&
        paymentType == other.paymentType &&
        paymentBaseUrl == other.paymentBaseUrl &&
        mainPaymentUrl == other.mainPaymentUrl &&
        paymentUrl == other.paymentUrl &&
        secretKey == other.secretKey &&
        paymentCart == other.paymentCart &&
        paymentCartBackup == other.paymentCartBackup &&
        paymentCartCount == other.paymentCartCount &&
        paymentId == other.paymentId &&
        paymentMethod == other.paymentMethod &&
        paymentMethodType == other.paymentMethodType &&
        selectedPaymentType == other.selectedPaymentType &&
        selectedPaymentId == other.selectedPaymentId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        presentUserRef,
        orderId,
        paymentProcessesStatus,
        paymentType,
        paymentBaseUrl,
        mainPaymentUrl,
        paymentUrl,
        secretKey,
        paymentCart,
        paymentCartBackup,
        paymentCartCount,
        paymentId,
        paymentMethod,
        paymentMethodType,
        selectedPaymentType,
        selectedPaymentId
      ]);
}

PaymentProcessingTimeStruct createPaymentProcessingTimeStruct({
  DocumentReference? presentUserRef,
  String? orderId,
  String? paymentProcessesStatus,
  String? paymentType,
  String? paymentBaseUrl,
  String? mainPaymentUrl,
  String? paymentUrl,
  String? secretKey,
  UserCartStruct? paymentCart,
  UserCartStruct? paymentCartBackup,
  int? paymentCartCount,
  String? paymentId,
  String? paymentMethod,
  String? paymentMethodType,
  String? selectedPaymentType,
  int? selectedPaymentId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PaymentProcessingTimeStruct(
      presentUserRef: presentUserRef,
      orderId: orderId,
      paymentProcessesStatus: paymentProcessesStatus,
      paymentType: paymentType,
      paymentBaseUrl: paymentBaseUrl,
      mainPaymentUrl: mainPaymentUrl,
      paymentUrl: paymentUrl,
      secretKey: secretKey,
      paymentCart: paymentCart ?? (clearUnsetFields ? UserCartStruct() : null),
      paymentCartBackup:
          paymentCartBackup ?? (clearUnsetFields ? UserCartStruct() : null),
      paymentCartCount: paymentCartCount,
      paymentId: paymentId,
      paymentMethod: paymentMethod,
      paymentMethodType: paymentMethodType,
      selectedPaymentType: selectedPaymentType,
      selectedPaymentId: selectedPaymentId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PaymentProcessingTimeStruct? updatePaymentProcessingTimeStruct(
  PaymentProcessingTimeStruct? paymentProcessingTime, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paymentProcessingTime
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPaymentProcessingTimeStructData(
  Map<String, dynamic> firestoreData,
  PaymentProcessingTimeStruct? paymentProcessingTime,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paymentProcessingTime == null) {
    return;
  }
  if (paymentProcessingTime.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      paymentProcessingTime.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paymentProcessingTimeData = getPaymentProcessingTimeFirestoreData(
      paymentProcessingTime, forFieldValue);
  final nestedData =
      paymentProcessingTimeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      paymentProcessingTime.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPaymentProcessingTimeFirestoreData(
  PaymentProcessingTimeStruct? paymentProcessingTime, [
  bool forFieldValue = false,
]) {
  if (paymentProcessingTime == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paymentProcessingTime.toMap());

  // Handle nested data for "payment_cart" field.
  addUserCartStructData(
    firestoreData,
    paymentProcessingTime.hasPaymentCart()
        ? paymentProcessingTime.paymentCart
        : null,
    'payment_cart',
    forFieldValue,
  );

  // Handle nested data for "payment_cart_backup" field.
  addUserCartStructData(
    firestoreData,
    paymentProcessingTime.hasPaymentCartBackup()
        ? paymentProcessingTime.paymentCartBackup
        : null,
    'payment_cart_backup',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(paymentProcessingTime.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPaymentProcessingTimeListFirestoreData(
  List<PaymentProcessingTimeStruct>? paymentProcessingTimes,
) =>
    paymentProcessingTimes
        ?.map((e) => getPaymentProcessingTimeFirestoreData(e, true))
        .toList() ??
    [];
