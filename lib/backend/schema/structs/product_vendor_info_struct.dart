// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ProductVendorInfoStruct extends FFFirebaseStruct {
  ProductVendorInfoStruct({
    String? userDesignerId,
    String? vendorSku,
    double? vendorCost,
    int? vendorMinOrderQty,
    int? vendorLeadTimeDays,
    DateTime? contractStartTime,
    DateTime? contractEndTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userDesignerId = userDesignerId,
        _vendorSku = vendorSku,
        _vendorCost = vendorCost,
        _vendorMinOrderQty = vendorMinOrderQty,
        _vendorLeadTimeDays = vendorLeadTimeDays,
        _contractStartTime = contractStartTime,
        _contractEndTime = contractEndTime,
        super(firestoreUtilData);

  // "user_designer_id" field.
  String? _userDesignerId;
  String get userDesignerId => _userDesignerId ?? '';
  set userDesignerId(String? val) => _userDesignerId = val;

  bool hasUserDesignerId() => _userDesignerId != null;

  // "vendor_sku" field.
  String? _vendorSku;
  String get vendorSku => _vendorSku ?? '';
  set vendorSku(String? val) => _vendorSku = val;

  bool hasVendorSku() => _vendorSku != null;

  // "vendor_cost" field.
  double? _vendorCost;
  double get vendorCost => _vendorCost ?? 0.0;
  set vendorCost(double? val) => _vendorCost = val;

  void incrementVendorCost(double amount) => vendorCost = vendorCost + amount;

  bool hasVendorCost() => _vendorCost != null;

  // "vendor_min_order_qty" field.
  int? _vendorMinOrderQty;
  int get vendorMinOrderQty => _vendorMinOrderQty ?? 0;
  set vendorMinOrderQty(int? val) => _vendorMinOrderQty = val;

  void incrementVendorMinOrderQty(int amount) =>
      vendorMinOrderQty = vendorMinOrderQty + amount;

  bool hasVendorMinOrderQty() => _vendorMinOrderQty != null;

  // "vendor_lead_time_days" field.
  int? _vendorLeadTimeDays;
  int get vendorLeadTimeDays => _vendorLeadTimeDays ?? 0;
  set vendorLeadTimeDays(int? val) => _vendorLeadTimeDays = val;

  void incrementVendorLeadTimeDays(int amount) =>
      vendorLeadTimeDays = vendorLeadTimeDays + amount;

  bool hasVendorLeadTimeDays() => _vendorLeadTimeDays != null;

  // "contract_start_time" field.
  DateTime? _contractStartTime;
  DateTime? get contractStartTime => _contractStartTime;
  set contractStartTime(DateTime? val) => _contractStartTime = val;

  bool hasContractStartTime() => _contractStartTime != null;

  // "contract_end_time" field.
  DateTime? _contractEndTime;
  DateTime? get contractEndTime => _contractEndTime;
  set contractEndTime(DateTime? val) => _contractEndTime = val;

  bool hasContractEndTime() => _contractEndTime != null;

  static ProductVendorInfoStruct fromMap(Map<String, dynamic> data) =>
      ProductVendorInfoStruct(
        userDesignerId: data['user_designer_id'] as String?,
        vendorSku: data['vendor_sku'] as String?,
        vendorCost: castToType<double>(data['vendor_cost']),
        vendorMinOrderQty: castToType<int>(data['vendor_min_order_qty']),
        vendorLeadTimeDays: castToType<int>(data['vendor_lead_time_days']),
        contractStartTime: data['contract_start_time'] as DateTime?,
        contractEndTime: data['contract_end_time'] as DateTime?,
      );

  static ProductVendorInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductVendorInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_designer_id': _userDesignerId,
        'vendor_sku': _vendorSku,
        'vendor_cost': _vendorCost,
        'vendor_min_order_qty': _vendorMinOrderQty,
        'vendor_lead_time_days': _vendorLeadTimeDays,
        'contract_start_time': _contractStartTime,
        'contract_end_time': _contractEndTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_designer_id': serializeParam(
          _userDesignerId,
          ParamType.String,
        ),
        'vendor_sku': serializeParam(
          _vendorSku,
          ParamType.String,
        ),
        'vendor_cost': serializeParam(
          _vendorCost,
          ParamType.double,
        ),
        'vendor_min_order_qty': serializeParam(
          _vendorMinOrderQty,
          ParamType.int,
        ),
        'vendor_lead_time_days': serializeParam(
          _vendorLeadTimeDays,
          ParamType.int,
        ),
        'contract_start_time': serializeParam(
          _contractStartTime,
          ParamType.DateTime,
        ),
        'contract_end_time': serializeParam(
          _contractEndTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ProductVendorInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProductVendorInfoStruct(
        userDesignerId: deserializeParam(
          data['user_designer_id'],
          ParamType.String,
          false,
        ),
        vendorSku: deserializeParam(
          data['vendor_sku'],
          ParamType.String,
          false,
        ),
        vendorCost: deserializeParam(
          data['vendor_cost'],
          ParamType.double,
          false,
        ),
        vendorMinOrderQty: deserializeParam(
          data['vendor_min_order_qty'],
          ParamType.int,
          false,
        ),
        vendorLeadTimeDays: deserializeParam(
          data['vendor_lead_time_days'],
          ParamType.int,
          false,
        ),
        contractStartTime: deserializeParam(
          data['contract_start_time'],
          ParamType.DateTime,
          false,
        ),
        contractEndTime: deserializeParam(
          data['contract_end_time'],
          ParamType.DateTime,
          false,
        ),
      );

  static ProductVendorInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ProductVendorInfoStruct(
        userDesignerId: convertAlgoliaParam(
          data['user_designer_id'],
          ParamType.String,
          false,
        ),
        vendorSku: convertAlgoliaParam(
          data['vendor_sku'],
          ParamType.String,
          false,
        ),
        vendorCost: convertAlgoliaParam(
          data['vendor_cost'],
          ParamType.double,
          false,
        ),
        vendorMinOrderQty: convertAlgoliaParam(
          data['vendor_min_order_qty'],
          ParamType.int,
          false,
        ),
        vendorLeadTimeDays: convertAlgoliaParam(
          data['vendor_lead_time_days'],
          ParamType.int,
          false,
        ),
        contractStartTime: convertAlgoliaParam(
          data['contract_start_time'],
          ParamType.DateTime,
          false,
        ),
        contractEndTime: convertAlgoliaParam(
          data['contract_end_time'],
          ParamType.DateTime,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ProductVendorInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductVendorInfoStruct &&
        userDesignerId == other.userDesignerId &&
        vendorSku == other.vendorSku &&
        vendorCost == other.vendorCost &&
        vendorMinOrderQty == other.vendorMinOrderQty &&
        vendorLeadTimeDays == other.vendorLeadTimeDays &&
        contractStartTime == other.contractStartTime &&
        contractEndTime == other.contractEndTime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userDesignerId,
        vendorSku,
        vendorCost,
        vendorMinOrderQty,
        vendorLeadTimeDays,
        contractStartTime,
        contractEndTime
      ]);
}

ProductVendorInfoStruct createProductVendorInfoStruct({
  String? userDesignerId,
  String? vendorSku,
  double? vendorCost,
  int? vendorMinOrderQty,
  int? vendorLeadTimeDays,
  DateTime? contractStartTime,
  DateTime? contractEndTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductVendorInfoStruct(
      userDesignerId: userDesignerId,
      vendorSku: vendorSku,
      vendorCost: vendorCost,
      vendorMinOrderQty: vendorMinOrderQty,
      vendorLeadTimeDays: vendorLeadTimeDays,
      contractStartTime: contractStartTime,
      contractEndTime: contractEndTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductVendorInfoStruct? updateProductVendorInfoStruct(
  ProductVendorInfoStruct? productVendorInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productVendorInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductVendorInfoStructData(
  Map<String, dynamic> firestoreData,
  ProductVendorInfoStruct? productVendorInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productVendorInfo == null) {
    return;
  }
  if (productVendorInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productVendorInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productVendorInfoData =
      getProductVendorInfoFirestoreData(productVendorInfo, forFieldValue);
  final nestedData =
      productVendorInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productVendorInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductVendorInfoFirestoreData(
  ProductVendorInfoStruct? productVendorInfo, [
  bool forFieldValue = false,
]) {
  if (productVendorInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productVendorInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(productVendorInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductVendorInfoListFirestoreData(
  List<ProductVendorInfoStruct>? productVendorInfos,
) =>
    productVendorInfos
        ?.map((e) => getProductVendorInfoFirestoreData(e, true))
        .toList() ??
    [];
