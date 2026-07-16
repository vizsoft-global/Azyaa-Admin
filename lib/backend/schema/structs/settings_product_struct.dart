// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SettingsProductStruct extends FFFirebaseStruct {
  SettingsProductStruct({
    bool? estmaitedShipping,
    bool? procurementCost,
    bool? procurementPrice,
    bool? comparePrice,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _estmaitedShipping = estmaitedShipping,
        _procurementCost = procurementCost,
        _procurementPrice = procurementPrice,
        _comparePrice = comparePrice,
        super(firestoreUtilData);

  // "estmaited_shipping" field.
  bool? _estmaitedShipping;
  bool get estmaitedShipping => _estmaitedShipping ?? false;
  set estmaitedShipping(bool? val) => _estmaitedShipping = val;

  bool hasEstmaitedShipping() => _estmaitedShipping != null;

  // "procurement_cost" field.
  bool? _procurementCost;
  bool get procurementCost => _procurementCost ?? false;
  set procurementCost(bool? val) => _procurementCost = val;

  bool hasProcurementCost() => _procurementCost != null;

  // "procurement_price" field.
  bool? _procurementPrice;
  bool get procurementPrice => _procurementPrice ?? false;
  set procurementPrice(bool? val) => _procurementPrice = val;

  bool hasProcurementPrice() => _procurementPrice != null;

  // "compare_price" field.
  bool? _comparePrice;
  bool get comparePrice => _comparePrice ?? false;
  set comparePrice(bool? val) => _comparePrice = val;

  bool hasComparePrice() => _comparePrice != null;

  static SettingsProductStruct fromMap(Map<String, dynamic> data) =>
      SettingsProductStruct(
        estmaitedShipping: data['estmaited_shipping'] as bool?,
        procurementCost: data['procurement_cost'] as bool?,
        procurementPrice: data['procurement_price'] as bool?,
        comparePrice: data['compare_price'] as bool?,
      );

  static SettingsProductStruct? maybeFromMap(dynamic data) => data is Map
      ? SettingsProductStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'estmaited_shipping': _estmaitedShipping,
        'procurement_cost': _procurementCost,
        'procurement_price': _procurementPrice,
        'compare_price': _comparePrice,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'estmaited_shipping': serializeParam(
          _estmaitedShipping,
          ParamType.bool,
        ),
        'procurement_cost': serializeParam(
          _procurementCost,
          ParamType.bool,
        ),
        'procurement_price': serializeParam(
          _procurementPrice,
          ParamType.bool,
        ),
        'compare_price': serializeParam(
          _comparePrice,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SettingsProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      SettingsProductStruct(
        estmaitedShipping: deserializeParam(
          data['estmaited_shipping'],
          ParamType.bool,
          false,
        ),
        procurementCost: deserializeParam(
          data['procurement_cost'],
          ParamType.bool,
          false,
        ),
        procurementPrice: deserializeParam(
          data['procurement_price'],
          ParamType.bool,
          false,
        ),
        comparePrice: deserializeParam(
          data['compare_price'],
          ParamType.bool,
          false,
        ),
      );

  static SettingsProductStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SettingsProductStruct(
        estmaitedShipping: convertAlgoliaParam(
          data['estmaited_shipping'],
          ParamType.bool,
          false,
        ),
        procurementCost: convertAlgoliaParam(
          data['procurement_cost'],
          ParamType.bool,
          false,
        ),
        procurementPrice: convertAlgoliaParam(
          data['procurement_price'],
          ParamType.bool,
          false,
        ),
        comparePrice: convertAlgoliaParam(
          data['compare_price'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SettingsProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SettingsProductStruct &&
        estmaitedShipping == other.estmaitedShipping &&
        procurementCost == other.procurementCost &&
        procurementPrice == other.procurementPrice &&
        comparePrice == other.comparePrice;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [estmaitedShipping, procurementCost, procurementPrice, comparePrice]);
}

SettingsProductStruct createSettingsProductStruct({
  bool? estmaitedShipping,
  bool? procurementCost,
  bool? procurementPrice,
  bool? comparePrice,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SettingsProductStruct(
      estmaitedShipping: estmaitedShipping,
      procurementCost: procurementCost,
      procurementPrice: procurementPrice,
      comparePrice: comparePrice,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SettingsProductStruct? updateSettingsProductStruct(
  SettingsProductStruct? settingsProduct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    settingsProduct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSettingsProductStructData(
  Map<String, dynamic> firestoreData,
  SettingsProductStruct? settingsProduct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (settingsProduct == null) {
    return;
  }
  if (settingsProduct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && settingsProduct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final settingsProductData =
      getSettingsProductFirestoreData(settingsProduct, forFieldValue);
  final nestedData =
      settingsProductData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = settingsProduct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSettingsProductFirestoreData(
  SettingsProductStruct? settingsProduct, [
  bool forFieldValue = false,
]) {
  if (settingsProduct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(settingsProduct.toMap());

  // Add any Firestore field values
  mapToFirestore(settingsProduct.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSettingsProductListFirestoreData(
  List<SettingsProductStruct>? settingsProducts,
) =>
    settingsProducts
        ?.map((e) => getSettingsProductFirestoreData(e, true))
        .toList() ??
    [];
