// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DesignerSampleDesignsStruct extends FFFirebaseStruct {
  DesignerSampleDesignsStruct({
    String? fileName,
    String? sampleFileUrl,
    String? sampleImageUrl,
    String? fileType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fileName = fileName,
        _sampleFileUrl = sampleFileUrl,
        _sampleImageUrl = sampleImageUrl,
        _fileType = fileType,
        super(firestoreUtilData);

  // "file_name" field.
  String? _fileName;
  String get fileName => _fileName ?? '';
  set fileName(String? val) => _fileName = val;

  bool hasFileName() => _fileName != null;

  // "sample_file_url" field.
  String? _sampleFileUrl;
  String get sampleFileUrl => _sampleFileUrl ?? '';
  set sampleFileUrl(String? val) => _sampleFileUrl = val;

  bool hasSampleFileUrl() => _sampleFileUrl != null;

  // "sample_image_url" field.
  String? _sampleImageUrl;
  String get sampleImageUrl => _sampleImageUrl ?? '';
  set sampleImageUrl(String? val) => _sampleImageUrl = val;

  bool hasSampleImageUrl() => _sampleImageUrl != null;

  // "fileType" field.
  String? _fileType;
  String get fileType => _fileType ?? '';
  set fileType(String? val) => _fileType = val;

  bool hasFileType() => _fileType != null;

  static DesignerSampleDesignsStruct fromMap(Map<String, dynamic> data) =>
      DesignerSampleDesignsStruct(
        fileName: data['file_name'] as String?,
        sampleFileUrl: data['sample_file_url'] as String?,
        sampleImageUrl: data['sample_image_url'] as String?,
        fileType: data['fileType'] as String?,
      );

  static DesignerSampleDesignsStruct? maybeFromMap(dynamic data) => data is Map
      ? DesignerSampleDesignsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'file_name': _fileName,
        'sample_file_url': _sampleFileUrl,
        'sample_image_url': _sampleImageUrl,
        'fileType': _fileType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'file_name': serializeParam(
          _fileName,
          ParamType.String,
        ),
        'sample_file_url': serializeParam(
          _sampleFileUrl,
          ParamType.String,
        ),
        'sample_image_url': serializeParam(
          _sampleImageUrl,
          ParamType.String,
        ),
        'fileType': serializeParam(
          _fileType,
          ParamType.String,
        ),
      }.withoutNulls;

  static DesignerSampleDesignsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DesignerSampleDesignsStruct(
        fileName: deserializeParam(
          data['file_name'],
          ParamType.String,
          false,
        ),
        sampleFileUrl: deserializeParam(
          data['sample_file_url'],
          ParamType.String,
          false,
        ),
        sampleImageUrl: deserializeParam(
          data['sample_image_url'],
          ParamType.String,
          false,
        ),
        fileType: deserializeParam(
          data['fileType'],
          ParamType.String,
          false,
        ),
      );

  static DesignerSampleDesignsStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      DesignerSampleDesignsStruct(
        fileName: convertAlgoliaParam(
          data['file_name'],
          ParamType.String,
          false,
        ),
        sampleFileUrl: convertAlgoliaParam(
          data['sample_file_url'],
          ParamType.String,
          false,
        ),
        sampleImageUrl: convertAlgoliaParam(
          data['sample_image_url'],
          ParamType.String,
          false,
        ),
        fileType: convertAlgoliaParam(
          data['fileType'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DesignerSampleDesignsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DesignerSampleDesignsStruct &&
        fileName == other.fileName &&
        sampleFileUrl == other.sampleFileUrl &&
        sampleImageUrl == other.sampleImageUrl &&
        fileType == other.fileType;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([fileName, sampleFileUrl, sampleImageUrl, fileType]);
}

DesignerSampleDesignsStruct createDesignerSampleDesignsStruct({
  String? fileName,
  String? sampleFileUrl,
  String? sampleImageUrl,
  String? fileType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DesignerSampleDesignsStruct(
      fileName: fileName,
      sampleFileUrl: sampleFileUrl,
      sampleImageUrl: sampleImageUrl,
      fileType: fileType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DesignerSampleDesignsStruct? updateDesignerSampleDesignsStruct(
  DesignerSampleDesignsStruct? designerSampleDesigns, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    designerSampleDesigns
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDesignerSampleDesignsStructData(
  Map<String, dynamic> firestoreData,
  DesignerSampleDesignsStruct? designerSampleDesigns,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (designerSampleDesigns == null) {
    return;
  }
  if (designerSampleDesigns.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      designerSampleDesigns.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final designerSampleDesignsData = getDesignerSampleDesignsFirestoreData(
      designerSampleDesigns, forFieldValue);
  final nestedData =
      designerSampleDesignsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      designerSampleDesigns.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDesignerSampleDesignsFirestoreData(
  DesignerSampleDesignsStruct? designerSampleDesigns, [
  bool forFieldValue = false,
]) {
  if (designerSampleDesigns == null) {
    return {};
  }
  final firestoreData = mapToFirestore(designerSampleDesigns.toMap());

  // Add any Firestore field values
  mapToFirestore(designerSampleDesigns.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDesignerSampleDesignsListFirestoreData(
  List<DesignerSampleDesignsStruct>? designerSampleDesignss,
) =>
    designerSampleDesignss
        ?.map((e) => getDesignerSampleDesignsFirestoreData(e, true))
        .toList() ??
    [];
