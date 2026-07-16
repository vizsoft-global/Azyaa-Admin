// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductAuthorizeInfoStruct extends FFFirebaseStruct {
  ProductAuthorizeInfoStruct({
    String? productDesignerId,
    DocumentReference? productDesignerRef,
    bool? isVirtualtryonStatus,
    bool? isAffiliateProduct,
    double? affiliateCommissionRate,
    int? affiliateCommissionPoints,
    DateTime? affiliateEndDate,
    List<String>? creatorIdList,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productDesignerId = productDesignerId,
        _productDesignerRef = productDesignerRef,
        _isVirtualtryonStatus = isVirtualtryonStatus,
        _isAffiliateProduct = isAffiliateProduct,
        _affiliateCommissionRate = affiliateCommissionRate,
        _affiliateCommissionPoints = affiliateCommissionPoints,
        _affiliateEndDate = affiliateEndDate,
        _creatorIdList = creatorIdList,
        super(firestoreUtilData);

  // "product_designer_id" field.
  String? _productDesignerId;
  String get productDesignerId => _productDesignerId ?? '';
  set productDesignerId(String? val) => _productDesignerId = val;

  bool hasProductDesignerId() => _productDesignerId != null;

  // "product_designer_ref" field.
  DocumentReference? _productDesignerRef;
  DocumentReference? get productDesignerRef => _productDesignerRef;
  set productDesignerRef(DocumentReference? val) => _productDesignerRef = val;

  bool hasProductDesignerRef() => _productDesignerRef != null;

  // "is_virtualtryon_status" field.
  bool? _isVirtualtryonStatus;
  bool get isVirtualtryonStatus => _isVirtualtryonStatus ?? false;
  set isVirtualtryonStatus(bool? val) => _isVirtualtryonStatus = val;

  bool hasIsVirtualtryonStatus() => _isVirtualtryonStatus != null;

  // "is_affiliate_product" field.
  bool? _isAffiliateProduct;
  bool get isAffiliateProduct => _isAffiliateProduct ?? false;
  set isAffiliateProduct(bool? val) => _isAffiliateProduct = val;

  bool hasIsAffiliateProduct() => _isAffiliateProduct != null;

  // "affiliate_commission_rate" field.
  double? _affiliateCommissionRate;
  double get affiliateCommissionRate => _affiliateCommissionRate ?? 0.0;
  set affiliateCommissionRate(double? val) => _affiliateCommissionRate = val;

  void incrementAffiliateCommissionRate(double amount) =>
      affiliateCommissionRate = affiliateCommissionRate + amount;

  bool hasAffiliateCommissionRate() => _affiliateCommissionRate != null;

  // "affiliate_commission_points" field.
  int? _affiliateCommissionPoints;
  int get affiliateCommissionPoints => _affiliateCommissionPoints ?? 0;
  set affiliateCommissionPoints(int? val) => _affiliateCommissionPoints = val;

  void incrementAffiliateCommissionPoints(int amount) =>
      affiliateCommissionPoints = affiliateCommissionPoints + amount;

  bool hasAffiliateCommissionPoints() => _affiliateCommissionPoints != null;

  // "affiliate_end_date" field.
  DateTime? _affiliateEndDate;
  DateTime? get affiliateEndDate => _affiliateEndDate;
  set affiliateEndDate(DateTime? val) => _affiliateEndDate = val;

  bool hasAffiliateEndDate() => _affiliateEndDate != null;

  // "creator_id_list" field.
  List<String>? _creatorIdList;
  List<String> get creatorIdList => _creatorIdList ?? const [];
  set creatorIdList(List<String>? val) => _creatorIdList = val;

  void updateCreatorIdList(Function(List<String>) updateFn) {
    updateFn(_creatorIdList ??= []);
  }

  bool hasCreatorIdList() => _creatorIdList != null;

  static ProductAuthorizeInfoStruct fromMap(Map<String, dynamic> data) =>
      ProductAuthorizeInfoStruct(
        productDesignerId: data['product_designer_id'] as String?,
        productDesignerRef: data['product_designer_ref'] as DocumentReference?,
        isVirtualtryonStatus: data['is_virtualtryon_status'] as bool?,
        isAffiliateProduct: data['is_affiliate_product'] as bool?,
        affiliateCommissionRate:
            castToType<double>(data['affiliate_commission_rate']),
        affiliateCommissionPoints:
            castToType<int>(data['affiliate_commission_points']),
        affiliateEndDate: data['affiliate_end_date'] as DateTime?,
        creatorIdList: getDataList(data['creator_id_list']),
      );

  static ProductAuthorizeInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductAuthorizeInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'product_designer_id': _productDesignerId,
        'product_designer_ref': _productDesignerRef,
        'is_virtualtryon_status': _isVirtualtryonStatus,
        'is_affiliate_product': _isAffiliateProduct,
        'affiliate_commission_rate': _affiliateCommissionRate,
        'affiliate_commission_points': _affiliateCommissionPoints,
        'affiliate_end_date': _affiliateEndDate,
        'creator_id_list': _creatorIdList,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product_designer_id': serializeParam(
          _productDesignerId,
          ParamType.String,
        ),
        'product_designer_ref': serializeParam(
          _productDesignerRef,
          ParamType.DocumentReference,
        ),
        'is_virtualtryon_status': serializeParam(
          _isVirtualtryonStatus,
          ParamType.bool,
        ),
        'is_affiliate_product': serializeParam(
          _isAffiliateProduct,
          ParamType.bool,
        ),
        'affiliate_commission_rate': serializeParam(
          _affiliateCommissionRate,
          ParamType.double,
        ),
        'affiliate_commission_points': serializeParam(
          _affiliateCommissionPoints,
          ParamType.int,
        ),
        'affiliate_end_date': serializeParam(
          _affiliateEndDate,
          ParamType.DateTime,
        ),
        'creator_id_list': serializeParam(
          _creatorIdList,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ProductAuthorizeInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProductAuthorizeInfoStruct(
        productDesignerId: deserializeParam(
          data['product_designer_id'],
          ParamType.String,
          false,
        ),
        productDesignerRef: deserializeParam(
          data['product_designer_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        isVirtualtryonStatus: deserializeParam(
          data['is_virtualtryon_status'],
          ParamType.bool,
          false,
        ),
        isAffiliateProduct: deserializeParam(
          data['is_affiliate_product'],
          ParamType.bool,
          false,
        ),
        affiliateCommissionRate: deserializeParam(
          data['affiliate_commission_rate'],
          ParamType.double,
          false,
        ),
        affiliateCommissionPoints: deserializeParam(
          data['affiliate_commission_points'],
          ParamType.int,
          false,
        ),
        affiliateEndDate: deserializeParam(
          data['affiliate_end_date'],
          ParamType.DateTime,
          false,
        ),
        creatorIdList: deserializeParam<String>(
          data['creator_id_list'],
          ParamType.String,
          true,
        ),
      );

  static ProductAuthorizeInfoStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      ProductAuthorizeInfoStruct(
        productDesignerId: convertAlgoliaParam(
          data['product_designer_id'],
          ParamType.String,
          false,
        ),
        productDesignerRef: convertAlgoliaParam(
          data['product_designer_ref'],
          ParamType.DocumentReference,
          false,
        ),
        isVirtualtryonStatus: convertAlgoliaParam(
          data['is_virtualtryon_status'],
          ParamType.bool,
          false,
        ),
        isAffiliateProduct: convertAlgoliaParam(
          data['is_affiliate_product'],
          ParamType.bool,
          false,
        ),
        affiliateCommissionRate: convertAlgoliaParam(
          data['affiliate_commission_rate'],
          ParamType.double,
          false,
        ),
        affiliateCommissionPoints: convertAlgoliaParam(
          data['affiliate_commission_points'],
          ParamType.int,
          false,
        ),
        affiliateEndDate: convertAlgoliaParam(
          data['affiliate_end_date'],
          ParamType.DateTime,
          false,
        ),
        creatorIdList: convertAlgoliaParam<String>(
          data['creator_id_list'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ProductAuthorizeInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductAuthorizeInfoStruct &&
        productDesignerId == other.productDesignerId &&
        productDesignerRef == other.productDesignerRef &&
        isVirtualtryonStatus == other.isVirtualtryonStatus &&
        isAffiliateProduct == other.isAffiliateProduct &&
        affiliateCommissionRate == other.affiliateCommissionRate &&
        affiliateCommissionPoints == other.affiliateCommissionPoints &&
        affiliateEndDate == other.affiliateEndDate &&
        listEquality.equals(creatorIdList, other.creatorIdList);
  }

  @override
  int get hashCode => const ListEquality().hash([
        productDesignerId,
        productDesignerRef,
        isVirtualtryonStatus,
        isAffiliateProduct,
        affiliateCommissionRate,
        affiliateCommissionPoints,
        affiliateEndDate,
        creatorIdList
      ]);
}

ProductAuthorizeInfoStruct createProductAuthorizeInfoStruct({
  String? productDesignerId,
  DocumentReference? productDesignerRef,
  bool? isVirtualtryonStatus,
  bool? isAffiliateProduct,
  double? affiliateCommissionRate,
  int? affiliateCommissionPoints,
  DateTime? affiliateEndDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductAuthorizeInfoStruct(
      productDesignerId: productDesignerId,
      productDesignerRef: productDesignerRef,
      isVirtualtryonStatus: isVirtualtryonStatus,
      isAffiliateProduct: isAffiliateProduct,
      affiliateCommissionRate: affiliateCommissionRate,
      affiliateCommissionPoints: affiliateCommissionPoints,
      affiliateEndDate: affiliateEndDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductAuthorizeInfoStruct? updateProductAuthorizeInfoStruct(
  ProductAuthorizeInfoStruct? productAuthorizeInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productAuthorizeInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductAuthorizeInfoStructData(
  Map<String, dynamic> firestoreData,
  ProductAuthorizeInfoStruct? productAuthorizeInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productAuthorizeInfo == null) {
    return;
  }
  if (productAuthorizeInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productAuthorizeInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productAuthorizeInfoData =
      getProductAuthorizeInfoFirestoreData(productAuthorizeInfo, forFieldValue);
  final nestedData =
      productAuthorizeInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      productAuthorizeInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductAuthorizeInfoFirestoreData(
  ProductAuthorizeInfoStruct? productAuthorizeInfo, [
  bool forFieldValue = false,
]) {
  if (productAuthorizeInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productAuthorizeInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(productAuthorizeInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductAuthorizeInfoListFirestoreData(
  List<ProductAuthorizeInfoStruct>? productAuthorizeInfos,
) =>
    productAuthorizeInfos
        ?.map((e) => getProductAuthorizeInfoFirestoreData(e, true))
        .toList() ??
    [];
