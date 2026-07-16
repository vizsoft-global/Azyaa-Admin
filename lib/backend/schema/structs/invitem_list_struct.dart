// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class InvitemListStruct extends FFFirebaseStruct {
  InvitemListStruct({
    int? quantity,
    String? name,
    String? sku,
    String? skuNumber,
    String? description,
    double? weight,
    String? weightUnit,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _quantity = quantity,
        _name = name,
        _sku = sku,
        _skuNumber = skuNumber,
        _description = description,
        _weight = weight,
        _weightUnit = weightUnit,
        super(firestoreUtilData);

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "name" field.
  String? _name;
  String get name => _name ?? ' ';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "sku" field.
  String? _sku;
  String get sku => _sku ?? ' ';
  set sku(String? val) => _sku = val;

  bool hasSku() => _sku != null;

  // "skuNumber" field.
  String? _skuNumber;
  String get skuNumber => _skuNumber ?? ' ';
  set skuNumber(String? val) => _skuNumber = val;

  bool hasSkuNumber() => _skuNumber != null;

  // "description" field.
  String? _description;
  String get description => _description ?? ' ';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 1.0;
  set weight(double? val) => _weight = val;

  void incrementWeight(double amount) => weight = weight + amount;

  bool hasWeight() => _weight != null;

  // "weightUnit" field.
  String? _weightUnit;
  String get weightUnit => _weightUnit ?? 'gm';
  set weightUnit(String? val) => _weightUnit = val;

  bool hasWeightUnit() => _weightUnit != null;

  static InvitemListStruct fromMap(Map<String, dynamic> data) =>
      InvitemListStruct(
        quantity: castToType<int>(data['quantity']),
        name: data['name'] as String?,
        sku: data['sku'] as String?,
        skuNumber: data['skuNumber'] as String?,
        description: data['description'] as String?,
        weight: castToType<double>(data['weight']),
        weightUnit: data['weightUnit'] as String?,
      );

  static InvitemListStruct? maybeFromMap(dynamic data) => data is Map
      ? InvitemListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'quantity': _quantity,
        'name': _name,
        'sku': _sku,
        'skuNumber': _skuNumber,
        'description': _description,
        'weight': _weight,
        'weightUnit': _weightUnit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'sku': serializeParam(
          _sku,
          ParamType.String,
        ),
        'skuNumber': serializeParam(
          _skuNumber,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.double,
        ),
        'weightUnit': serializeParam(
          _weightUnit,
          ParamType.String,
        ),
      }.withoutNulls;

  static InvitemListStruct fromSerializableMap(Map<String, dynamic> data) =>
      InvitemListStruct(
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        sku: deserializeParam(
          data['sku'],
          ParamType.String,
          false,
        ),
        skuNumber: deserializeParam(
          data['skuNumber'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        weightUnit: deserializeParam(
          data['weightUnit'],
          ParamType.String,
          false,
        ),
      );

  static InvitemListStruct fromAlgoliaData(Map<String, dynamic> data) =>
      InvitemListStruct(
        quantity: convertAlgoliaParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        sku: convertAlgoliaParam(
          data['sku'],
          ParamType.String,
          false,
        ),
        skuNumber: convertAlgoliaParam(
          data['skuNumber'],
          ParamType.String,
          false,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        weight: convertAlgoliaParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        weightUnit: convertAlgoliaParam(
          data['weightUnit'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'InvitemListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InvitemListStruct &&
        quantity == other.quantity &&
        name == other.name &&
        sku == other.sku &&
        skuNumber == other.skuNumber &&
        description == other.description &&
        weight == other.weight &&
        weightUnit == other.weightUnit;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([quantity, name, sku, skuNumber, description, weight, weightUnit]);
}

InvitemListStruct createInvitemListStruct({
  int? quantity,
  String? name,
  String? sku,
  String? skuNumber,
  String? description,
  double? weight,
  String? weightUnit,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InvitemListStruct(
      quantity: quantity,
      name: name,
      sku: sku,
      skuNumber: skuNumber,
      description: description,
      weight: weight,
      weightUnit: weightUnit,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InvitemListStruct? updateInvitemListStruct(
  InvitemListStruct? invitemList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    invitemList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInvitemListStructData(
  Map<String, dynamic> firestoreData,
  InvitemListStruct? invitemList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (invitemList == null) {
    return;
  }
  if (invitemList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && invitemList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final invitemListData =
      getInvitemListFirestoreData(invitemList, forFieldValue);
  final nestedData =
      invitemListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = invitemList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInvitemListFirestoreData(
  InvitemListStruct? invitemList, [
  bool forFieldValue = false,
]) {
  if (invitemList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(invitemList.toMap());

  // Add any Firestore field values
  mapToFirestore(invitemList.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInvitemListListFirestoreData(
  List<InvitemListStruct>? invitemLists,
) =>
    invitemLists?.map((e) => getInvitemListFirestoreData(e, true)).toList() ??
    [];
