// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCartItemsStruct extends FFFirebaseStruct {
  UserCartItemsStruct({
    bool? isProceedStatus,
    String? proceedBlockReason,
    int? cartItemId,
    List<ProductAttributesStruct>? cartItemAttribute,
    String? productType,
    String? productId,
    InfoStruct? productInfo,
    int? quantity,
    double? price,
    double? totalPrice,
    DocumentReference? productDesignerRef,
    String? productDesignerId,
    DocumentReference? productRef,
    ProductStockStruct? productStockInfo,
    InventoryInfoStruct? productInventoryInfo,
    String? productMainType,
    DocumentReference? creatorRef,
    String? creatorId,
    String? promotionId,
    String? promotionUrl,
    double? promotionCommisionRate,
    UserBodyStruct? productUserBodyInfo,
    ProductPickupInfoStruct? productPickupInfo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isProceedStatus = isProceedStatus,
        _proceedBlockReason = proceedBlockReason,
        _cartItemId = cartItemId,
        _cartItemAttribute = cartItemAttribute,
        _productType = productType,
        _productId = productId,
        _productInfo = productInfo,
        _quantity = quantity,
        _price = price,
        _totalPrice = totalPrice,
        _productDesignerRef = productDesignerRef,
        _productDesignerId = productDesignerId,
        _productRef = productRef,
        _productStockInfo = productStockInfo,
        _productInventoryInfo = productInventoryInfo,
        _productMainType = productMainType,
        _creatorRef = creatorRef,
        _creatorId = creatorId,
        _promotionId = promotionId,
        _promotionUrl = promotionUrl,
        _promotionCommisionRate = promotionCommisionRate,
        _productUserBodyInfo = productUserBodyInfo,
        _productPickupInfo = productPickupInfo,
        super(firestoreUtilData);

  // "is_proceed_status" field.
  bool? _isProceedStatus;
  bool get isProceedStatus => _isProceedStatus ?? false;
  set isProceedStatus(bool? val) => _isProceedStatus = val;

  bool hasIsProceedStatus() => _isProceedStatus != null;

  // "proceed_block_reason" field.
  String? _proceedBlockReason;
  String get proceedBlockReason => _proceedBlockReason ?? '';
  set proceedBlockReason(String? val) => _proceedBlockReason = val;

  bool hasProceedBlockReason() => _proceedBlockReason != null;

  // "cart_item_id" field.
  int? _cartItemId;
  int get cartItemId => _cartItemId ?? 0;
  set cartItemId(int? val) => _cartItemId = val;

  void incrementCartItemId(int amount) => cartItemId = cartItemId + amount;

  bool hasCartItemId() => _cartItemId != null;

  // "cart_item_attribute" field.
  List<ProductAttributesStruct>? _cartItemAttribute;
  List<ProductAttributesStruct> get cartItemAttribute =>
      _cartItemAttribute ?? const [];
  set cartItemAttribute(List<ProductAttributesStruct>? val) =>
      _cartItemAttribute = val;

  void updateCartItemAttribute(
      Function(List<ProductAttributesStruct>) updateFn) {
    updateFn(_cartItemAttribute ??= []);
  }

  bool hasCartItemAttribute() => _cartItemAttribute != null;

  // "product_type" field.
  String? _productType;
  String get productType => _productType ?? '';
  set productType(String? val) => _productType = val;

  bool hasProductType() => _productType != null;

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;

  bool hasProductId() => _productId != null;

  // "product_info" field.
  InfoStruct? _productInfo;
  InfoStruct get productInfo => _productInfo ?? InfoStruct();
  set productInfo(InfoStruct? val) => _productInfo = val;

  void updateProductInfo(Function(InfoStruct) updateFn) {
    updateFn(_productInfo ??= InfoStruct());
  }

  bool hasProductInfo() => _productInfo != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "total_price" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  set totalPrice(double? val) => _totalPrice = val;

  void incrementTotalPrice(double amount) => totalPrice = totalPrice + amount;

  bool hasTotalPrice() => _totalPrice != null;

  // "product_designer_ref" field.
  DocumentReference? _productDesignerRef;
  DocumentReference? get productDesignerRef => _productDesignerRef;
  set productDesignerRef(DocumentReference? val) => _productDesignerRef = val;

  bool hasProductDesignerRef() => _productDesignerRef != null;

  // "product_designer_id" field.
  String? _productDesignerId;
  String get productDesignerId => _productDesignerId ?? '';
  set productDesignerId(String? val) => _productDesignerId = val;

  bool hasProductDesignerId() => _productDesignerId != null;

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  set productRef(DocumentReference? val) => _productRef = val;

  bool hasProductRef() => _productRef != null;

  // "product_stock_info" field.
  ProductStockStruct? _productStockInfo;
  ProductStockStruct get productStockInfo =>
      _productStockInfo ?? ProductStockStruct();
  set productStockInfo(ProductStockStruct? val) => _productStockInfo = val;

  void updateProductStockInfo(Function(ProductStockStruct) updateFn) {
    updateFn(_productStockInfo ??= ProductStockStruct());
  }

  bool hasProductStockInfo() => _productStockInfo != null;

  // "product_inventory_info" field.
  InventoryInfoStruct? _productInventoryInfo;
  InventoryInfoStruct get productInventoryInfo =>
      _productInventoryInfo ?? InventoryInfoStruct();
  set productInventoryInfo(InventoryInfoStruct? val) =>
      _productInventoryInfo = val;

  void updateProductInventoryInfo(Function(InventoryInfoStruct) updateFn) {
    updateFn(_productInventoryInfo ??= InventoryInfoStruct());
  }

  bool hasProductInventoryInfo() => _productInventoryInfo != null;

  // "product_main_type" field.
  String? _productMainType;
  String get productMainType => _productMainType ?? '';
  set productMainType(String? val) => _productMainType = val;

  bool hasProductMainType() => _productMainType != null;

  // "creator_ref" field.
  DocumentReference? _creatorRef;
  DocumentReference? get creatorRef => _creatorRef;
  set creatorRef(DocumentReference? val) => _creatorRef = val;

  bool hasCreatorRef() => _creatorRef != null;

  // "creator_id" field.
  String? _creatorId;
  String get creatorId => _creatorId ?? '';
  set creatorId(String? val) => _creatorId = val;

  bool hasCreatorId() => _creatorId != null;

  // "promotion_id" field.
  String? _promotionId;
  String get promotionId => _promotionId ?? '';
  set promotionId(String? val) => _promotionId = val;

  bool hasPromotionId() => _promotionId != null;

  // "promotion_url" field.
  String? _promotionUrl;
  String get promotionUrl => _promotionUrl ?? '';
  set promotionUrl(String? val) => _promotionUrl = val;

  bool hasPromotionUrl() => _promotionUrl != null;

  // "promotion_commision_rate" field.
  double? _promotionCommisionRate;
  double get promotionCommisionRate => _promotionCommisionRate ?? 0.0;
  set promotionCommisionRate(double? val) => _promotionCommisionRate = val;

  void incrementPromotionCommisionRate(double amount) =>
      promotionCommisionRate = promotionCommisionRate + amount;

  bool hasPromotionCommisionRate() => _promotionCommisionRate != null;

  // "product_user_body_info" field.
  UserBodyStruct? _productUserBodyInfo;
  UserBodyStruct get productUserBodyInfo =>
      _productUserBodyInfo ?? UserBodyStruct();
  set productUserBodyInfo(UserBodyStruct? val) => _productUserBodyInfo = val;

  void updateProductUserBodyInfo(Function(UserBodyStruct) updateFn) {
    updateFn(_productUserBodyInfo ??= UserBodyStruct());
  }

  bool hasProductUserBodyInfo() => _productUserBodyInfo != null;

  // "product_pickup_info" field.
  ProductPickupInfoStruct? _productPickupInfo;
  ProductPickupInfoStruct get productPickupInfo =>
      _productPickupInfo ?? ProductPickupInfoStruct();
  set productPickupInfo(ProductPickupInfoStruct? val) =>
      _productPickupInfo = val;

  void updateProductPickupInfo(Function(ProductPickupInfoStruct) updateFn) {
    updateFn(_productPickupInfo ??= ProductPickupInfoStruct());
  }

  bool hasProductPickupInfo() => _productPickupInfo != null;

  static UserCartItemsStruct fromMap(Map<String, dynamic> data) =>
      UserCartItemsStruct(
        isProceedStatus: data['is_proceed_status'] as bool?,
        proceedBlockReason: data['proceed_block_reason'] as String?,
        cartItemId: castToType<int>(data['cart_item_id']),
        cartItemAttribute: getStructList(
          data['cart_item_attribute'],
          ProductAttributesStruct.fromMap,
        ),
        productType: data['product_type'] as String?,
        productId: data['product_id'] as String?,
        productInfo: data['product_info'] is InfoStruct
            ? data['product_info']
            : InfoStruct.maybeFromMap(data['product_info']),
        quantity: castToType<int>(data['quantity']),
        price: castToType<double>(data['price']),
        totalPrice: castToType<double>(data['total_price']),
        productDesignerRef: data['product_designer_ref'] as DocumentReference?,
        productDesignerId: data['product_designer_id'] as String?,
        productRef: data['product_ref'] as DocumentReference?,
        productStockInfo: data['product_stock_info'] is ProductStockStruct
            ? data['product_stock_info']
            : ProductStockStruct.maybeFromMap(data['product_stock_info']),
        productInventoryInfo: data['product_inventory_info']
                is InventoryInfoStruct
            ? data['product_inventory_info']
            : InventoryInfoStruct.maybeFromMap(data['product_inventory_info']),
        productMainType: data['product_main_type'] as String?,
        creatorRef: data['creator_ref'] as DocumentReference?,
        creatorId: data['creator_id'] as String?,
        promotionId: data['promotion_id'] as String?,
        promotionUrl: data['promotion_url'] as String?,
        promotionCommisionRate:
            castToType<double>(data['promotion_commision_rate']),
        productUserBodyInfo: data['product_user_body_info'] is UserBodyStruct
            ? data['product_user_body_info']
            : UserBodyStruct.maybeFromMap(data['product_user_body_info']),
        productPickupInfo: data['product_pickup_info']
                is ProductPickupInfoStruct
            ? data['product_pickup_info']
            : ProductPickupInfoStruct.maybeFromMap(data['product_pickup_info']),
      );

  static UserCartItemsStruct? maybeFromMap(dynamic data) => data is Map
      ? UserCartItemsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'is_proceed_status': _isProceedStatus,
        'proceed_block_reason': _proceedBlockReason,
        'cart_item_id': _cartItemId,
        'cart_item_attribute':
            _cartItemAttribute?.map((e) => e.toMap()).toList(),
        'product_type': _productType,
        'product_id': _productId,
        'product_info': _productInfo?.toMap(),
        'quantity': _quantity,
        'price': _price,
        'total_price': _totalPrice,
        'product_designer_ref': _productDesignerRef,
        'product_designer_id': _productDesignerId,
        'product_ref': _productRef,
        'product_stock_info': _productStockInfo?.toMap(),
        'product_inventory_info': _productInventoryInfo?.toMap(),
        'product_main_type': _productMainType,
        'creator_ref': _creatorRef,
        'creator_id': _creatorId,
        'promotion_id': _promotionId,
        'promotion_url': _promotionUrl,
        'promotion_commision_rate': _promotionCommisionRate,
        'product_user_body_info': _productUserBodyInfo?.toMap(),
        'product_pickup_info': _productPickupInfo?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'is_proceed_status': serializeParam(
          _isProceedStatus,
          ParamType.bool,
        ),
        'proceed_block_reason': serializeParam(
          _proceedBlockReason,
          ParamType.String,
        ),
        'cart_item_id': serializeParam(
          _cartItemId,
          ParamType.int,
        ),
        'cart_item_attribute': serializeParam(
          _cartItemAttribute,
          ParamType.DataStruct,
          isList: true,
        ),
        'product_type': serializeParam(
          _productType,
          ParamType.String,
        ),
        'product_id': serializeParam(
          _productId,
          ParamType.String,
        ),
        'product_info': serializeParam(
          _productInfo,
          ParamType.DataStruct,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'total_price': serializeParam(
          _totalPrice,
          ParamType.double,
        ),
        'product_designer_ref': serializeParam(
          _productDesignerRef,
          ParamType.DocumentReference,
        ),
        'product_designer_id': serializeParam(
          _productDesignerId,
          ParamType.String,
        ),
        'product_ref': serializeParam(
          _productRef,
          ParamType.DocumentReference,
        ),
        'product_stock_info': serializeParam(
          _productStockInfo,
          ParamType.DataStruct,
        ),
        'product_inventory_info': serializeParam(
          _productInventoryInfo,
          ParamType.DataStruct,
        ),
        'product_main_type': serializeParam(
          _productMainType,
          ParamType.String,
        ),
        'creator_ref': serializeParam(
          _creatorRef,
          ParamType.DocumentReference,
        ),
        'creator_id': serializeParam(
          _creatorId,
          ParamType.String,
        ),
        'promotion_id': serializeParam(
          _promotionId,
          ParamType.String,
        ),
        'promotion_url': serializeParam(
          _promotionUrl,
          ParamType.String,
        ),
        'promotion_commision_rate': serializeParam(
          _promotionCommisionRate,
          ParamType.double,
        ),
        'product_user_body_info': serializeParam(
          _productUserBodyInfo,
          ParamType.DataStruct,
        ),
        'product_pickup_info': serializeParam(
          _productPickupInfo,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static UserCartItemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserCartItemsStruct(
        isProceedStatus: deserializeParam(
          data['is_proceed_status'],
          ParamType.bool,
          false,
        ),
        proceedBlockReason: deserializeParam(
          data['proceed_block_reason'],
          ParamType.String,
          false,
        ),
        cartItemId: deserializeParam(
          data['cart_item_id'],
          ParamType.int,
          false,
        ),
        cartItemAttribute: deserializeStructParam<ProductAttributesStruct>(
          data['cart_item_attribute'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductAttributesStruct.fromSerializableMap,
        ),
        productType: deserializeParam(
          data['product_type'],
          ParamType.String,
          false,
        ),
        productId: deserializeParam(
          data['product_id'],
          ParamType.String,
          false,
        ),
        productInfo: deserializeStructParam(
          data['product_info'],
          ParamType.DataStruct,
          false,
          structBuilder: InfoStruct.fromSerializableMap,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        totalPrice: deserializeParam(
          data['total_price'],
          ParamType.double,
          false,
        ),
        productDesignerRef: deserializeParam(
          data['product_designer_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        productDesignerId: deserializeParam(
          data['product_designer_id'],
          ParamType.String,
          false,
        ),
        productRef: deserializeParam(
          data['product_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['products'],
        ),
        productStockInfo: deserializeStructParam(
          data['product_stock_info'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductStockStruct.fromSerializableMap,
        ),
        productInventoryInfo: deserializeStructParam(
          data['product_inventory_info'],
          ParamType.DataStruct,
          false,
          structBuilder: InventoryInfoStruct.fromSerializableMap,
        ),
        productMainType: deserializeParam(
          data['product_main_type'],
          ParamType.String,
          false,
        ),
        creatorRef: deserializeParam(
          data['creator_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        creatorId: deserializeParam(
          data['creator_id'],
          ParamType.String,
          false,
        ),
        promotionId: deserializeParam(
          data['promotion_id'],
          ParamType.String,
          false,
        ),
        promotionUrl: deserializeParam(
          data['promotion_url'],
          ParamType.String,
          false,
        ),
        promotionCommisionRate: deserializeParam(
          data['promotion_commision_rate'],
          ParamType.double,
          false,
        ),
        productUserBodyInfo: deserializeStructParam(
          data['product_user_body_info'],
          ParamType.DataStruct,
          false,
          structBuilder: UserBodyStruct.fromSerializableMap,
        ),
        productPickupInfo: deserializeStructParam(
          data['product_pickup_info'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductPickupInfoStruct.fromSerializableMap,
        ),
      );

  static UserCartItemsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserCartItemsStruct(
        isProceedStatus: convertAlgoliaParam(
          data['is_proceed_status'],
          ParamType.bool,
          false,
        ),
        proceedBlockReason: convertAlgoliaParam(
          data['proceed_block_reason'],
          ParamType.String,
          false,
        ),
        cartItemId: convertAlgoliaParam(
          data['cart_item_id'],
          ParamType.int,
          false,
        ),
        cartItemAttribute: convertAlgoliaParam<ProductAttributesStruct>(
          data['cart_item_attribute'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductAttributesStruct.fromAlgoliaData,
        ),
        productType: convertAlgoliaParam(
          data['product_type'],
          ParamType.String,
          false,
        ),
        productId: convertAlgoliaParam(
          data['product_id'],
          ParamType.String,
          false,
        ),
        productInfo: convertAlgoliaParam(
          data['product_info'],
          ParamType.DataStruct,
          false,
          structBuilder: InfoStruct.fromAlgoliaData,
        ),
        quantity: convertAlgoliaParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        price: convertAlgoliaParam(
          data['price'],
          ParamType.double,
          false,
        ),
        totalPrice: convertAlgoliaParam(
          data['total_price'],
          ParamType.double,
          false,
        ),
        productDesignerRef: convertAlgoliaParam(
          data['product_designer_ref'],
          ParamType.DocumentReference,
          false,
        ),
        productDesignerId: convertAlgoliaParam(
          data['product_designer_id'],
          ParamType.String,
          false,
        ),
        productRef: convertAlgoliaParam(
          data['product_ref'],
          ParamType.DocumentReference,
          false,
        ),
        productStockInfo: convertAlgoliaParam(
          data['product_stock_info'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductStockStruct.fromAlgoliaData,
        ),
        productInventoryInfo: convertAlgoliaParam(
          data['product_inventory_info'],
          ParamType.DataStruct,
          false,
          structBuilder: InventoryInfoStruct.fromAlgoliaData,
        ),
        productMainType: convertAlgoliaParam(
          data['product_main_type'],
          ParamType.String,
          false,
        ),
        creatorRef: convertAlgoliaParam(
          data['creator_ref'],
          ParamType.DocumentReference,
          false,
        ),
        creatorId: convertAlgoliaParam(
          data['creator_id'],
          ParamType.String,
          false,
        ),
        promotionId: convertAlgoliaParam(
          data['promotion_id'],
          ParamType.String,
          false,
        ),
        promotionUrl: convertAlgoliaParam(
          data['promotion_url'],
          ParamType.String,
          false,
        ),
        promotionCommisionRate: convertAlgoliaParam(
          data['promotion_commision_rate'],
          ParamType.double,
          false,
        ),
        productUserBodyInfo: convertAlgoliaParam(
          data['product_user_body_info'],
          ParamType.DataStruct,
          false,
          structBuilder: UserBodyStruct.fromAlgoliaData,
        ),
        productPickupInfo: convertAlgoliaParam(
          data['product_pickup_info'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductPickupInfoStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserCartItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserCartItemsStruct &&
        isProceedStatus == other.isProceedStatus &&
        proceedBlockReason == other.proceedBlockReason &&
        cartItemId == other.cartItemId &&
        listEquality.equals(cartItemAttribute, other.cartItemAttribute) &&
        productType == other.productType &&
        productId == other.productId &&
        productInfo == other.productInfo &&
        quantity == other.quantity &&
        price == other.price &&
        totalPrice == other.totalPrice &&
        productDesignerRef == other.productDesignerRef &&
        productDesignerId == other.productDesignerId &&
        productRef == other.productRef &&
        productStockInfo == other.productStockInfo &&
        productInventoryInfo == other.productInventoryInfo &&
        productMainType == other.productMainType &&
        creatorRef == other.creatorRef &&
        creatorId == other.creatorId &&
        promotionId == other.promotionId &&
        promotionUrl == other.promotionUrl &&
        promotionCommisionRate == other.promotionCommisionRate &&
        productUserBodyInfo == other.productUserBodyInfo &&
        productPickupInfo == other.productPickupInfo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        isProceedStatus,
        proceedBlockReason,
        cartItemId,
        cartItemAttribute,
        productType,
        productId,
        productInfo,
        quantity,
        price,
        totalPrice,
        productDesignerRef,
        productDesignerId,
        productRef,
        productStockInfo,
        productInventoryInfo,
        productMainType,
        creatorRef,
        creatorId,
        promotionId,
        promotionUrl,
        promotionCommisionRate,
        productUserBodyInfo,
        productPickupInfo
      ]);
}

UserCartItemsStruct createUserCartItemsStruct({
  bool? isProceedStatus,
  String? proceedBlockReason,
  int? cartItemId,
  String? productType,
  String? productId,
  InfoStruct? productInfo,
  int? quantity,
  double? price,
  double? totalPrice,
  DocumentReference? productDesignerRef,
  String? productDesignerId,
  DocumentReference? productRef,
  ProductStockStruct? productStockInfo,
  InventoryInfoStruct? productInventoryInfo,
  String? productMainType,
  DocumentReference? creatorRef,
  String? creatorId,
  String? promotionId,
  String? promotionUrl,
  double? promotionCommisionRate,
  UserBodyStruct? productUserBodyInfo,
  ProductPickupInfoStruct? productPickupInfo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserCartItemsStruct(
      isProceedStatus: isProceedStatus,
      proceedBlockReason: proceedBlockReason,
      cartItemId: cartItemId,
      productType: productType,
      productId: productId,
      productInfo: productInfo ?? (clearUnsetFields ? InfoStruct() : null),
      quantity: quantity,
      price: price,
      totalPrice: totalPrice,
      productDesignerRef: productDesignerRef,
      productDesignerId: productDesignerId,
      productRef: productRef,
      productStockInfo:
          productStockInfo ?? (clearUnsetFields ? ProductStockStruct() : null),
      productInventoryInfo: productInventoryInfo ??
          (clearUnsetFields ? InventoryInfoStruct() : null),
      productMainType: productMainType,
      creatorRef: creatorRef,
      creatorId: creatorId,
      promotionId: promotionId,
      promotionUrl: promotionUrl,
      promotionCommisionRate: promotionCommisionRate,
      productUserBodyInfo:
          productUserBodyInfo ?? (clearUnsetFields ? UserBodyStruct() : null),
      productPickupInfo: productPickupInfo ??
          (clearUnsetFields ? ProductPickupInfoStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserCartItemsStruct? updateUserCartItemsStruct(
  UserCartItemsStruct? userCartItems, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userCartItems
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserCartItemsStructData(
  Map<String, dynamic> firestoreData,
  UserCartItemsStruct? userCartItems,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userCartItems == null) {
    return;
  }
  if (userCartItems.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userCartItems.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userCartItemsData =
      getUserCartItemsFirestoreData(userCartItems, forFieldValue);
  final nestedData =
      userCartItemsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userCartItems.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserCartItemsFirestoreData(
  UserCartItemsStruct? userCartItems, [
  bool forFieldValue = false,
]) {
  if (userCartItems == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userCartItems.toMap());

  // Handle nested data for "product_info" field.
  addInfoStructData(
    firestoreData,
    userCartItems.hasProductInfo() ? userCartItems.productInfo : null,
    'product_info',
    forFieldValue,
  );

  // Handle nested data for "product_stock_info" field.
  addProductStockStructData(
    firestoreData,
    userCartItems.hasProductStockInfo() ? userCartItems.productStockInfo : null,
    'product_stock_info',
    forFieldValue,
  );

  // Handle nested data for "product_inventory_info" field.
  addInventoryInfoStructData(
    firestoreData,
    userCartItems.hasProductInventoryInfo()
        ? userCartItems.productInventoryInfo
        : null,
    'product_inventory_info',
    forFieldValue,
  );

  // Handle nested data for "product_user_body_info" field.
  addUserBodyStructData(
    firestoreData,
    userCartItems.hasProductUserBodyInfo()
        ? userCartItems.productUserBodyInfo
        : null,
    'product_user_body_info',
    forFieldValue,
  );

  // Handle nested data for "product_pickup_info" field.
  addProductPickupInfoStructData(
    firestoreData,
    userCartItems.hasProductPickupInfo()
        ? userCartItems.productPickupInfo
        : null,
    'product_pickup_info',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(userCartItems.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserCartItemsListFirestoreData(
  List<UserCartItemsStruct>? userCartItemss,
) =>
    userCartItemss
        ?.map((e) => getUserCartItemsFirestoreData(e, true))
        .toList() ??
    [];
