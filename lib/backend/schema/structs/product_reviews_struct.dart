// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ProductReviewsStruct extends FFFirebaseStruct {
  ProductReviewsStruct({
    DateTime? createdAt,
    DateTime? updatedAt,
    int? reviewId,
    String? customerId,
    DocumentReference? customerRef,
    String? reviewComments,
    double? reviewRate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdAt = createdAt,
        _updatedAt = updatedAt,
        _reviewId = reviewId,
        _customerId = customerId,
        _customerRef = customerRef,
        _reviewComments = reviewComments,
        _reviewRate = reviewRate,
        super(firestoreUtilData);

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "review_id" field.
  int? _reviewId;
  int get reviewId => _reviewId ?? 0;
  set reviewId(int? val) => _reviewId = val;

  void incrementReviewId(int amount) => reviewId = reviewId + amount;

  bool hasReviewId() => _reviewId != null;

  // "customer_id" field.
  String? _customerId;
  String get customerId => _customerId ?? '';
  set customerId(String? val) => _customerId = val;

  bool hasCustomerId() => _customerId != null;

  // "customer_ref" field.
  DocumentReference? _customerRef;
  DocumentReference? get customerRef => _customerRef;
  set customerRef(DocumentReference? val) => _customerRef = val;

  bool hasCustomerRef() => _customerRef != null;

  // "review_comments" field.
  String? _reviewComments;
  String get reviewComments => _reviewComments ?? '';
  set reviewComments(String? val) => _reviewComments = val;

  bool hasReviewComments() => _reviewComments != null;

  // "review_rate" field.
  double? _reviewRate;
  double get reviewRate => _reviewRate ?? 0.0;
  set reviewRate(double? val) => _reviewRate = val;

  void incrementReviewRate(double amount) => reviewRate = reviewRate + amount;

  bool hasReviewRate() => _reviewRate != null;

  static ProductReviewsStruct fromMap(Map<String, dynamic> data) =>
      ProductReviewsStruct(
        createdAt: data['created_at'] as DateTime?,
        updatedAt: data['updated_at'] as DateTime?,
        reviewId: castToType<int>(data['review_id']),
        customerId: data['customer_id'] as String?,
        customerRef: data['customer_ref'] as DocumentReference?,
        reviewComments: data['review_comments'] as String?,
        reviewRate: castToType<double>(data['review_rate']),
      );

  static ProductReviewsStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductReviewsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'review_id': _reviewId,
        'customer_id': _customerId,
        'customer_ref': _customerRef,
        'review_comments': _reviewComments,
        'review_rate': _reviewRate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'review_id': serializeParam(
          _reviewId,
          ParamType.int,
        ),
        'customer_id': serializeParam(
          _customerId,
          ParamType.String,
        ),
        'customer_ref': serializeParam(
          _customerRef,
          ParamType.DocumentReference,
        ),
        'review_comments': serializeParam(
          _reviewComments,
          ParamType.String,
        ),
        'review_rate': serializeParam(
          _reviewRate,
          ParamType.double,
        ),
      }.withoutNulls;

  static ProductReviewsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductReviewsStruct(
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        reviewId: deserializeParam(
          data['review_id'],
          ParamType.int,
          false,
        ),
        customerId: deserializeParam(
          data['customer_id'],
          ParamType.String,
          false,
        ),
        customerRef: deserializeParam(
          data['customer_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        reviewComments: deserializeParam(
          data['review_comments'],
          ParamType.String,
          false,
        ),
        reviewRate: deserializeParam(
          data['review_rate'],
          ParamType.double,
          false,
        ),
      );

  static ProductReviewsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ProductReviewsStruct(
        createdAt: convertAlgoliaParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: convertAlgoliaParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        reviewId: convertAlgoliaParam(
          data['review_id'],
          ParamType.int,
          false,
        ),
        customerId: convertAlgoliaParam(
          data['customer_id'],
          ParamType.String,
          false,
        ),
        customerRef: convertAlgoliaParam(
          data['customer_ref'],
          ParamType.DocumentReference,
          false,
        ),
        reviewComments: convertAlgoliaParam(
          data['review_comments'],
          ParamType.String,
          false,
        ),
        reviewRate: convertAlgoliaParam(
          data['review_rate'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ProductReviewsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductReviewsStruct &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        reviewId == other.reviewId &&
        customerId == other.customerId &&
        customerRef == other.customerRef &&
        reviewComments == other.reviewComments &&
        reviewRate == other.reviewRate;
  }

  @override
  int get hashCode => const ListEquality().hash([
        createdAt,
        updatedAt,
        reviewId,
        customerId,
        customerRef,
        reviewComments,
        reviewRate
      ]);
}

ProductReviewsStruct createProductReviewsStruct({
  DateTime? createdAt,
  DateTime? updatedAt,
  int? reviewId,
  String? customerId,
  DocumentReference? customerRef,
  String? reviewComments,
  double? reviewRate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductReviewsStruct(
      createdAt: createdAt,
      updatedAt: updatedAt,
      reviewId: reviewId,
      customerId: customerId,
      customerRef: customerRef,
      reviewComments: reviewComments,
      reviewRate: reviewRate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductReviewsStruct? updateProductReviewsStruct(
  ProductReviewsStruct? productReviews, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productReviews
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductReviewsStructData(
  Map<String, dynamic> firestoreData,
  ProductReviewsStruct? productReviews,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productReviews == null) {
    return;
  }
  if (productReviews.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productReviews.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productReviewsData =
      getProductReviewsFirestoreData(productReviews, forFieldValue);
  final nestedData =
      productReviewsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productReviews.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductReviewsFirestoreData(
  ProductReviewsStruct? productReviews, [
  bool forFieldValue = false,
]) {
  if (productReviews == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productReviews.toMap());

  // Add any Firestore field values
  mapToFirestore(productReviews.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductReviewsListFirestoreData(
  List<ProductReviewsStruct>? productReviewss,
) =>
    productReviewss
        ?.map((e) => getProductReviewsFirestoreData(e, true))
        .toList() ??
    [];
