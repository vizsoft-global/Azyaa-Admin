// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductAEFlowStruct extends FFFirebaseStruct {
  ProductAEFlowStruct({
    String? status,
    String? productId,
    String? productType,
    InfoStruct? productInfo,
    ProductStockStruct? product,
    ProductAuthorizeInfoStruct? productAuthor,
    MarketingStruct? productMarket,
    List<ProductAttributesStruct>? productAttribute,
    List<String>? categoryIds,
    List<String>? tagIds,
    List<String>? unselectCategoryIds,
    List<String>? unselectTagIds,
    TranslateInfoStruct? productInfoAuto,
    TranslateInfoStruct? productInfoCustom,
    bool? productIsReturnable,
    int? productReturnWindowDays,
    int? sku,
    List<DesignerSizeChartsStruct>? sizeChartList,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _status = status,
        _productId = productId,
        _productType = productType,
        _productInfo = productInfo,
        _product = product,
        _productAuthor = productAuthor,
        _productMarket = productMarket,
        _productAttribute = productAttribute,
        _categoryIds = categoryIds,
        _tagIds = tagIds,
        _unselectCategoryIds = unselectCategoryIds,
        _unselectTagIds = unselectTagIds,
        _productInfoAuto = productInfoAuto,
        _productInfoCustom = productInfoCustom,
        _productIsReturnable = productIsReturnable,
        _productReturnWindowDays = productReturnWindowDays,
        _sku = sku,
        _sizeChartList = sizeChartList,
        super(firestoreUtilData);

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;

  bool hasProductId() => _productId != null;

  // "product_type" field.
  String? _productType;
  String get productType => _productType ?? '';
  set productType(String? val) => _productType = val;

  bool hasProductType() => _productType != null;

  // "product_info" field.
  InfoStruct? _productInfo;
  InfoStruct get productInfo => _productInfo ?? InfoStruct();
  set productInfo(InfoStruct? val) => _productInfo = val;

  void updateProductInfo(Function(InfoStruct) updateFn) {
    updateFn(_productInfo ??= InfoStruct());
  }

  bool hasProductInfo() => _productInfo != null;

  // "product" field.
  ProductStockStruct? _product;
  ProductStockStruct get product => _product ?? ProductStockStruct();
  set product(ProductStockStruct? val) => _product = val;

  void updateProduct(Function(ProductStockStruct) updateFn) {
    updateFn(_product ??= ProductStockStruct());
  }

  bool hasProduct() => _product != null;

  // "product_author" field.
  ProductAuthorizeInfoStruct? _productAuthor;
  ProductAuthorizeInfoStruct get productAuthor =>
      _productAuthor ?? ProductAuthorizeInfoStruct();
  set productAuthor(ProductAuthorizeInfoStruct? val) => _productAuthor = val;

  void updateProductAuthor(Function(ProductAuthorizeInfoStruct) updateFn) {
    updateFn(_productAuthor ??= ProductAuthorizeInfoStruct());
  }

  bool hasProductAuthor() => _productAuthor != null;

  // "product_market" field.
  MarketingStruct? _productMarket;
  MarketingStruct get productMarket => _productMarket ?? MarketingStruct();
  set productMarket(MarketingStruct? val) => _productMarket = val;

  void updateProductMarket(Function(MarketingStruct) updateFn) {
    updateFn(_productMarket ??= MarketingStruct());
  }

  bool hasProductMarket() => _productMarket != null;

  // "product_attribute" field.
  List<ProductAttributesStruct>? _productAttribute;
  List<ProductAttributesStruct> get productAttribute =>
      _productAttribute ?? const [];
  set productAttribute(List<ProductAttributesStruct>? val) =>
      _productAttribute = val;

  void updateProductAttribute(
      Function(List<ProductAttributesStruct>) updateFn) {
    updateFn(_productAttribute ??= []);
  }

  bool hasProductAttribute() => _productAttribute != null;

  // "category_ids" field.
  List<String>? _categoryIds;
  List<String> get categoryIds => _categoryIds ?? const [];
  set categoryIds(List<String>? val) => _categoryIds = val;

  void updateCategoryIds(Function(List<String>) updateFn) {
    updateFn(_categoryIds ??= []);
  }

  bool hasCategoryIds() => _categoryIds != null;

  // "tag_ids" field.
  List<String>? _tagIds;
  List<String> get tagIds => _tagIds ?? const [];
  set tagIds(List<String>? val) => _tagIds = val;

  void updateTagIds(Function(List<String>) updateFn) {
    updateFn(_tagIds ??= []);
  }

  bool hasTagIds() => _tagIds != null;

  // "unselect_category_ids" field.
  List<String>? _unselectCategoryIds;
  List<String> get unselectCategoryIds => _unselectCategoryIds ?? const [];
  set unselectCategoryIds(List<String>? val) => _unselectCategoryIds = val;

  void updateUnselectCategoryIds(Function(List<String>) updateFn) {
    updateFn(_unselectCategoryIds ??= []);
  }

  bool hasUnselectCategoryIds() => _unselectCategoryIds != null;

  // "unselect_tag_ids" field.
  List<String>? _unselectTagIds;
  List<String> get unselectTagIds => _unselectTagIds ?? const [];
  set unselectTagIds(List<String>? val) => _unselectTagIds = val;

  void updateUnselectTagIds(Function(List<String>) updateFn) {
    updateFn(_unselectTagIds ??= []);
  }

  bool hasUnselectTagIds() => _unselectTagIds != null;

  // "product_info_auto" field.
  TranslateInfoStruct? _productInfoAuto;
  TranslateInfoStruct get productInfoAuto =>
      _productInfoAuto ?? TranslateInfoStruct();
  set productInfoAuto(TranslateInfoStruct? val) => _productInfoAuto = val;

  void updateProductInfoAuto(Function(TranslateInfoStruct) updateFn) {
    updateFn(_productInfoAuto ??= TranslateInfoStruct());
  }

  bool hasProductInfoAuto() => _productInfoAuto != null;

  // "product_info_custom" field.
  TranslateInfoStruct? _productInfoCustom;
  TranslateInfoStruct get productInfoCustom =>
      _productInfoCustom ?? TranslateInfoStruct();
  set productInfoCustom(TranslateInfoStruct? val) => _productInfoCustom = val;

  void updateProductInfoCustom(Function(TranslateInfoStruct) updateFn) {
    updateFn(_productInfoCustom ??= TranslateInfoStruct());
  }

  bool hasProductInfoCustom() => _productInfoCustom != null;

  // "product_is_returnable" field.
  bool? _productIsReturnable;
  bool get productIsReturnable => _productIsReturnable ?? false;
  set productIsReturnable(bool? val) => _productIsReturnable = val;

  bool hasProductIsReturnable() => _productIsReturnable != null;

  // "product_return_window_days" field.
  int? _productReturnWindowDays;
  int get productReturnWindowDays => _productReturnWindowDays ?? 0;
  set productReturnWindowDays(int? val) => _productReturnWindowDays = val;

  void incrementProductReturnWindowDays(int amount) =>
      productReturnWindowDays = productReturnWindowDays + amount;

  bool hasProductReturnWindowDays() => _productReturnWindowDays != null;

  // "SKU" field.
  int? _sku;
  int get sku => _sku ?? 0;
  set sku(int? val) => _sku = val;

  void incrementSku(int amount) => sku = sku + amount;

  bool hasSku() => _sku != null;

  // "size_chart_list" field.
  List<DesignerSizeChartsStruct>? _sizeChartList;
  List<DesignerSizeChartsStruct> get sizeChartList =>
      _sizeChartList ?? const [];
  set sizeChartList(List<DesignerSizeChartsStruct>? val) =>
      _sizeChartList = val;

  void updateSizeChartList(Function(List<DesignerSizeChartsStruct>) updateFn) {
    updateFn(_sizeChartList ??= []);
  }

  bool hasSizeChartList() => _sizeChartList != null;

  static ProductAEFlowStruct fromMap(Map<String, dynamic> data) =>
      ProductAEFlowStruct(
        status: data['status'] as String?,
        productId: data['product_id'] as String?,
        productType: data['product_type'] as String?,
        productInfo: data['product_info'] is InfoStruct
            ? data['product_info']
            : InfoStruct.maybeFromMap(data['product_info']),
        product: data['product'] is ProductStockStruct
            ? data['product']
            : ProductStockStruct.maybeFromMap(data['product']),
        productAuthor: data['product_author'] is ProductAuthorizeInfoStruct
            ? data['product_author']
            : ProductAuthorizeInfoStruct.maybeFromMap(data['product_author']),
        productMarket: data['product_market'] is MarketingStruct
            ? data['product_market']
            : MarketingStruct.maybeFromMap(data['product_market']),
        productAttribute: getStructList(
          data['product_attribute'],
          ProductAttributesStruct.fromMap,
        ),
        categoryIds: getDataList(data['category_ids']),
        tagIds: getDataList(data['tag_ids']),
        unselectCategoryIds: getDataList(data['unselect_category_ids']),
        unselectTagIds: getDataList(data['unselect_tag_ids']),
        productInfoAuto: data['product_info_auto'] is TranslateInfoStruct
            ? data['product_info_auto']
            : TranslateInfoStruct.maybeFromMap(data['product_info_auto']),
        productInfoCustom: data['product_info_custom'] is TranslateInfoStruct
            ? data['product_info_custom']
            : TranslateInfoStruct.maybeFromMap(data['product_info_custom']),
        productIsReturnable: data['product_is_returnable'] as bool?,
        productReturnWindowDays:
            castToType<int>(data['product_return_window_days']),
        sku: castToType<int>(data['SKU']),
        sizeChartList: getStructList(
          data['size_chart_list'],
          DesignerSizeChartsStruct.fromMap,
        ),
      );

  static ProductAEFlowStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductAEFlowStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'product_id': _productId,
        'product_type': _productType,
        'product_info': _productInfo?.toMap(),
        'product': _product?.toMap(),
        'product_author': _productAuthor?.toMap(),
        'product_market': _productMarket?.toMap(),
        'product_attribute': _productAttribute?.map((e) => e.toMap()).toList(),
        'category_ids': _categoryIds,
        'tag_ids': _tagIds,
        'unselect_category_ids': _unselectCategoryIds,
        'unselect_tag_ids': _unselectTagIds,
        'product_info_auto': _productInfoAuto?.toMap(),
        'product_info_custom': _productInfoCustom?.toMap(),
        'product_is_returnable': _productIsReturnable,
        'product_return_window_days': _productReturnWindowDays,
        'SKU': _sku,
        'size_chart_list': _sizeChartList?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'product_id': serializeParam(
          _productId,
          ParamType.String,
        ),
        'product_type': serializeParam(
          _productType,
          ParamType.String,
        ),
        'product_info': serializeParam(
          _productInfo,
          ParamType.DataStruct,
        ),
        'product': serializeParam(
          _product,
          ParamType.DataStruct,
        ),
        'product_author': serializeParam(
          _productAuthor,
          ParamType.DataStruct,
        ),
        'product_market': serializeParam(
          _productMarket,
          ParamType.DataStruct,
        ),
        'product_attribute': serializeParam(
          _productAttribute,
          ParamType.DataStruct,
          isList: true,
        ),
        'category_ids': serializeParam(
          _categoryIds,
          ParamType.String,
          isList: true,
        ),
        'tag_ids': serializeParam(
          _tagIds,
          ParamType.String,
          isList: true,
        ),
        'unselect_category_ids': serializeParam(
          _unselectCategoryIds,
          ParamType.String,
          isList: true,
        ),
        'unselect_tag_ids': serializeParam(
          _unselectTagIds,
          ParamType.String,
          isList: true,
        ),
        'product_info_auto': serializeParam(
          _productInfoAuto,
          ParamType.DataStruct,
        ),
        'product_info_custom': serializeParam(
          _productInfoCustom,
          ParamType.DataStruct,
        ),
        'product_is_returnable': serializeParam(
          _productIsReturnable,
          ParamType.bool,
        ),
        'product_return_window_days': serializeParam(
          _productReturnWindowDays,
          ParamType.int,
        ),
        'SKU': serializeParam(
          _sku,
          ParamType.int,
        ),
        'size_chart_list': serializeParam(
          _sizeChartList,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ProductAEFlowStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductAEFlowStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        productId: deserializeParam(
          data['product_id'],
          ParamType.String,
          false,
        ),
        productType: deserializeParam(
          data['product_type'],
          ParamType.String,
          false,
        ),
        productInfo: deserializeStructParam(
          data['product_info'],
          ParamType.DataStruct,
          false,
          structBuilder: InfoStruct.fromSerializableMap,
        ),
        product: deserializeStructParam(
          data['product'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductStockStruct.fromSerializableMap,
        ),
        productAuthor: deserializeStructParam(
          data['product_author'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductAuthorizeInfoStruct.fromSerializableMap,
        ),
        productMarket: deserializeStructParam(
          data['product_market'],
          ParamType.DataStruct,
          false,
          structBuilder: MarketingStruct.fromSerializableMap,
        ),
        productAttribute: deserializeStructParam<ProductAttributesStruct>(
          data['product_attribute'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductAttributesStruct.fromSerializableMap,
        ),
        categoryIds: deserializeParam<String>(
          data['category_ids'],
          ParamType.String,
          true,
        ),
        tagIds: deserializeParam<String>(
          data['tag_ids'],
          ParamType.String,
          true,
        ),
        unselectCategoryIds: deserializeParam<String>(
          data['unselect_category_ids'],
          ParamType.String,
          true,
        ),
        unselectTagIds: deserializeParam<String>(
          data['unselect_tag_ids'],
          ParamType.String,
          true,
        ),
        productInfoAuto: deserializeStructParam(
          data['product_info_auto'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateInfoStruct.fromSerializableMap,
        ),
        productInfoCustom: deserializeStructParam(
          data['product_info_custom'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateInfoStruct.fromSerializableMap,
        ),
        productIsReturnable: deserializeParam(
          data['product_is_returnable'],
          ParamType.bool,
          false,
        ),
        productReturnWindowDays: deserializeParam(
          data['product_return_window_days'],
          ParamType.int,
          false,
        ),
        sku: deserializeParam(
          data['SKU'],
          ParamType.int,
          false,
        ),
        sizeChartList: deserializeStructParam<DesignerSizeChartsStruct>(
          data['size_chart_list'],
          ParamType.DataStruct,
          true,
          structBuilder: DesignerSizeChartsStruct.fromSerializableMap,
        ),
      );

  static ProductAEFlowStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ProductAEFlowStruct(
        status: convertAlgoliaParam(
          data['status'],
          ParamType.String,
          false,
        ),
        productId: convertAlgoliaParam(
          data['product_id'],
          ParamType.String,
          false,
        ),
        productType: convertAlgoliaParam(
          data['product_type'],
          ParamType.String,
          false,
        ),
        productInfo: convertAlgoliaParam(
          data['product_info'],
          ParamType.DataStruct,
          false,
          structBuilder: InfoStruct.fromAlgoliaData,
        ),
        product: convertAlgoliaParam(
          data['product'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductStockStruct.fromAlgoliaData,
        ),
        productAuthor: convertAlgoliaParam(
          data['product_author'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductAuthorizeInfoStruct.fromAlgoliaData,
        ),
        productMarket: convertAlgoliaParam(
          data['product_market'],
          ParamType.DataStruct,
          false,
          structBuilder: MarketingStruct.fromAlgoliaData,
        ),
        productAttribute: convertAlgoliaParam<ProductAttributesStruct>(
          data['product_attribute'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductAttributesStruct.fromAlgoliaData,
        ),
        categoryIds: convertAlgoliaParam<String>(
          data['category_ids'],
          ParamType.String,
          true,
        ),
        tagIds: convertAlgoliaParam<String>(
          data['tag_ids'],
          ParamType.String,
          true,
        ),
        unselectCategoryIds: convertAlgoliaParam<String>(
          data['unselect_category_ids'],
          ParamType.String,
          true,
        ),
        unselectTagIds: convertAlgoliaParam<String>(
          data['unselect_tag_ids'],
          ParamType.String,
          true,
        ),
        productInfoAuto: convertAlgoliaParam(
          data['product_info_auto'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateInfoStruct.fromAlgoliaData,
        ),
        productInfoCustom: convertAlgoliaParam(
          data['product_info_custom'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateInfoStruct.fromAlgoliaData,
        ),
        productIsReturnable: convertAlgoliaParam(
          data['product_is_returnable'],
          ParamType.bool,
          false,
        ),
        productReturnWindowDays: convertAlgoliaParam(
          data['product_return_window_days'],
          ParamType.int,
          false,
        ),
        sku: convertAlgoliaParam(
          data['SKU'],
          ParamType.int,
          false,
        ),
        sizeChartList: convertAlgoliaParam<DesignerSizeChartsStruct>(
          data['size_chart_list'],
          ParamType.DataStruct,
          true,
          structBuilder: DesignerSizeChartsStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ProductAEFlowStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductAEFlowStruct &&
        status == other.status &&
        productId == other.productId &&
        productType == other.productType &&
        productInfo == other.productInfo &&
        product == other.product &&
        productAuthor == other.productAuthor &&
        productMarket == other.productMarket &&
        listEquality.equals(productAttribute, other.productAttribute) &&
        listEquality.equals(categoryIds, other.categoryIds) &&
        listEquality.equals(tagIds, other.tagIds) &&
        listEquality.equals(unselectCategoryIds, other.unselectCategoryIds) &&
        listEquality.equals(unselectTagIds, other.unselectTagIds) &&
        productInfoAuto == other.productInfoAuto &&
        productInfoCustom == other.productInfoCustom &&
        productIsReturnable == other.productIsReturnable &&
        productReturnWindowDays == other.productReturnWindowDays &&
        sku == other.sku &&
        listEquality.equals(sizeChartList, other.sizeChartList);
  }

  @override
  int get hashCode => const ListEquality().hash([
        status,
        productId,
        productType,
        productInfo,
        product,
        productAuthor,
        productMarket,
        productAttribute,
        categoryIds,
        tagIds,
        unselectCategoryIds,
        unselectTagIds,
        productInfoAuto,
        productInfoCustom,
        productIsReturnable,
        productReturnWindowDays,
        sku,
        sizeChartList
      ]);
}

ProductAEFlowStruct createProductAEFlowStruct({
  String? status,
  String? productId,
  String? productType,
  InfoStruct? productInfo,
  ProductStockStruct? product,
  ProductAuthorizeInfoStruct? productAuthor,
  MarketingStruct? productMarket,
  TranslateInfoStruct? productInfoAuto,
  TranslateInfoStruct? productInfoCustom,
  bool? productIsReturnable,
  int? productReturnWindowDays,
  int? sku,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductAEFlowStruct(
      status: status,
      productId: productId,
      productType: productType,
      productInfo: productInfo ?? (clearUnsetFields ? InfoStruct() : null),
      product: product ?? (clearUnsetFields ? ProductStockStruct() : null),
      productAuthor: productAuthor ??
          (clearUnsetFields ? ProductAuthorizeInfoStruct() : null),
      productMarket:
          productMarket ?? (clearUnsetFields ? MarketingStruct() : null),
      productInfoAuto:
          productInfoAuto ?? (clearUnsetFields ? TranslateInfoStruct() : null),
      productInfoCustom: productInfoCustom ??
          (clearUnsetFields ? TranslateInfoStruct() : null),
      productIsReturnable: productIsReturnable,
      productReturnWindowDays: productReturnWindowDays,
      sku: sku,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductAEFlowStruct? updateProductAEFlowStruct(
  ProductAEFlowStruct? productAEFlow, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productAEFlow
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductAEFlowStructData(
  Map<String, dynamic> firestoreData,
  ProductAEFlowStruct? productAEFlow,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productAEFlow == null) {
    return;
  }
  if (productAEFlow.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productAEFlow.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productAEFlowData =
      getProductAEFlowFirestoreData(productAEFlow, forFieldValue);
  final nestedData =
      productAEFlowData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productAEFlow.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductAEFlowFirestoreData(
  ProductAEFlowStruct? productAEFlow, [
  bool forFieldValue = false,
]) {
  if (productAEFlow == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productAEFlow.toMap());

  // Handle nested data for "product_info" field.
  addInfoStructData(
    firestoreData,
    productAEFlow.hasProductInfo() ? productAEFlow.productInfo : null,
    'product_info',
    forFieldValue,
  );

  // Handle nested data for "product" field.
  addProductStockStructData(
    firestoreData,
    productAEFlow.hasProduct() ? productAEFlow.product : null,
    'product',
    forFieldValue,
  );

  // Handle nested data for "product_author" field.
  addProductAuthorizeInfoStructData(
    firestoreData,
    productAEFlow.hasProductAuthor() ? productAEFlow.productAuthor : null,
    'product_author',
    forFieldValue,
  );

  // Handle nested data for "product_market" field.
  addMarketingStructData(
    firestoreData,
    productAEFlow.hasProductMarket() ? productAEFlow.productMarket : null,
    'product_market',
    forFieldValue,
  );

  // Handle nested data for "product_info_auto" field.
  addTranslateInfoStructData(
    firestoreData,
    productAEFlow.hasProductInfoAuto() ? productAEFlow.productInfoAuto : null,
    'product_info_auto',
    forFieldValue,
  );

  // Handle nested data for "product_info_custom" field.
  addTranslateInfoStructData(
    firestoreData,
    productAEFlow.hasProductInfoCustom()
        ? productAEFlow.productInfoCustom
        : null,
    'product_info_custom',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(productAEFlow.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductAEFlowListFirestoreData(
  List<ProductAEFlowStruct>? productAEFlows,
) =>
    productAEFlows
        ?.map((e) => getProductAEFlowFirestoreData(e, true))
        .toList() ??
    [];
