// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarketingStruct extends FFFirebaseStruct {
  MarketingStruct({
    bool? isFeatueProduct,
    bool? isRecommendedProduct,
    bool? isPopularProduct,
    List<ProductSalesHistoryStruct>? productSalesHistory,
    List<PromotionMarketingStruct>? promotion,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isFeatueProduct = isFeatueProduct,
        _isRecommendedProduct = isRecommendedProduct,
        _isPopularProduct = isPopularProduct,
        _productSalesHistory = productSalesHistory,
        _promotion = promotion,
        super(firestoreUtilData);

  // "is_featue_product" field.
  bool? _isFeatueProduct;
  bool get isFeatueProduct => _isFeatueProduct ?? false;
  set isFeatueProduct(bool? val) => _isFeatueProduct = val;

  bool hasIsFeatueProduct() => _isFeatueProduct != null;

  // "is_recommended_product" field.
  bool? _isRecommendedProduct;
  bool get isRecommendedProduct => _isRecommendedProduct ?? false;
  set isRecommendedProduct(bool? val) => _isRecommendedProduct = val;

  bool hasIsRecommendedProduct() => _isRecommendedProduct != null;

  // "is_popular_product" field.
  bool? _isPopularProduct;
  bool get isPopularProduct => _isPopularProduct ?? false;
  set isPopularProduct(bool? val) => _isPopularProduct = val;

  bool hasIsPopularProduct() => _isPopularProduct != null;

  // "product_sales_history" field.
  List<ProductSalesHistoryStruct>? _productSalesHistory;
  List<ProductSalesHistoryStruct> get productSalesHistory =>
      _productSalesHistory ?? const [];
  set productSalesHistory(List<ProductSalesHistoryStruct>? val) =>
      _productSalesHistory = val;

  void updateProductSalesHistory(
      Function(List<ProductSalesHistoryStruct>) updateFn) {
    updateFn(_productSalesHistory ??= []);
  }

  bool hasProductSalesHistory() => _productSalesHistory != null;

  // "promotion" field.
  List<PromotionMarketingStruct>? _promotion;
  List<PromotionMarketingStruct> get promotion => _promotion ?? const [];
  set promotion(List<PromotionMarketingStruct>? val) => _promotion = val;

  void updatePromotion(Function(List<PromotionMarketingStruct>) updateFn) {
    updateFn(_promotion ??= []);
  }

  bool hasPromotion() => _promotion != null;

  static MarketingStruct fromMap(Map<String, dynamic> data) => MarketingStruct(
        isFeatueProduct: data['is_featue_product'] as bool?,
        isRecommendedProduct: data['is_recommended_product'] as bool?,
        isPopularProduct: data['is_popular_product'] as bool?,
        productSalesHistory: getStructList(
          data['product_sales_history'],
          ProductSalesHistoryStruct.fromMap,
        ),
        promotion: getStructList(
          data['promotion'],
          PromotionMarketingStruct.fromMap,
        ),
      );

  static MarketingStruct? maybeFromMap(dynamic data) => data is Map
      ? MarketingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'is_featue_product': _isFeatueProduct,
        'is_recommended_product': _isRecommendedProduct,
        'is_popular_product': _isPopularProduct,
        'product_sales_history':
            _productSalesHistory?.map((e) => e.toMap()).toList(),
        'promotion': _promotion?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'is_featue_product': serializeParam(
          _isFeatueProduct,
          ParamType.bool,
        ),
        'is_recommended_product': serializeParam(
          _isRecommendedProduct,
          ParamType.bool,
        ),
        'is_popular_product': serializeParam(
          _isPopularProduct,
          ParamType.bool,
        ),
        'product_sales_history': serializeParam(
          _productSalesHistory,
          ParamType.DataStruct,
          isList: true,
        ),
        'promotion': serializeParam(
          _promotion,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MarketingStruct fromSerializableMap(Map<String, dynamic> data) =>
      MarketingStruct(
        isFeatueProduct: deserializeParam(
          data['is_featue_product'],
          ParamType.bool,
          false,
        ),
        isRecommendedProduct: deserializeParam(
          data['is_recommended_product'],
          ParamType.bool,
          false,
        ),
        isPopularProduct: deserializeParam(
          data['is_popular_product'],
          ParamType.bool,
          false,
        ),
        productSalesHistory: deserializeStructParam<ProductSalesHistoryStruct>(
          data['product_sales_history'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductSalesHistoryStruct.fromSerializableMap,
        ),
        promotion: deserializeStructParam<PromotionMarketingStruct>(
          data['promotion'],
          ParamType.DataStruct,
          true,
          structBuilder: PromotionMarketingStruct.fromSerializableMap,
        ),
      );

  static MarketingStruct fromAlgoliaData(Map<String, dynamic> data) =>
      MarketingStruct(
        isFeatueProduct: convertAlgoliaParam(
          data['is_featue_product'],
          ParamType.bool,
          false,
        ),
        isRecommendedProduct: convertAlgoliaParam(
          data['is_recommended_product'],
          ParamType.bool,
          false,
        ),
        isPopularProduct: convertAlgoliaParam(
          data['is_popular_product'],
          ParamType.bool,
          false,
        ),
        productSalesHistory: convertAlgoliaParam<ProductSalesHistoryStruct>(
          data['product_sales_history'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductSalesHistoryStruct.fromAlgoliaData,
        ),
        promotion: convertAlgoliaParam<PromotionMarketingStruct>(
          data['promotion'],
          ParamType.DataStruct,
          true,
          structBuilder: PromotionMarketingStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MarketingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MarketingStruct &&
        isFeatueProduct == other.isFeatueProduct &&
        isRecommendedProduct == other.isRecommendedProduct &&
        isPopularProduct == other.isPopularProduct &&
        listEquality.equals(productSalesHistory, other.productSalesHistory) &&
        listEquality.equals(promotion, other.promotion);
  }

  @override
  int get hashCode => const ListEquality().hash([
        isFeatueProduct,
        isRecommendedProduct,
        isPopularProduct,
        productSalesHistory,
        promotion
      ]);
}

MarketingStruct createMarketingStruct({
  bool? isFeatueProduct,
  bool? isRecommendedProduct,
  bool? isPopularProduct,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MarketingStruct(
      isFeatueProduct: isFeatueProduct,
      isRecommendedProduct: isRecommendedProduct,
      isPopularProduct: isPopularProduct,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MarketingStruct? updateMarketingStruct(
  MarketingStruct? marketing, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    marketing
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMarketingStructData(
  Map<String, dynamic> firestoreData,
  MarketingStruct? marketing,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (marketing == null) {
    return;
  }
  if (marketing.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && marketing.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final marketingData = getMarketingFirestoreData(marketing, forFieldValue);
  final nestedData = marketingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = marketing.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMarketingFirestoreData(
  MarketingStruct? marketing, [
  bool forFieldValue = false,
]) {
  if (marketing == null) {
    return {};
  }
  final firestoreData = mapToFirestore(marketing.toMap());

  // Add any Firestore field values
  mapToFirestore(marketing.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMarketingListFirestoreData(
  List<MarketingStruct>? marketings,
) =>
    marketings?.map((e) => getMarketingFirestoreData(e, true)).toList() ?? [];
