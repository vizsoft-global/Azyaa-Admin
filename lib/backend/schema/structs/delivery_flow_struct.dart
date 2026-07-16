// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeliveryFlowStruct extends FFFirebaseStruct {
  DeliveryFlowStruct({
    List<UserCartItemsStruct>? selectedItemss,
    double? totalWeightCm,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _selectedItemss = selectedItemss,
        _totalWeightCm = totalWeightCm,
        super(firestoreUtilData);

  // "selectedItemss" field.
  List<UserCartItemsStruct>? _selectedItemss;
  List<UserCartItemsStruct> get selectedItemss => _selectedItemss ?? const [];
  set selectedItemss(List<UserCartItemsStruct>? val) => _selectedItemss = val;

  void updateSelectedItemss(Function(List<UserCartItemsStruct>) updateFn) {
    updateFn(_selectedItemss ??= []);
  }

  bool hasSelectedItemss() => _selectedItemss != null;

  // "total_weight_cm" field.
  double? _totalWeightCm;
  double get totalWeightCm => _totalWeightCm ?? 0.0;
  set totalWeightCm(double? val) => _totalWeightCm = val;

  void incrementTotalWeightCm(double amount) =>
      totalWeightCm = totalWeightCm + amount;

  bool hasTotalWeightCm() => _totalWeightCm != null;

  static DeliveryFlowStruct fromMap(Map<String, dynamic> data) =>
      DeliveryFlowStruct(
        selectedItemss: getStructList(
          data['selectedItemss'],
          UserCartItemsStruct.fromMap,
        ),
        totalWeightCm: castToType<double>(data['total_weight_cm']),
      );

  static DeliveryFlowStruct? maybeFromMap(dynamic data) => data is Map
      ? DeliveryFlowStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'selectedItemss': _selectedItemss?.map((e) => e.toMap()).toList(),
        'total_weight_cm': _totalWeightCm,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'selectedItemss': serializeParam(
          _selectedItemss,
          ParamType.DataStruct,
          isList: true,
        ),
        'total_weight_cm': serializeParam(
          _totalWeightCm,
          ParamType.double,
        ),
      }.withoutNulls;

  static DeliveryFlowStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeliveryFlowStruct(
        selectedItemss: deserializeStructParam<UserCartItemsStruct>(
          data['selectedItemss'],
          ParamType.DataStruct,
          true,
          structBuilder: UserCartItemsStruct.fromSerializableMap,
        ),
        totalWeightCm: deserializeParam(
          data['total_weight_cm'],
          ParamType.double,
          false,
        ),
      );

  static DeliveryFlowStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DeliveryFlowStruct(
        selectedItemss: convertAlgoliaParam<UserCartItemsStruct>(
          data['selectedItemss'],
          ParamType.DataStruct,
          true,
          structBuilder: UserCartItemsStruct.fromAlgoliaData,
        ),
        totalWeightCm: convertAlgoliaParam(
          data['total_weight_cm'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DeliveryFlowStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DeliveryFlowStruct &&
        listEquality.equals(selectedItemss, other.selectedItemss) &&
        totalWeightCm == other.totalWeightCm;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([selectedItemss, totalWeightCm]);
}

DeliveryFlowStruct createDeliveryFlowStruct({
  double? totalWeightCm,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DeliveryFlowStruct(
      totalWeightCm: totalWeightCm,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DeliveryFlowStruct? updateDeliveryFlowStruct(
  DeliveryFlowStruct? deliveryFlow, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    deliveryFlow
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDeliveryFlowStructData(
  Map<String, dynamic> firestoreData,
  DeliveryFlowStruct? deliveryFlow,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (deliveryFlow == null) {
    return;
  }
  if (deliveryFlow.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && deliveryFlow.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final deliveryFlowData =
      getDeliveryFlowFirestoreData(deliveryFlow, forFieldValue);
  final nestedData =
      deliveryFlowData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = deliveryFlow.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDeliveryFlowFirestoreData(
  DeliveryFlowStruct? deliveryFlow, [
  bool forFieldValue = false,
]) {
  if (deliveryFlow == null) {
    return {};
  }
  final firestoreData = mapToFirestore(deliveryFlow.toMap());

  // Add any Firestore field values
  mapToFirestore(deliveryFlow.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDeliveryFlowListFirestoreData(
  List<DeliveryFlowStruct>? deliveryFlows,
) =>
    deliveryFlows?.map((e) => getDeliveryFlowFirestoreData(e, true)).toList() ??
    [];
