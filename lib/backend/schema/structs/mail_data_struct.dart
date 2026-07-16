// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MailDataStruct extends FFFirebaseStruct {
  MailDataStruct({
    String? name,
    String? email,
    String? supportMail,
    String? supportPhone,
    String? promotionId,
    String? productName,
    String? productId,
    String? affiliatedLink,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _email = email,
        _supportMail = supportMail,
        _supportPhone = supportPhone,
        _promotionId = promotionId,
        _productName = productName,
        _productId = productId,
        _affiliatedLink = affiliatedLink,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "support_mail" field.
  String? _supportMail;
  String get supportMail => _supportMail ?? '';
  set supportMail(String? val) => _supportMail = val;

  bool hasSupportMail() => _supportMail != null;

  // "support_phone" field.
  String? _supportPhone;
  String get supportPhone => _supportPhone ?? '';
  set supportPhone(String? val) => _supportPhone = val;

  bool hasSupportPhone() => _supportPhone != null;

  // "promotion_id" field.
  String? _promotionId;
  String get promotionId => _promotionId ?? '';
  set promotionId(String? val) => _promotionId = val;

  bool hasPromotionId() => _promotionId != null;

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  set productName(String? val) => _productName = val;

  bool hasProductName() => _productName != null;

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;

  bool hasProductId() => _productId != null;

  // "affiliated_link" field.
  String? _affiliatedLink;
  String get affiliatedLink => _affiliatedLink ?? '';
  set affiliatedLink(String? val) => _affiliatedLink = val;

  bool hasAffiliatedLink() => _affiliatedLink != null;

  static MailDataStruct fromMap(Map<String, dynamic> data) => MailDataStruct(
        name: data['name'] as String?,
        email: data['email'] as String?,
        supportMail: data['support_mail'] as String?,
        supportPhone: data['support_phone'] as String?,
        promotionId: data['promotion_id'] as String?,
        productName: data['product_name'] as String?,
        productId: data['product_id'] as String?,
        affiliatedLink: data['affiliated_link'] as String?,
      );

  static MailDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? MailDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'email': _email,
        'support_mail': _supportMail,
        'support_phone': _supportPhone,
        'promotion_id': _promotionId,
        'product_name': _productName,
        'product_id': _productId,
        'affiliated_link': _affiliatedLink,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'support_mail': serializeParam(
          _supportMail,
          ParamType.String,
        ),
        'support_phone': serializeParam(
          _supportPhone,
          ParamType.String,
        ),
        'promotion_id': serializeParam(
          _promotionId,
          ParamType.String,
        ),
        'product_name': serializeParam(
          _productName,
          ParamType.String,
        ),
        'product_id': serializeParam(
          _productId,
          ParamType.String,
        ),
        'affiliated_link': serializeParam(
          _affiliatedLink,
          ParamType.String,
        ),
      }.withoutNulls;

  static MailDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      MailDataStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        supportMail: deserializeParam(
          data['support_mail'],
          ParamType.String,
          false,
        ),
        supportPhone: deserializeParam(
          data['support_phone'],
          ParamType.String,
          false,
        ),
        promotionId: deserializeParam(
          data['promotion_id'],
          ParamType.String,
          false,
        ),
        productName: deserializeParam(
          data['product_name'],
          ParamType.String,
          false,
        ),
        productId: deserializeParam(
          data['product_id'],
          ParamType.String,
          false,
        ),
        affiliatedLink: deserializeParam(
          data['affiliated_link'],
          ParamType.String,
          false,
        ),
      );

  static MailDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      MailDataStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: convertAlgoliaParam(
          data['email'],
          ParamType.String,
          false,
        ),
        supportMail: convertAlgoliaParam(
          data['support_mail'],
          ParamType.String,
          false,
        ),
        supportPhone: convertAlgoliaParam(
          data['support_phone'],
          ParamType.String,
          false,
        ),
        promotionId: convertAlgoliaParam(
          data['promotion_id'],
          ParamType.String,
          false,
        ),
        productName: convertAlgoliaParam(
          data['product_name'],
          ParamType.String,
          false,
        ),
        productId: convertAlgoliaParam(
          data['product_id'],
          ParamType.String,
          false,
        ),
        affiliatedLink: convertAlgoliaParam(
          data['affiliated_link'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MailDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MailDataStruct &&
        name == other.name &&
        email == other.email &&
        supportMail == other.supportMail &&
        supportPhone == other.supportPhone &&
        promotionId == other.promotionId &&
        productName == other.productName &&
        productId == other.productId &&
        affiliatedLink == other.affiliatedLink;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        email,
        supportMail,
        supportPhone,
        promotionId,
        productName,
        productId,
        affiliatedLink
      ]);
}

MailDataStruct createMailDataStruct({
  String? name,
  String? email,
  String? supportMail,
  String? supportPhone,
  String? promotionId,
  String? productName,
  String? productId,
  String? affiliatedLink,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MailDataStruct(
      name: name,
      email: email,
      supportMail: supportMail,
      supportPhone: supportPhone,
      promotionId: promotionId,
      productName: productName,
      productId: productId,
      affiliatedLink: affiliatedLink,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MailDataStruct? updateMailDataStruct(
  MailDataStruct? mailData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mailData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMailDataStructData(
  Map<String, dynamic> firestoreData,
  MailDataStruct? mailData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mailData == null) {
    return;
  }
  if (mailData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && mailData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mailDataData = getMailDataFirestoreData(mailData, forFieldValue);
  final nestedData = mailDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = mailData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMailDataFirestoreData(
  MailDataStruct? mailData, [
  bool forFieldValue = false,
]) {
  if (mailData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mailData.toMap());

  // Add any Firestore field values
  mapToFirestore(mailData.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMailDataListFirestoreData(
  List<MailDataStruct>? mailDatas,
) =>
    mailDatas?.map((e) => getMailDataFirestoreData(e, true)).toList() ?? [];
