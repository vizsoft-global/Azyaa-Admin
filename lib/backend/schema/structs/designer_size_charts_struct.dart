// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DesignerSizeChartsStruct extends FFFirebaseStruct {
  DesignerSizeChartsStruct({
    int? chartId,
    String? chartName,
    String? chartType,
    String? chartMetrics,
    String? chartImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _chartId = chartId,
        _chartName = chartName,
        _chartType = chartType,
        _chartMetrics = chartMetrics,
        _chartImage = chartImage,
        super(firestoreUtilData);

  // "chart_id" field.
  int? _chartId;
  int get chartId => _chartId ?? 0;
  set chartId(int? val) => _chartId = val;

  void incrementChartId(int amount) => chartId = chartId + amount;

  bool hasChartId() => _chartId != null;

  // "chart_name" field.
  String? _chartName;
  String get chartName => _chartName ?? '';
  set chartName(String? val) => _chartName = val;

  bool hasChartName() => _chartName != null;

  // "chart_type" field.
  String? _chartType;
  String get chartType => _chartType ?? '';
  set chartType(String? val) => _chartType = val;

  bool hasChartType() => _chartType != null;

  // "chart_metrics" field.
  String? _chartMetrics;
  String get chartMetrics => _chartMetrics ?? '';
  set chartMetrics(String? val) => _chartMetrics = val;

  bool hasChartMetrics() => _chartMetrics != null;

  // "chart_image" field.
  String? _chartImage;
  String get chartImage => _chartImage ?? '';
  set chartImage(String? val) => _chartImage = val;

  bool hasChartImage() => _chartImage != null;

  static DesignerSizeChartsStruct fromMap(Map<String, dynamic> data) =>
      DesignerSizeChartsStruct(
        chartId: castToType<int>(data['chart_id']),
        chartName: data['chart_name'] as String?,
        chartType: data['chart_type'] as String?,
        chartMetrics: data['chart_metrics'] as String?,
        chartImage: data['chart_image'] as String?,
      );

  static DesignerSizeChartsStruct? maybeFromMap(dynamic data) => data is Map
      ? DesignerSizeChartsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'chart_id': _chartId,
        'chart_name': _chartName,
        'chart_type': _chartType,
        'chart_metrics': _chartMetrics,
        'chart_image': _chartImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'chart_id': serializeParam(
          _chartId,
          ParamType.int,
        ),
        'chart_name': serializeParam(
          _chartName,
          ParamType.String,
        ),
        'chart_type': serializeParam(
          _chartType,
          ParamType.String,
        ),
        'chart_metrics': serializeParam(
          _chartMetrics,
          ParamType.String,
        ),
        'chart_image': serializeParam(
          _chartImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static DesignerSizeChartsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DesignerSizeChartsStruct(
        chartId: deserializeParam(
          data['chart_id'],
          ParamType.int,
          false,
        ),
        chartName: deserializeParam(
          data['chart_name'],
          ParamType.String,
          false,
        ),
        chartType: deserializeParam(
          data['chart_type'],
          ParamType.String,
          false,
        ),
        chartMetrics: deserializeParam(
          data['chart_metrics'],
          ParamType.String,
          false,
        ),
        chartImage: deserializeParam(
          data['chart_image'],
          ParamType.String,
          false,
        ),
      );

  static DesignerSizeChartsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DesignerSizeChartsStruct(
        chartId: convertAlgoliaParam(
          data['chart_id'],
          ParamType.int,
          false,
        ),
        chartName: convertAlgoliaParam(
          data['chart_name'],
          ParamType.String,
          false,
        ),
        chartType: convertAlgoliaParam(
          data['chart_type'],
          ParamType.String,
          false,
        ),
        chartMetrics: convertAlgoliaParam(
          data['chart_metrics'],
          ParamType.String,
          false,
        ),
        chartImage: convertAlgoliaParam(
          data['chart_image'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DesignerSizeChartsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DesignerSizeChartsStruct &&
        chartId == other.chartId &&
        chartName == other.chartName &&
        chartType == other.chartType &&
        chartMetrics == other.chartMetrics &&
        chartImage == other.chartImage;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([chartId, chartName, chartType, chartMetrics, chartImage]);
}

DesignerSizeChartsStruct createDesignerSizeChartsStruct({
  int? chartId,
  String? chartName,
  String? chartType,
  String? chartMetrics,
  String? chartImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DesignerSizeChartsStruct(
      chartId: chartId,
      chartName: chartName,
      chartType: chartType,
      chartMetrics: chartMetrics,
      chartImage: chartImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DesignerSizeChartsStruct? updateDesignerSizeChartsStruct(
  DesignerSizeChartsStruct? designerSizeCharts, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    designerSizeCharts
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDesignerSizeChartsStructData(
  Map<String, dynamic> firestoreData,
  DesignerSizeChartsStruct? designerSizeCharts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (designerSizeCharts == null) {
    return;
  }
  if (designerSizeCharts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && designerSizeCharts.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final designerSizeChartsData =
      getDesignerSizeChartsFirestoreData(designerSizeCharts, forFieldValue);
  final nestedData =
      designerSizeChartsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      designerSizeCharts.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDesignerSizeChartsFirestoreData(
  DesignerSizeChartsStruct? designerSizeCharts, [
  bool forFieldValue = false,
]) {
  if (designerSizeCharts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(designerSizeCharts.toMap());

  // Add any Firestore field values
  mapToFirestore(designerSizeCharts.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDesignerSizeChartsListFirestoreData(
  List<DesignerSizeChartsStruct>? designerSizeChartss,
) =>
    designerSizeChartss
        ?.map((e) => getDesignerSizeChartsFirestoreData(e, true))
        .toList() ??
    [];
