// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserMembershipPlanFeatureStruct extends FFFirebaseStruct {
  UserMembershipPlanFeatureStruct({
    bool? accessToProducts,
    bool? discounts,
    bool? freeShipping,
    bool? premiumSupport,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _accessToProducts = accessToProducts,
        _discounts = discounts,
        _freeShipping = freeShipping,
        _premiumSupport = premiumSupport,
        super(firestoreUtilData);

  // "access_to_products" field.
  bool? _accessToProducts;
  bool get accessToProducts => _accessToProducts ?? false;
  set accessToProducts(bool? val) => _accessToProducts = val;

  bool hasAccessToProducts() => _accessToProducts != null;

  // "discounts" field.
  bool? _discounts;
  bool get discounts => _discounts ?? false;
  set discounts(bool? val) => _discounts = val;

  bool hasDiscounts() => _discounts != null;

  // "free_shipping" field.
  bool? _freeShipping;
  bool get freeShipping => _freeShipping ?? false;
  set freeShipping(bool? val) => _freeShipping = val;

  bool hasFreeShipping() => _freeShipping != null;

  // "premium_support" field.
  bool? _premiumSupport;
  bool get premiumSupport => _premiumSupport ?? false;
  set premiumSupport(bool? val) => _premiumSupport = val;

  bool hasPremiumSupport() => _premiumSupport != null;

  static UserMembershipPlanFeatureStruct fromMap(Map<String, dynamic> data) =>
      UserMembershipPlanFeatureStruct(
        accessToProducts: data['access_to_products'] as bool?,
        discounts: data['discounts'] as bool?,
        freeShipping: data['free_shipping'] as bool?,
        premiumSupport: data['premium_support'] as bool?,
      );

  static UserMembershipPlanFeatureStruct? maybeFromMap(dynamic data) => data
          is Map
      ? UserMembershipPlanFeatureStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'access_to_products': _accessToProducts,
        'discounts': _discounts,
        'free_shipping': _freeShipping,
        'premium_support': _premiumSupport,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'access_to_products': serializeParam(
          _accessToProducts,
          ParamType.bool,
        ),
        'discounts': serializeParam(
          _discounts,
          ParamType.bool,
        ),
        'free_shipping': serializeParam(
          _freeShipping,
          ParamType.bool,
        ),
        'premium_support': serializeParam(
          _premiumSupport,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserMembershipPlanFeatureStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserMembershipPlanFeatureStruct(
        accessToProducts: deserializeParam(
          data['access_to_products'],
          ParamType.bool,
          false,
        ),
        discounts: deserializeParam(
          data['discounts'],
          ParamType.bool,
          false,
        ),
        freeShipping: deserializeParam(
          data['free_shipping'],
          ParamType.bool,
          false,
        ),
        premiumSupport: deserializeParam(
          data['premium_support'],
          ParamType.bool,
          false,
        ),
      );

  static UserMembershipPlanFeatureStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      UserMembershipPlanFeatureStruct(
        accessToProducts: convertAlgoliaParam(
          data['access_to_products'],
          ParamType.bool,
          false,
        ),
        discounts: convertAlgoliaParam(
          data['discounts'],
          ParamType.bool,
          false,
        ),
        freeShipping: convertAlgoliaParam(
          data['free_shipping'],
          ParamType.bool,
          false,
        ),
        premiumSupport: convertAlgoliaParam(
          data['premium_support'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserMembershipPlanFeatureStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserMembershipPlanFeatureStruct &&
        accessToProducts == other.accessToProducts &&
        discounts == other.discounts &&
        freeShipping == other.freeShipping &&
        premiumSupport == other.premiumSupport;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([accessToProducts, discounts, freeShipping, premiumSupport]);
}

UserMembershipPlanFeatureStruct createUserMembershipPlanFeatureStruct({
  bool? accessToProducts,
  bool? discounts,
  bool? freeShipping,
  bool? premiumSupport,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserMembershipPlanFeatureStruct(
      accessToProducts: accessToProducts,
      discounts: discounts,
      freeShipping: freeShipping,
      premiumSupport: premiumSupport,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserMembershipPlanFeatureStruct? updateUserMembershipPlanFeatureStruct(
  UserMembershipPlanFeatureStruct? userMembershipPlanFeature, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userMembershipPlanFeature
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserMembershipPlanFeatureStructData(
  Map<String, dynamic> firestoreData,
  UserMembershipPlanFeatureStruct? userMembershipPlanFeature,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userMembershipPlanFeature == null) {
    return;
  }
  if (userMembershipPlanFeature.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      userMembershipPlanFeature.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userMembershipPlanFeatureData =
      getUserMembershipPlanFeatureFirestoreData(
          userMembershipPlanFeature, forFieldValue);
  final nestedData =
      userMembershipPlanFeatureData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userMembershipPlanFeature.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserMembershipPlanFeatureFirestoreData(
  UserMembershipPlanFeatureStruct? userMembershipPlanFeature, [
  bool forFieldValue = false,
]) {
  if (userMembershipPlanFeature == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userMembershipPlanFeature.toMap());

  // Add any Firestore field values
  mapToFirestore(userMembershipPlanFeature.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserMembershipPlanFeatureListFirestoreData(
  List<UserMembershipPlanFeatureStruct>? userMembershipPlanFeatures,
) =>
    userMembershipPlanFeatures
        ?.map((e) => getUserMembershipPlanFeatureFirestoreData(e, true))
        .toList() ??
    [];
