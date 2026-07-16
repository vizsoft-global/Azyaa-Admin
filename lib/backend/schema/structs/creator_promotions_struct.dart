// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreatorPromotionsStruct extends FFFirebaseStruct {
  CreatorPromotionsStruct({
    DateTime? promotionCreatedAt,
    String? promotionStatus,
    String? promotionId,
    String? promotionType,
    String? promotionCaption,
    String? promotionDescription,
    String? promotionUrl,
    String? promotionCode,
    InfoStruct? promotionInfo,
    List<String>? promotionImages,
    List<String>? promotionVideos,
    List<InfoStruct>? productDetails,
    List<DocumentReference>? productDocReference,
    int? promotionSales,
    double? promotionEarnings,
    double? promotionWithdrawals,
    DocumentReference? promotionApprovedBy,
    DateTime? promotionStartDate,
    DateTime? promotionEndDate,
    DocumentReference? promotionUserRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _promotionCreatedAt = promotionCreatedAt,
        _promotionStatus = promotionStatus,
        _promotionId = promotionId,
        _promotionType = promotionType,
        _promotionCaption = promotionCaption,
        _promotionDescription = promotionDescription,
        _promotionUrl = promotionUrl,
        _promotionCode = promotionCode,
        _promotionInfo = promotionInfo,
        _promotionImages = promotionImages,
        _promotionVideos = promotionVideos,
        _productDetails = productDetails,
        _productDocReference = productDocReference,
        _promotionSales = promotionSales,
        _promotionEarnings = promotionEarnings,
        _promotionWithdrawals = promotionWithdrawals,
        _promotionApprovedBy = promotionApprovedBy,
        _promotionStartDate = promotionStartDate,
        _promotionEndDate = promotionEndDate,
        _promotionUserRef = promotionUserRef,
        super(firestoreUtilData);

  // "promotion_created_at" field.
  DateTime? _promotionCreatedAt;
  DateTime? get promotionCreatedAt => _promotionCreatedAt;
  set promotionCreatedAt(DateTime? val) => _promotionCreatedAt = val;

  bool hasPromotionCreatedAt() => _promotionCreatedAt != null;

  // "promotion_status" field.
  String? _promotionStatus;
  String get promotionStatus => _promotionStatus ?? '';
  set promotionStatus(String? val) => _promotionStatus = val;

  bool hasPromotionStatus() => _promotionStatus != null;

  // "promotion_id" field.
  String? _promotionId;
  String get promotionId => _promotionId ?? '';
  set promotionId(String? val) => _promotionId = val;

  bool hasPromotionId() => _promotionId != null;

  // "promotion_type" field.
  String? _promotionType;
  String get promotionType => _promotionType ?? '';
  set promotionType(String? val) => _promotionType = val;

  bool hasPromotionType() => _promotionType != null;

  // "promotion_caption" field.
  String? _promotionCaption;
  String get promotionCaption => _promotionCaption ?? '';
  set promotionCaption(String? val) => _promotionCaption = val;

  bool hasPromotionCaption() => _promotionCaption != null;

  // "promotion_description" field.
  String? _promotionDescription;
  String get promotionDescription => _promotionDescription ?? '';
  set promotionDescription(String? val) => _promotionDescription = val;

  bool hasPromotionDescription() => _promotionDescription != null;

  // "promotion_url" field.
  String? _promotionUrl;
  String get promotionUrl => _promotionUrl ?? '';
  set promotionUrl(String? val) => _promotionUrl = val;

  bool hasPromotionUrl() => _promotionUrl != null;

  // "promotion_code" field.
  String? _promotionCode;
  String get promotionCode => _promotionCode ?? '';
  set promotionCode(String? val) => _promotionCode = val;

  bool hasPromotionCode() => _promotionCode != null;

  // "promotion_info" field.
  InfoStruct? _promotionInfo;
  InfoStruct get promotionInfo => _promotionInfo ?? InfoStruct();
  set promotionInfo(InfoStruct? val) => _promotionInfo = val;

  void updatePromotionInfo(Function(InfoStruct) updateFn) {
    updateFn(_promotionInfo ??= InfoStruct());
  }

  bool hasPromotionInfo() => _promotionInfo != null;

  // "promotion_images" field.
  List<String>? _promotionImages;
  List<String> get promotionImages => _promotionImages ?? const [];
  set promotionImages(List<String>? val) => _promotionImages = val;

  void updatePromotionImages(Function(List<String>) updateFn) {
    updateFn(_promotionImages ??= []);
  }

  bool hasPromotionImages() => _promotionImages != null;

  // "promotion_videos" field.
  List<String>? _promotionVideos;
  List<String> get promotionVideos => _promotionVideos ?? const [];
  set promotionVideos(List<String>? val) => _promotionVideos = val;

  void updatePromotionVideos(Function(List<String>) updateFn) {
    updateFn(_promotionVideos ??= []);
  }

  bool hasPromotionVideos() => _promotionVideos != null;

  // "product_details" field.
  List<InfoStruct>? _productDetails;
  List<InfoStruct> get productDetails => _productDetails ?? const [];
  set productDetails(List<InfoStruct>? val) => _productDetails = val;

  void updateProductDetails(Function(List<InfoStruct>) updateFn) {
    updateFn(_productDetails ??= []);
  }

  bool hasProductDetails() => _productDetails != null;

  // "product_doc_reference" field.
  List<DocumentReference>? _productDocReference;
  List<DocumentReference> get productDocReference =>
      _productDocReference ?? const [];
  set productDocReference(List<DocumentReference>? val) =>
      _productDocReference = val;

  void updateProductDocReference(Function(List<DocumentReference>) updateFn) {
    updateFn(_productDocReference ??= []);
  }

  bool hasProductDocReference() => _productDocReference != null;

  // "promotion_sales" field.
  int? _promotionSales;
  int get promotionSales => _promotionSales ?? 0;
  set promotionSales(int? val) => _promotionSales = val;

  void incrementPromotionSales(int amount) =>
      promotionSales = promotionSales + amount;

  bool hasPromotionSales() => _promotionSales != null;

  // "promotion_earnings" field.
  double? _promotionEarnings;
  double get promotionEarnings => _promotionEarnings ?? 0.0;
  set promotionEarnings(double? val) => _promotionEarnings = val;

  void incrementPromotionEarnings(double amount) =>
      promotionEarnings = promotionEarnings + amount;

  bool hasPromotionEarnings() => _promotionEarnings != null;

  // "promotion_withdrawals" field.
  double? _promotionWithdrawals;
  double get promotionWithdrawals => _promotionWithdrawals ?? 0.0;
  set promotionWithdrawals(double? val) => _promotionWithdrawals = val;

  void incrementPromotionWithdrawals(double amount) =>
      promotionWithdrawals = promotionWithdrawals + amount;

  bool hasPromotionWithdrawals() => _promotionWithdrawals != null;

  // "promotion_approved_by" field.
  DocumentReference? _promotionApprovedBy;
  DocumentReference? get promotionApprovedBy => _promotionApprovedBy;
  set promotionApprovedBy(DocumentReference? val) => _promotionApprovedBy = val;

  bool hasPromotionApprovedBy() => _promotionApprovedBy != null;

  // "promotion_start_date" field.
  DateTime? _promotionStartDate;
  DateTime? get promotionStartDate => _promotionStartDate;
  set promotionStartDate(DateTime? val) => _promotionStartDate = val;

  bool hasPromotionStartDate() => _promotionStartDate != null;

  // "promotion_end_date" field.
  DateTime? _promotionEndDate;
  DateTime? get promotionEndDate => _promotionEndDate;
  set promotionEndDate(DateTime? val) => _promotionEndDate = val;

  bool hasPromotionEndDate() => _promotionEndDate != null;

  // "promotion_user_ref" field.
  DocumentReference? _promotionUserRef;
  DocumentReference? get promotionUserRef => _promotionUserRef;
  set promotionUserRef(DocumentReference? val) => _promotionUserRef = val;

  bool hasPromotionUserRef() => _promotionUserRef != null;

  static CreatorPromotionsStruct fromMap(Map<String, dynamic> data) =>
      CreatorPromotionsStruct(
        promotionCreatedAt: data['promotion_created_at'] as DateTime?,
        promotionStatus: data['promotion_status'] as String?,
        promotionId: data['promotion_id'] as String?,
        promotionType: data['promotion_type'] as String?,
        promotionCaption: data['promotion_caption'] as String?,
        promotionDescription: data['promotion_description'] as String?,
        promotionUrl: data['promotion_url'] as String?,
        promotionCode: data['promotion_code'] as String?,
        promotionInfo: data['promotion_info'] is InfoStruct
            ? data['promotion_info']
            : InfoStruct.maybeFromMap(data['promotion_info']),
        promotionImages: getDataList(data['promotion_images']),
        promotionVideos: getDataList(data['promotion_videos']),
        productDetails: getStructList(
          data['product_details'],
          InfoStruct.fromMap,
        ),
        productDocReference: getDataList(data['product_doc_reference']),
        promotionSales: castToType<int>(data['promotion_sales']),
        promotionEarnings: castToType<double>(data['promotion_earnings']),
        promotionWithdrawals: castToType<double>(data['promotion_withdrawals']),
        promotionApprovedBy:
            data['promotion_approved_by'] as DocumentReference?,
        promotionStartDate: data['promotion_start_date'] as DateTime?,
        promotionEndDate: data['promotion_end_date'] as DateTime?,
        promotionUserRef: data['promotion_user_ref'] as DocumentReference?,
      );

  static CreatorPromotionsStruct? maybeFromMap(dynamic data) => data is Map
      ? CreatorPromotionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'promotion_created_at': _promotionCreatedAt,
        'promotion_status': _promotionStatus,
        'promotion_id': _promotionId,
        'promotion_type': _promotionType,
        'promotion_caption': _promotionCaption,
        'promotion_description': _promotionDescription,
        'promotion_url': _promotionUrl,
        'promotion_code': _promotionCode,
        'promotion_info': _promotionInfo?.toMap(),
        'promotion_images': _promotionImages,
        'promotion_videos': _promotionVideos,
        'product_details': _productDetails?.map((e) => e.toMap()).toList(),
        'product_doc_reference': _productDocReference,
        'promotion_sales': _promotionSales,
        'promotion_earnings': _promotionEarnings,
        'promotion_withdrawals': _promotionWithdrawals,
        'promotion_approved_by': _promotionApprovedBy,
        'promotion_start_date': _promotionStartDate,
        'promotion_end_date': _promotionEndDate,
        'promotion_user_ref': _promotionUserRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'promotion_created_at': serializeParam(
          _promotionCreatedAt,
          ParamType.DateTime,
        ),
        'promotion_status': serializeParam(
          _promotionStatus,
          ParamType.String,
        ),
        'promotion_id': serializeParam(
          _promotionId,
          ParamType.String,
        ),
        'promotion_type': serializeParam(
          _promotionType,
          ParamType.String,
        ),
        'promotion_caption': serializeParam(
          _promotionCaption,
          ParamType.String,
        ),
        'promotion_description': serializeParam(
          _promotionDescription,
          ParamType.String,
        ),
        'promotion_url': serializeParam(
          _promotionUrl,
          ParamType.String,
        ),
        'promotion_code': serializeParam(
          _promotionCode,
          ParamType.String,
        ),
        'promotion_info': serializeParam(
          _promotionInfo,
          ParamType.DataStruct,
        ),
        'promotion_images': serializeParam(
          _promotionImages,
          ParamType.String,
          isList: true,
        ),
        'promotion_videos': serializeParam(
          _promotionVideos,
          ParamType.String,
          isList: true,
        ),
        'product_details': serializeParam(
          _productDetails,
          ParamType.DataStruct,
          isList: true,
        ),
        'product_doc_reference': serializeParam(
          _productDocReference,
          ParamType.DocumentReference,
          isList: true,
        ),
        'promotion_sales': serializeParam(
          _promotionSales,
          ParamType.int,
        ),
        'promotion_earnings': serializeParam(
          _promotionEarnings,
          ParamType.double,
        ),
        'promotion_withdrawals': serializeParam(
          _promotionWithdrawals,
          ParamType.double,
        ),
        'promotion_approved_by': serializeParam(
          _promotionApprovedBy,
          ParamType.DocumentReference,
        ),
        'promotion_start_date': serializeParam(
          _promotionStartDate,
          ParamType.DateTime,
        ),
        'promotion_end_date': serializeParam(
          _promotionEndDate,
          ParamType.DateTime,
        ),
        'promotion_user_ref': serializeParam(
          _promotionUserRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CreatorPromotionsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CreatorPromotionsStruct(
        promotionCreatedAt: deserializeParam(
          data['promotion_created_at'],
          ParamType.DateTime,
          false,
        ),
        promotionStatus: deserializeParam(
          data['promotion_status'],
          ParamType.String,
          false,
        ),
        promotionId: deserializeParam(
          data['promotion_id'],
          ParamType.String,
          false,
        ),
        promotionType: deserializeParam(
          data['promotion_type'],
          ParamType.String,
          false,
        ),
        promotionCaption: deserializeParam(
          data['promotion_caption'],
          ParamType.String,
          false,
        ),
        promotionDescription: deserializeParam(
          data['promotion_description'],
          ParamType.String,
          false,
        ),
        promotionUrl: deserializeParam(
          data['promotion_url'],
          ParamType.String,
          false,
        ),
        promotionCode: deserializeParam(
          data['promotion_code'],
          ParamType.String,
          false,
        ),
        promotionInfo: deserializeStructParam(
          data['promotion_info'],
          ParamType.DataStruct,
          false,
          structBuilder: InfoStruct.fromSerializableMap,
        ),
        promotionImages: deserializeParam<String>(
          data['promotion_images'],
          ParamType.String,
          true,
        ),
        promotionVideos: deserializeParam<String>(
          data['promotion_videos'],
          ParamType.String,
          true,
        ),
        productDetails: deserializeStructParam<InfoStruct>(
          data['product_details'],
          ParamType.DataStruct,
          true,
          structBuilder: InfoStruct.fromSerializableMap,
        ),
        productDocReference: deserializeParam<DocumentReference>(
          data['product_doc_reference'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['products'],
        ),
        promotionSales: deserializeParam(
          data['promotion_sales'],
          ParamType.int,
          false,
        ),
        promotionEarnings: deserializeParam(
          data['promotion_earnings'],
          ParamType.double,
          false,
        ),
        promotionWithdrawals: deserializeParam(
          data['promotion_withdrawals'],
          ParamType.double,
          false,
        ),
        promotionApprovedBy: deserializeParam(
          data['promotion_approved_by'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        promotionStartDate: deserializeParam(
          data['promotion_start_date'],
          ParamType.DateTime,
          false,
        ),
        promotionEndDate: deserializeParam(
          data['promotion_end_date'],
          ParamType.DateTime,
          false,
        ),
        promotionUserRef: deserializeParam(
          data['promotion_user_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  static CreatorPromotionsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CreatorPromotionsStruct(
        promotionCreatedAt: convertAlgoliaParam(
          data['promotion_created_at'],
          ParamType.DateTime,
          false,
        ),
        promotionStatus: convertAlgoliaParam(
          data['promotion_status'],
          ParamType.String,
          false,
        ),
        promotionId: convertAlgoliaParam(
          data['promotion_id'],
          ParamType.String,
          false,
        ),
        promotionType: convertAlgoliaParam(
          data['promotion_type'],
          ParamType.String,
          false,
        ),
        promotionCaption: convertAlgoliaParam(
          data['promotion_caption'],
          ParamType.String,
          false,
        ),
        promotionDescription: convertAlgoliaParam(
          data['promotion_description'],
          ParamType.String,
          false,
        ),
        promotionUrl: convertAlgoliaParam(
          data['promotion_url'],
          ParamType.String,
          false,
        ),
        promotionCode: convertAlgoliaParam(
          data['promotion_code'],
          ParamType.String,
          false,
        ),
        promotionInfo: convertAlgoliaParam(
          data['promotion_info'],
          ParamType.DataStruct,
          false,
          structBuilder: InfoStruct.fromAlgoliaData,
        ),
        promotionImages: convertAlgoliaParam<String>(
          data['promotion_images'],
          ParamType.String,
          true,
        ),
        promotionVideos: convertAlgoliaParam<String>(
          data['promotion_videos'],
          ParamType.String,
          true,
        ),
        productDetails: convertAlgoliaParam<InfoStruct>(
          data['product_details'],
          ParamType.DataStruct,
          true,
          structBuilder: InfoStruct.fromAlgoliaData,
        ),
        productDocReference: convertAlgoliaParam<DocumentReference>(
          data['product_doc_reference'],
          ParamType.DocumentReference,
          true,
        ),
        promotionSales: convertAlgoliaParam(
          data['promotion_sales'],
          ParamType.int,
          false,
        ),
        promotionEarnings: convertAlgoliaParam(
          data['promotion_earnings'],
          ParamType.double,
          false,
        ),
        promotionWithdrawals: convertAlgoliaParam(
          data['promotion_withdrawals'],
          ParamType.double,
          false,
        ),
        promotionApprovedBy: convertAlgoliaParam(
          data['promotion_approved_by'],
          ParamType.DocumentReference,
          false,
        ),
        promotionStartDate: convertAlgoliaParam(
          data['promotion_start_date'],
          ParamType.DateTime,
          false,
        ),
        promotionEndDate: convertAlgoliaParam(
          data['promotion_end_date'],
          ParamType.DateTime,
          false,
        ),
        promotionUserRef: convertAlgoliaParam(
          data['promotion_user_ref'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CreatorPromotionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CreatorPromotionsStruct &&
        promotionCreatedAt == other.promotionCreatedAt &&
        promotionStatus == other.promotionStatus &&
        promotionId == other.promotionId &&
        promotionType == other.promotionType &&
        promotionCaption == other.promotionCaption &&
        promotionDescription == other.promotionDescription &&
        promotionUrl == other.promotionUrl &&
        promotionCode == other.promotionCode &&
        promotionInfo == other.promotionInfo &&
        listEquality.equals(promotionImages, other.promotionImages) &&
        listEquality.equals(promotionVideos, other.promotionVideos) &&
        listEquality.equals(productDetails, other.productDetails) &&
        listEquality.equals(productDocReference, other.productDocReference) &&
        promotionSales == other.promotionSales &&
        promotionEarnings == other.promotionEarnings &&
        promotionWithdrawals == other.promotionWithdrawals &&
        promotionApprovedBy == other.promotionApprovedBy &&
        promotionStartDate == other.promotionStartDate &&
        promotionEndDate == other.promotionEndDate &&
        promotionUserRef == other.promotionUserRef;
  }

  @override
  int get hashCode => const ListEquality().hash([
        promotionCreatedAt,
        promotionStatus,
        promotionId,
        promotionType,
        promotionCaption,
        promotionDescription,
        promotionUrl,
        promotionCode,
        promotionInfo,
        promotionImages,
        promotionVideos,
        productDetails,
        productDocReference,
        promotionSales,
        promotionEarnings,
        promotionWithdrawals,
        promotionApprovedBy,
        promotionStartDate,
        promotionEndDate,
        promotionUserRef
      ]);
}

CreatorPromotionsStruct createCreatorPromotionsStruct({
  DateTime? promotionCreatedAt,
  String? promotionStatus,
  String? promotionId,
  String? promotionType,
  String? promotionCaption,
  String? promotionDescription,
  String? promotionUrl,
  String? promotionCode,
  InfoStruct? promotionInfo,
  int? promotionSales,
  double? promotionEarnings,
  double? promotionWithdrawals,
  DocumentReference? promotionApprovedBy,
  DateTime? promotionStartDate,
  DateTime? promotionEndDate,
  DocumentReference? promotionUserRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CreatorPromotionsStruct(
      promotionCreatedAt: promotionCreatedAt,
      promotionStatus: promotionStatus,
      promotionId: promotionId,
      promotionType: promotionType,
      promotionCaption: promotionCaption,
      promotionDescription: promotionDescription,
      promotionUrl: promotionUrl,
      promotionCode: promotionCode,
      promotionInfo: promotionInfo ?? (clearUnsetFields ? InfoStruct() : null),
      promotionSales: promotionSales,
      promotionEarnings: promotionEarnings,
      promotionWithdrawals: promotionWithdrawals,
      promotionApprovedBy: promotionApprovedBy,
      promotionStartDate: promotionStartDate,
      promotionEndDate: promotionEndDate,
      promotionUserRef: promotionUserRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CreatorPromotionsStruct? updateCreatorPromotionsStruct(
  CreatorPromotionsStruct? creatorPromotions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    creatorPromotions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCreatorPromotionsStructData(
  Map<String, dynamic> firestoreData,
  CreatorPromotionsStruct? creatorPromotions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (creatorPromotions == null) {
    return;
  }
  if (creatorPromotions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && creatorPromotions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final creatorPromotionsData =
      getCreatorPromotionsFirestoreData(creatorPromotions, forFieldValue);
  final nestedData =
      creatorPromotionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = creatorPromotions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCreatorPromotionsFirestoreData(
  CreatorPromotionsStruct? creatorPromotions, [
  bool forFieldValue = false,
]) {
  if (creatorPromotions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(creatorPromotions.toMap());

  // Handle nested data for "promotion_info" field.
  addInfoStructData(
    firestoreData,
    creatorPromotions.hasPromotionInfo()
        ? creatorPromotions.promotionInfo
        : null,
    'promotion_info',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(creatorPromotions.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCreatorPromotionsListFirestoreData(
  List<CreatorPromotionsStruct>? creatorPromotionss,
) =>
    creatorPromotionss
        ?.map((e) => getCreatorPromotionsFirestoreData(e, true))
        .toList() ??
    [];
