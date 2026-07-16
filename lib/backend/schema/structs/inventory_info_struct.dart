// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class InventoryInfoStruct extends FFFirebaseStruct {
  InventoryInfoStruct({
    int? stock,
    int? stockOnHand,
    int? stockReserved,
    int? stockUnavailable,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _stock = stock,
        _stockOnHand = stockOnHand,
        _stockReserved = stockReserved,
        _stockUnavailable = stockUnavailable,
        super(firestoreUtilData);

  // "stock" field.
  int? _stock;
  int get stock => _stock ?? 0;
  set stock(int? val) => _stock = val;

  void incrementStock(int amount) => stock = stock + amount;

  bool hasStock() => _stock != null;

  // "stock_on_hand" field.
  int? _stockOnHand;
  int get stockOnHand => _stockOnHand ?? 0;
  set stockOnHand(int? val) => _stockOnHand = val;

  void incrementStockOnHand(int amount) => stockOnHand = stockOnHand + amount;

  bool hasStockOnHand() => _stockOnHand != null;

  // "stock_reserved" field.
  int? _stockReserved;
  int get stockReserved => _stockReserved ?? 0;
  set stockReserved(int? val) => _stockReserved = val;

  void incrementStockReserved(int amount) =>
      stockReserved = stockReserved + amount;

  bool hasStockReserved() => _stockReserved != null;

  // "stock_unavailable" field.
  int? _stockUnavailable;
  int get stockUnavailable => _stockUnavailable ?? 0;
  set stockUnavailable(int? val) => _stockUnavailable = val;

  void incrementStockUnavailable(int amount) =>
      stockUnavailable = stockUnavailable + amount;

  bool hasStockUnavailable() => _stockUnavailable != null;

  static InventoryInfoStruct fromMap(Map<String, dynamic> data) =>
      InventoryInfoStruct(
        stock: castToType<int>(data['stock']),
        stockOnHand: castToType<int>(data['stock_on_hand']),
        stockReserved: castToType<int>(data['stock_reserved']),
        stockUnavailable: castToType<int>(data['stock_unavailable']),
      );

  static InventoryInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? InventoryInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'stock': _stock,
        'stock_on_hand': _stockOnHand,
        'stock_reserved': _stockReserved,
        'stock_unavailable': _stockUnavailable,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'stock': serializeParam(
          _stock,
          ParamType.int,
        ),
        'stock_on_hand': serializeParam(
          _stockOnHand,
          ParamType.int,
        ),
        'stock_reserved': serializeParam(
          _stockReserved,
          ParamType.int,
        ),
        'stock_unavailable': serializeParam(
          _stockUnavailable,
          ParamType.int,
        ),
      }.withoutNulls;

  static InventoryInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      InventoryInfoStruct(
        stock: deserializeParam(
          data['stock'],
          ParamType.int,
          false,
        ),
        stockOnHand: deserializeParam(
          data['stock_on_hand'],
          ParamType.int,
          false,
        ),
        stockReserved: deserializeParam(
          data['stock_reserved'],
          ParamType.int,
          false,
        ),
        stockUnavailable: deserializeParam(
          data['stock_unavailable'],
          ParamType.int,
          false,
        ),
      );

  static InventoryInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      InventoryInfoStruct(
        stock: convertAlgoliaParam(
          data['stock'],
          ParamType.int,
          false,
        ),
        stockOnHand: convertAlgoliaParam(
          data['stock_on_hand'],
          ParamType.int,
          false,
        ),
        stockReserved: convertAlgoliaParam(
          data['stock_reserved'],
          ParamType.int,
          false,
        ),
        stockUnavailable: convertAlgoliaParam(
          data['stock_unavailable'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'InventoryInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InventoryInfoStruct &&
        stock == other.stock &&
        stockOnHand == other.stockOnHand &&
        stockReserved == other.stockReserved &&
        stockUnavailable == other.stockUnavailable;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([stock, stockOnHand, stockReserved, stockUnavailable]);
}

InventoryInfoStruct createInventoryInfoStruct({
  int? stock,
  int? stockOnHand,
  int? stockReserved,
  int? stockUnavailable,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InventoryInfoStruct(
      stock: stock,
      stockOnHand: stockOnHand,
      stockReserved: stockReserved,
      stockUnavailable: stockUnavailable,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InventoryInfoStruct? updateInventoryInfoStruct(
  InventoryInfoStruct? inventoryInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    inventoryInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInventoryInfoStructData(
  Map<String, dynamic> firestoreData,
  InventoryInfoStruct? inventoryInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (inventoryInfo == null) {
    return;
  }
  if (inventoryInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && inventoryInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final inventoryInfoData =
      getInventoryInfoFirestoreData(inventoryInfo, forFieldValue);
  final nestedData =
      inventoryInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = inventoryInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInventoryInfoFirestoreData(
  InventoryInfoStruct? inventoryInfo, [
  bool forFieldValue = false,
]) {
  if (inventoryInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(inventoryInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(inventoryInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInventoryInfoListFirestoreData(
  List<InventoryInfoStruct>? inventoryInfos,
) =>
    inventoryInfos
        ?.map((e) => getInventoryInfoFirestoreData(e, true))
        .toList() ??
    [];
