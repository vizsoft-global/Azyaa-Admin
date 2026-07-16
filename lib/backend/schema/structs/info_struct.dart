// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InfoStruct extends FFFirebaseStruct {
  InfoStruct({
    String? slug,
    String? name,
    String? shortDescription,
    String? description,
    String? iconImage,
    Color? color,
    String? featureImage,
    String? featureImageId,
    List<String>? galleryImage,
    List<String>? galleryImagesIdList,
    String? videoId,
    String? videoUrl,
    String? fileId,
    String? fileUrl,
    String? video360Id,
    String? video360Url,
    TranslateInfoStruct? infoTranslate,
    TranslateInfoStruct? infoCustomTranslate,
    int? serialNo,
    int? sales,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _slug = slug,
        _name = name,
        _shortDescription = shortDescription,
        _description = description,
        _iconImage = iconImage,
        _color = color,
        _featureImage = featureImage,
        _featureImageId = featureImageId,
        _galleryImage = galleryImage,
        _galleryImagesIdList = galleryImagesIdList,
        _videoId = videoId,
        _videoUrl = videoUrl,
        _fileId = fileId,
        _fileUrl = fileUrl,
        _video360Id = video360Id,
        _video360Url = video360Url,
        _infoTranslate = infoTranslate,
        _infoCustomTranslate = infoCustomTranslate,
        _serialNo = serialNo,
        _sales = sales,
        super(firestoreUtilData);

  // "slug" field.
  String? _slug;
  String get slug => _slug ?? '';
  set slug(String? val) => _slug = val;

  bool hasSlug() => _slug != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "short_description" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  set shortDescription(String? val) => _shortDescription = val;

  bool hasShortDescription() => _shortDescription != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "icon_image" field.
  String? _iconImage;
  String get iconImage => _iconImage ?? '';
  set iconImage(String? val) => _iconImage = val;

  bool hasIconImage() => _iconImage != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  // "feature_image" field.
  String? _featureImage;
  String get featureImage => _featureImage ?? '';
  set featureImage(String? val) => _featureImage = val;

  bool hasFeatureImage() => _featureImage != null;

  // "feature_image_id" field.
  String? _featureImageId;
  String get featureImageId => _featureImageId ?? '';
  set featureImageId(String? val) => _featureImageId = val;

  bool hasFeatureImageId() => _featureImageId != null;

  // "gallery_image" field.
  List<String>? _galleryImage;
  List<String> get galleryImage => _galleryImage ?? const [];
  set galleryImage(List<String>? val) => _galleryImage = val;

  void updateGalleryImage(Function(List<String>) updateFn) {
    updateFn(_galleryImage ??= []);
  }

  bool hasGalleryImage() => _galleryImage != null;

  // "gallery_images_id_list" field.
  List<String>? _galleryImagesIdList;
  List<String> get galleryImagesIdList => _galleryImagesIdList ?? const [];
  set galleryImagesIdList(List<String>? val) => _galleryImagesIdList = val;

  void updateGalleryImagesIdList(Function(List<String>) updateFn) {
    updateFn(_galleryImagesIdList ??= []);
  }

  bool hasGalleryImagesIdList() => _galleryImagesIdList != null;

  // "video_id" field.
  String? _videoId;
  String get videoId => _videoId ?? '';
  set videoId(String? val) => _videoId = val;

  bool hasVideoId() => _videoId != null;

  // "video_url" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  set videoUrl(String? val) => _videoUrl = val;

  bool hasVideoUrl() => _videoUrl != null;

  // "file_id" field.
  String? _fileId;
  String get fileId => _fileId ?? '';
  set fileId(String? val) => _fileId = val;

  bool hasFileId() => _fileId != null;

  // "file_url" field.
  String? _fileUrl;
  String get fileUrl => _fileUrl ?? '';
  set fileUrl(String? val) => _fileUrl = val;

  bool hasFileUrl() => _fileUrl != null;

  // "video_360_id" field.
  String? _video360Id;
  String get video360Id => _video360Id ?? '';
  set video360Id(String? val) => _video360Id = val;

  bool hasVideo360Id() => _video360Id != null;

  // "video_360_url" field.
  String? _video360Url;
  String get video360Url => _video360Url ?? '';
  set video360Url(String? val) => _video360Url = val;

  bool hasVideo360Url() => _video360Url != null;

  // "info_translate" field.
  TranslateInfoStruct? _infoTranslate;
  TranslateInfoStruct get infoTranslate =>
      _infoTranslate ?? TranslateInfoStruct();
  set infoTranslate(TranslateInfoStruct? val) => _infoTranslate = val;

  void updateInfoTranslate(Function(TranslateInfoStruct) updateFn) {
    updateFn(_infoTranslate ??= TranslateInfoStruct());
  }

  bool hasInfoTranslate() => _infoTranslate != null;

  // "info_custom_translate" field.
  TranslateInfoStruct? _infoCustomTranslate;
  TranslateInfoStruct get infoCustomTranslate =>
      _infoCustomTranslate ?? TranslateInfoStruct();
  set infoCustomTranslate(TranslateInfoStruct? val) =>
      _infoCustomTranslate = val;

  void updateInfoCustomTranslate(Function(TranslateInfoStruct) updateFn) {
    updateFn(_infoCustomTranslate ??= TranslateInfoStruct());
  }

  bool hasInfoCustomTranslate() => _infoCustomTranslate != null;

  // "serial_no" field.
  int? _serialNo;
  int get serialNo => _serialNo ?? 0;
  set serialNo(int? val) => _serialNo = val;

  void incrementSerialNo(int amount) => serialNo = serialNo + amount;

  bool hasSerialNo() => _serialNo != null;

  // "sales" field.
  int? _sales;
  int get sales => _sales ?? 0;
  set sales(int? val) => _sales = val;

  void incrementSales(int amount) => sales = sales + amount;

  bool hasSales() => _sales != null;

  static InfoStruct fromMap(Map<String, dynamic> data) => InfoStruct(
        slug: data['slug'] as String?,
        name: data['name'] as String?,
        shortDescription: data['short_description'] as String?,
        description: data['description'] as String?,
        iconImage: data['icon_image'] as String?,
        color: getSchemaColor(data['color']),
        featureImage: data['feature_image'] as String?,
        featureImageId: data['feature_image_id'] as String?,
        galleryImage: getDataList(data['gallery_image']),
        galleryImagesIdList: getDataList(data['gallery_images_id_list']),
        videoId: data['video_id'] as String?,
        videoUrl: data['video_url'] as String?,
        fileId: data['file_id'] as String?,
        fileUrl: data['file_url'] as String?,
        video360Id: data['video_360_id'] as String?,
        video360Url: data['video_360_url'] as String?,
        infoTranslate: data['info_translate'] is TranslateInfoStruct
            ? data['info_translate']
            : TranslateInfoStruct.maybeFromMap(data['info_translate']),
        infoCustomTranslate: data['info_custom_translate']
                is TranslateInfoStruct
            ? data['info_custom_translate']
            : TranslateInfoStruct.maybeFromMap(data['info_custom_translate']),
        serialNo: castToType<int>(data['serial_no']),
        sales: castToType<int>(data['sales']),
      );

  static InfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? InfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'slug': _slug,
        'name': _name,
        'short_description': _shortDescription,
        'description': _description,
        'icon_image': _iconImage,
        'color': _color,
        'feature_image': _featureImage,
        'feature_image_id': _featureImageId,
        'gallery_image': _galleryImage,
        'gallery_images_id_list': _galleryImagesIdList,
        'video_id': _videoId,
        'video_url': _videoUrl,
        'file_id': _fileId,
        'file_url': _fileUrl,
        'video_360_id': _video360Id,
        'video_360_url': _video360Url,
        'info_translate': _infoTranslate?.toMap(),
        'info_custom_translate': _infoCustomTranslate?.toMap(),
        'serial_no': _serialNo,
        'sales': _sales,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'slug': serializeParam(
          _slug,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'short_description': serializeParam(
          _shortDescription,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'icon_image': serializeParam(
          _iconImage,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'feature_image': serializeParam(
          _featureImage,
          ParamType.String,
        ),
        'feature_image_id': serializeParam(
          _featureImageId,
          ParamType.String,
        ),
        'gallery_image': serializeParam(
          _galleryImage,
          ParamType.String,
          isList: true,
        ),
        'gallery_images_id_list': serializeParam(
          _galleryImagesIdList,
          ParamType.String,
          isList: true,
        ),
        'video_id': serializeParam(
          _videoId,
          ParamType.String,
        ),
        'video_url': serializeParam(
          _videoUrl,
          ParamType.String,
        ),
        'file_id': serializeParam(
          _fileId,
          ParamType.String,
        ),
        'file_url': serializeParam(
          _fileUrl,
          ParamType.String,
        ),
        'video_360_id': serializeParam(
          _video360Id,
          ParamType.String,
        ),
        'video_360_url': serializeParam(
          _video360Url,
          ParamType.String,
        ),
        'info_translate': serializeParam(
          _infoTranslate,
          ParamType.DataStruct,
        ),
        'info_custom_translate': serializeParam(
          _infoCustomTranslate,
          ParamType.DataStruct,
        ),
        'serial_no': serializeParam(
          _serialNo,
          ParamType.int,
        ),
        'sales': serializeParam(
          _sales,
          ParamType.int,
        ),
      }.withoutNulls;

  static InfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      InfoStruct(
        slug: deserializeParam(
          data['slug'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        shortDescription: deserializeParam(
          data['short_description'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        iconImage: deserializeParam(
          data['icon_image'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        featureImage: deserializeParam(
          data['feature_image'],
          ParamType.String,
          false,
        ),
        featureImageId: deserializeParam(
          data['feature_image_id'],
          ParamType.String,
          false,
        ),
        galleryImage: deserializeParam<String>(
          data['gallery_image'],
          ParamType.String,
          true,
        ),
        galleryImagesIdList: deserializeParam<String>(
          data['gallery_images_id_list'],
          ParamType.String,
          true,
        ),
        videoId: deserializeParam(
          data['video_id'],
          ParamType.String,
          false,
        ),
        videoUrl: deserializeParam(
          data['video_url'],
          ParamType.String,
          false,
        ),
        fileId: deserializeParam(
          data['file_id'],
          ParamType.String,
          false,
        ),
        fileUrl: deserializeParam(
          data['file_url'],
          ParamType.String,
          false,
        ),
        video360Id: deserializeParam(
          data['video_360_id'],
          ParamType.String,
          false,
        ),
        video360Url: deserializeParam(
          data['video_360_url'],
          ParamType.String,
          false,
        ),
        infoTranslate: deserializeStructParam(
          data['info_translate'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateInfoStruct.fromSerializableMap,
        ),
        infoCustomTranslate: deserializeStructParam(
          data['info_custom_translate'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateInfoStruct.fromSerializableMap,
        ),
        serialNo: deserializeParam(
          data['serial_no'],
          ParamType.int,
          false,
        ),
        sales: deserializeParam(
          data['sales'],
          ParamType.int,
          false,
        ),
      );

  static InfoStruct fromAlgoliaData(Map<String, dynamic> data) => InfoStruct(
        slug: convertAlgoliaParam(
          data['slug'],
          ParamType.String,
          false,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        shortDescription: convertAlgoliaParam(
          data['short_description'],
          ParamType.String,
          false,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        iconImage: convertAlgoliaParam(
          data['icon_image'],
          ParamType.String,
          false,
        ),
        color: convertAlgoliaParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        featureImage: convertAlgoliaParam(
          data['feature_image'],
          ParamType.String,
          false,
        ),
        featureImageId: convertAlgoliaParam(
          data['feature_image_id'],
          ParamType.String,
          false,
        ),
        galleryImage: convertAlgoliaParam<String>(
          data['gallery_image'],
          ParamType.String,
          true,
        ),
        galleryImagesIdList: convertAlgoliaParam<String>(
          data['gallery_images_id_list'],
          ParamType.String,
          true,
        ),
        videoId: convertAlgoliaParam(
          data['video_id'],
          ParamType.String,
          false,
        ),
        videoUrl: convertAlgoliaParam(
          data['video_url'],
          ParamType.String,
          false,
        ),
        fileId: convertAlgoliaParam(
          data['file_id'],
          ParamType.String,
          false,
        ),
        fileUrl: convertAlgoliaParam(
          data['file_url'],
          ParamType.String,
          false,
        ),
        video360Id: convertAlgoliaParam(
          data['video_360_id'],
          ParamType.String,
          false,
        ),
        video360Url: convertAlgoliaParam(
          data['video_360_url'],
          ParamType.String,
          false,
        ),
        infoTranslate: convertAlgoliaParam(
          data['info_translate'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateInfoStruct.fromAlgoliaData,
        ),
        infoCustomTranslate: convertAlgoliaParam(
          data['info_custom_translate'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateInfoStruct.fromAlgoliaData,
        ),
        serialNo: convertAlgoliaParam(
          data['serial_no'],
          ParamType.int,
          false,
        ),
        sales: convertAlgoliaParam(
          data['sales'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'InfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is InfoStruct &&
        slug == other.slug &&
        name == other.name &&
        shortDescription == other.shortDescription &&
        description == other.description &&
        iconImage == other.iconImage &&
        color == other.color &&
        featureImage == other.featureImage &&
        featureImageId == other.featureImageId &&
        listEquality.equals(galleryImage, other.galleryImage) &&
        listEquality.equals(galleryImagesIdList, other.galleryImagesIdList) &&
        videoId == other.videoId &&
        videoUrl == other.videoUrl &&
        fileId == other.fileId &&
        fileUrl == other.fileUrl &&
        video360Id == other.video360Id &&
        video360Url == other.video360Url &&
        infoTranslate == other.infoTranslate &&
        infoCustomTranslate == other.infoCustomTranslate &&
        serialNo == other.serialNo &&
        sales == other.sales;
  }

  @override
  int get hashCode => const ListEquality().hash([
        slug,
        name,
        shortDescription,
        description,
        iconImage,
        color,
        featureImage,
        featureImageId,
        galleryImage,
        galleryImagesIdList,
        videoId,
        videoUrl,
        fileId,
        fileUrl,
        video360Id,
        video360Url,
        infoTranslate,
        infoCustomTranslate,
        serialNo,
        sales
      ]);
}

InfoStruct createInfoStruct({
  String? slug,
  String? name,
  String? shortDescription,
  String? description,
  String? iconImage,
  Color? color,
  String? featureImage,
  String? featureImageId,
  String? videoId,
  String? videoUrl,
  String? fileId,
  String? fileUrl,
  String? video360Id,
  String? video360Url,
  TranslateInfoStruct? infoTranslate,
  TranslateInfoStruct? infoCustomTranslate,
  int? serialNo,
  int? sales,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InfoStruct(
      slug: slug,
      name: name,
      shortDescription: shortDescription,
      description: description,
      iconImage: iconImage,
      color: color,
      featureImage: featureImage,
      featureImageId: featureImageId,
      videoId: videoId,
      videoUrl: videoUrl,
      fileId: fileId,
      fileUrl: fileUrl,
      video360Id: video360Id,
      video360Url: video360Url,
      infoTranslate:
          infoTranslate ?? (clearUnsetFields ? TranslateInfoStruct() : null),
      infoCustomTranslate: infoCustomTranslate ??
          (clearUnsetFields ? TranslateInfoStruct() : null),
      serialNo: serialNo,
      sales: sales,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InfoStruct? updateInfoStruct(
  InfoStruct? info, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    info
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInfoStructData(
  Map<String, dynamic> firestoreData,
  InfoStruct? info,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (info == null) {
    return;
  }
  if (info.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && info.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final infoData = getInfoFirestoreData(info, forFieldValue);
  final nestedData = infoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = info.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInfoFirestoreData(
  InfoStruct? info, [
  bool forFieldValue = false,
]) {
  if (info == null) {
    return {};
  }
  final firestoreData = mapToFirestore(info.toMap());

  // Handle nested data for "info_translate" field.
  addTranslateInfoStructData(
    firestoreData,
    info.hasInfoTranslate() ? info.infoTranslate : null,
    'info_translate',
    forFieldValue,
  );

  // Handle nested data for "info_custom_translate" field.
  addTranslateInfoStructData(
    firestoreData,
    info.hasInfoCustomTranslate() ? info.infoCustomTranslate : null,
    'info_custom_translate',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(info.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInfoListFirestoreData(
  List<InfoStruct>? infos,
) =>
    infos?.map((e) => getInfoFirestoreData(e, true)).toList() ?? [];
