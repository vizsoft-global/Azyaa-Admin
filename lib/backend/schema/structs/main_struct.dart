// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MainStruct extends FFFirebaseStruct {
  MainStruct({
    String? mainName,
    String? mainImage,
    String? mainDescription,
    String? mainShortDescription,
    List<String>? mainImageGallery,
    String? mainVideoId,
    DocumentReference? mainVideoRef,
    bool? mainVideoStatus,
    String? mainFileUrl,
    bool? mainFileStatus,
    MainTranslateInfoStruct? mainRoundTranslate,
    MainTranslateInfoStruct? mainRoundTranslateManual,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mainName = mainName,
        _mainImage = mainImage,
        _mainDescription = mainDescription,
        _mainShortDescription = mainShortDescription,
        _mainImageGallery = mainImageGallery,
        _mainVideoId = mainVideoId,
        _mainVideoRef = mainVideoRef,
        _mainVideoStatus = mainVideoStatus,
        _mainFileUrl = mainFileUrl,
        _mainFileStatus = mainFileStatus,
        _mainRoundTranslate = mainRoundTranslate,
        _mainRoundTranslateManual = mainRoundTranslateManual,
        super(firestoreUtilData);

  // "main_name" field.
  String? _mainName;
  String get mainName => _mainName ?? '';
  set mainName(String? val) => _mainName = val;

  bool hasMainName() => _mainName != null;

  // "main_image" field.
  String? _mainImage;
  String get mainImage => _mainImage ?? '';
  set mainImage(String? val) => _mainImage = val;

  bool hasMainImage() => _mainImage != null;

  // "main_description" field.
  String? _mainDescription;
  String get mainDescription => _mainDescription ?? '';
  set mainDescription(String? val) => _mainDescription = val;

  bool hasMainDescription() => _mainDescription != null;

  // "main_short_description" field.
  String? _mainShortDescription;
  String get mainShortDescription => _mainShortDescription ?? '';
  set mainShortDescription(String? val) => _mainShortDescription = val;

  bool hasMainShortDescription() => _mainShortDescription != null;

  // "main_image_gallery" field.
  List<String>? _mainImageGallery;
  List<String> get mainImageGallery => _mainImageGallery ?? const [];
  set mainImageGallery(List<String>? val) => _mainImageGallery = val;

  void updateMainImageGallery(Function(List<String>) updateFn) {
    updateFn(_mainImageGallery ??= []);
  }

  bool hasMainImageGallery() => _mainImageGallery != null;

  // "main_video_id" field.
  String? _mainVideoId;
  String get mainVideoId => _mainVideoId ?? '';
  set mainVideoId(String? val) => _mainVideoId = val;

  bool hasMainVideoId() => _mainVideoId != null;

  // "main_video_ref" field.
  DocumentReference? _mainVideoRef;
  DocumentReference? get mainVideoRef => _mainVideoRef;
  set mainVideoRef(DocumentReference? val) => _mainVideoRef = val;

  bool hasMainVideoRef() => _mainVideoRef != null;

  // "main_video_status" field.
  bool? _mainVideoStatus;
  bool get mainVideoStatus => _mainVideoStatus ?? false;
  set mainVideoStatus(bool? val) => _mainVideoStatus = val;

  bool hasMainVideoStatus() => _mainVideoStatus != null;

  // "main_file_url" field.
  String? _mainFileUrl;
  String get mainFileUrl => _mainFileUrl ?? '';
  set mainFileUrl(String? val) => _mainFileUrl = val;

  bool hasMainFileUrl() => _mainFileUrl != null;

  // "main_file_status" field.
  bool? _mainFileStatus;
  bool get mainFileStatus => _mainFileStatus ?? false;
  set mainFileStatus(bool? val) => _mainFileStatus = val;

  bool hasMainFileStatus() => _mainFileStatus != null;

  // "main_round_translate" field.
  MainTranslateInfoStruct? _mainRoundTranslate;
  MainTranslateInfoStruct get mainRoundTranslate =>
      _mainRoundTranslate ?? MainTranslateInfoStruct();
  set mainRoundTranslate(MainTranslateInfoStruct? val) =>
      _mainRoundTranslate = val;

  void updateMainRoundTranslate(Function(MainTranslateInfoStruct) updateFn) {
    updateFn(_mainRoundTranslate ??= MainTranslateInfoStruct());
  }

  bool hasMainRoundTranslate() => _mainRoundTranslate != null;

  // "main_round_translate_manual" field.
  MainTranslateInfoStruct? _mainRoundTranslateManual;
  MainTranslateInfoStruct get mainRoundTranslateManual =>
      _mainRoundTranslateManual ?? MainTranslateInfoStruct();
  set mainRoundTranslateManual(MainTranslateInfoStruct? val) =>
      _mainRoundTranslateManual = val;

  void updateMainRoundTranslateManual(
      Function(MainTranslateInfoStruct) updateFn) {
    updateFn(_mainRoundTranslateManual ??= MainTranslateInfoStruct());
  }

  bool hasMainRoundTranslateManual() => _mainRoundTranslateManual != null;

  static MainStruct fromMap(Map<String, dynamic> data) => MainStruct(
        mainName: data['main_name'] as String?,
        mainImage: data['main_image'] as String?,
        mainDescription: data['main_description'] as String?,
        mainShortDescription: data['main_short_description'] as String?,
        mainImageGallery: getDataList(data['main_image_gallery']),
        mainVideoId: data['main_video_id'] as String?,
        mainVideoRef: data['main_video_ref'] as DocumentReference?,
        mainVideoStatus: data['main_video_status'] as bool?,
        mainFileUrl: data['main_file_url'] as String?,
        mainFileStatus: data['main_file_status'] as bool?,
        mainRoundTranslate:
            data['main_round_translate'] is MainTranslateInfoStruct
                ? data['main_round_translate']
                : MainTranslateInfoStruct.maybeFromMap(
                    data['main_round_translate']),
        mainRoundTranslateManual:
            data['main_round_translate_manual'] is MainTranslateInfoStruct
                ? data['main_round_translate_manual']
                : MainTranslateInfoStruct.maybeFromMap(
                    data['main_round_translate_manual']),
      );

  static MainStruct? maybeFromMap(dynamic data) =>
      data is Map ? MainStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'main_name': _mainName,
        'main_image': _mainImage,
        'main_description': _mainDescription,
        'main_short_description': _mainShortDescription,
        'main_image_gallery': _mainImageGallery,
        'main_video_id': _mainVideoId,
        'main_video_ref': _mainVideoRef,
        'main_video_status': _mainVideoStatus,
        'main_file_url': _mainFileUrl,
        'main_file_status': _mainFileStatus,
        'main_round_translate': _mainRoundTranslate?.toMap(),
        'main_round_translate_manual': _mainRoundTranslateManual?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'main_name': serializeParam(
          _mainName,
          ParamType.String,
        ),
        'main_image': serializeParam(
          _mainImage,
          ParamType.String,
        ),
        'main_description': serializeParam(
          _mainDescription,
          ParamType.String,
        ),
        'main_short_description': serializeParam(
          _mainShortDescription,
          ParamType.String,
        ),
        'main_image_gallery': serializeParam(
          _mainImageGallery,
          ParamType.String,
          isList: true,
        ),
        'main_video_id': serializeParam(
          _mainVideoId,
          ParamType.String,
        ),
        'main_video_ref': serializeParam(
          _mainVideoRef,
          ParamType.DocumentReference,
        ),
        'main_video_status': serializeParam(
          _mainVideoStatus,
          ParamType.bool,
        ),
        'main_file_url': serializeParam(
          _mainFileUrl,
          ParamType.String,
        ),
        'main_file_status': serializeParam(
          _mainFileStatus,
          ParamType.bool,
        ),
        'main_round_translate': serializeParam(
          _mainRoundTranslate,
          ParamType.DataStruct,
        ),
        'main_round_translate_manual': serializeParam(
          _mainRoundTranslateManual,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static MainStruct fromSerializableMap(Map<String, dynamic> data) =>
      MainStruct(
        mainName: deserializeParam(
          data['main_name'],
          ParamType.String,
          false,
        ),
        mainImage: deserializeParam(
          data['main_image'],
          ParamType.String,
          false,
        ),
        mainDescription: deserializeParam(
          data['main_description'],
          ParamType.String,
          false,
        ),
        mainShortDescription: deserializeParam(
          data['main_short_description'],
          ParamType.String,
          false,
        ),
        mainImageGallery: deserializeParam<String>(
          data['main_image_gallery'],
          ParamType.String,
          true,
        ),
        mainVideoId: deserializeParam(
          data['main_video_id'],
          ParamType.String,
          false,
        ),
        mainVideoRef: deserializeParam(
          data['main_video_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['videos'],
        ),
        mainVideoStatus: deserializeParam(
          data['main_video_status'],
          ParamType.bool,
          false,
        ),
        mainFileUrl: deserializeParam(
          data['main_file_url'],
          ParamType.String,
          false,
        ),
        mainFileStatus: deserializeParam(
          data['main_file_status'],
          ParamType.bool,
          false,
        ),
        mainRoundTranslate: deserializeStructParam(
          data['main_round_translate'],
          ParamType.DataStruct,
          false,
          structBuilder: MainTranslateInfoStruct.fromSerializableMap,
        ),
        mainRoundTranslateManual: deserializeStructParam(
          data['main_round_translate_manual'],
          ParamType.DataStruct,
          false,
          structBuilder: MainTranslateInfoStruct.fromSerializableMap,
        ),
      );

  static MainStruct fromAlgoliaData(Map<String, dynamic> data) => MainStruct(
        mainName: convertAlgoliaParam(
          data['main_name'],
          ParamType.String,
          false,
        ),
        mainImage: convertAlgoliaParam(
          data['main_image'],
          ParamType.String,
          false,
        ),
        mainDescription: convertAlgoliaParam(
          data['main_description'],
          ParamType.String,
          false,
        ),
        mainShortDescription: convertAlgoliaParam(
          data['main_short_description'],
          ParamType.String,
          false,
        ),
        mainImageGallery: convertAlgoliaParam<String>(
          data['main_image_gallery'],
          ParamType.String,
          true,
        ),
        mainVideoId: convertAlgoliaParam(
          data['main_video_id'],
          ParamType.String,
          false,
        ),
        mainVideoRef: convertAlgoliaParam(
          data['main_video_ref'],
          ParamType.DocumentReference,
          false,
        ),
        mainVideoStatus: convertAlgoliaParam(
          data['main_video_status'],
          ParamType.bool,
          false,
        ),
        mainFileUrl: convertAlgoliaParam(
          data['main_file_url'],
          ParamType.String,
          false,
        ),
        mainFileStatus: convertAlgoliaParam(
          data['main_file_status'],
          ParamType.bool,
          false,
        ),
        mainRoundTranslate: convertAlgoliaParam(
          data['main_round_translate'],
          ParamType.DataStruct,
          false,
          structBuilder: MainTranslateInfoStruct.fromAlgoliaData,
        ),
        mainRoundTranslateManual: convertAlgoliaParam(
          data['main_round_translate_manual'],
          ParamType.DataStruct,
          false,
          structBuilder: MainTranslateInfoStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MainStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MainStruct &&
        mainName == other.mainName &&
        mainImage == other.mainImage &&
        mainDescription == other.mainDescription &&
        mainShortDescription == other.mainShortDescription &&
        listEquality.equals(mainImageGallery, other.mainImageGallery) &&
        mainVideoId == other.mainVideoId &&
        mainVideoRef == other.mainVideoRef &&
        mainVideoStatus == other.mainVideoStatus &&
        mainFileUrl == other.mainFileUrl &&
        mainFileStatus == other.mainFileStatus &&
        mainRoundTranslate == other.mainRoundTranslate &&
        mainRoundTranslateManual == other.mainRoundTranslateManual;
  }

  @override
  int get hashCode => const ListEquality().hash([
        mainName,
        mainImage,
        mainDescription,
        mainShortDescription,
        mainImageGallery,
        mainVideoId,
        mainVideoRef,
        mainVideoStatus,
        mainFileUrl,
        mainFileStatus,
        mainRoundTranslate,
        mainRoundTranslateManual
      ]);
}

MainStruct createMainStruct({
  String? mainName,
  String? mainImage,
  String? mainDescription,
  String? mainShortDescription,
  String? mainVideoId,
  DocumentReference? mainVideoRef,
  bool? mainVideoStatus,
  String? mainFileUrl,
  bool? mainFileStatus,
  MainTranslateInfoStruct? mainRoundTranslate,
  MainTranslateInfoStruct? mainRoundTranslateManual,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MainStruct(
      mainName: mainName,
      mainImage: mainImage,
      mainDescription: mainDescription,
      mainShortDescription: mainShortDescription,
      mainVideoId: mainVideoId,
      mainVideoRef: mainVideoRef,
      mainVideoStatus: mainVideoStatus,
      mainFileUrl: mainFileUrl,
      mainFileStatus: mainFileStatus,
      mainRoundTranslate: mainRoundTranslate ??
          (clearUnsetFields ? MainTranslateInfoStruct() : null),
      mainRoundTranslateManual: mainRoundTranslateManual ??
          (clearUnsetFields ? MainTranslateInfoStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MainStruct? updateMainStruct(
  MainStruct? main, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    main
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMainStructData(
  Map<String, dynamic> firestoreData,
  MainStruct? main,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (main == null) {
    return;
  }
  if (main.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && main.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mainData = getMainFirestoreData(main, forFieldValue);
  final nestedData = mainData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = main.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMainFirestoreData(
  MainStruct? main, [
  bool forFieldValue = false,
]) {
  if (main == null) {
    return {};
  }
  final firestoreData = mapToFirestore(main.toMap());

  // Handle nested data for "main_round_translate" field.
  addMainTranslateInfoStructData(
    firestoreData,
    main.hasMainRoundTranslate() ? main.mainRoundTranslate : null,
    'main_round_translate',
    forFieldValue,
  );

  // Handle nested data for "main_round_translate_manual" field.
  addMainTranslateInfoStructData(
    firestoreData,
    main.hasMainRoundTranslateManual() ? main.mainRoundTranslateManual : null,
    'main_round_translate_manual',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(main.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMainListFirestoreData(
  List<MainStruct>? mains,
) =>
    mains?.map((e) => getMainFirestoreData(e, true)).toList() ?? [];
