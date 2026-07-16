// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserWishlistItemStruct extends FFFirebaseStruct {
  UserWishlistItemStruct({
    String? wishlistItemId,
    String? entityType,
    DateTime? addedAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _wishlistItemId = wishlistItemId,
        _entityType = entityType,
        _addedAt = addedAt,
        super(firestoreUtilData);

  // "wishlist_item_id" field.
  String? _wishlistItemId;
  String get wishlistItemId => _wishlistItemId ?? '';
  set wishlistItemId(String? val) => _wishlistItemId = val;

  bool hasWishlistItemId() => _wishlistItemId != null;

  // "entity_type" field.
  String? _entityType;
  String get entityType => _entityType ?? '';
  set entityType(String? val) => _entityType = val;

  bool hasEntityType() => _entityType != null;

  // "added_at" field.
  DateTime? _addedAt;
  DateTime? get addedAt => _addedAt;
  set addedAt(DateTime? val) => _addedAt = val;

  bool hasAddedAt() => _addedAt != null;

  static UserWishlistItemStruct fromMap(Map<String, dynamic> data) =>
      UserWishlistItemStruct(
        wishlistItemId: data['wishlist_item_id'] as String?,
        entityType: data['entity_type'] as String?,
        addedAt: data['added_at'] as DateTime?,
      );

  static UserWishlistItemStruct? maybeFromMap(dynamic data) => data is Map
      ? UserWishlistItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'wishlist_item_id': _wishlistItemId,
        'entity_type': _entityType,
        'added_at': _addedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'wishlist_item_id': serializeParam(
          _wishlistItemId,
          ParamType.String,
        ),
        'entity_type': serializeParam(
          _entityType,
          ParamType.String,
        ),
        'added_at': serializeParam(
          _addedAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static UserWishlistItemStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserWishlistItemStruct(
        wishlistItemId: deserializeParam(
          data['wishlist_item_id'],
          ParamType.String,
          false,
        ),
        entityType: deserializeParam(
          data['entity_type'],
          ParamType.String,
          false,
        ),
        addedAt: deserializeParam(
          data['added_at'],
          ParamType.DateTime,
          false,
        ),
      );

  static UserWishlistItemStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserWishlistItemStruct(
        wishlistItemId: convertAlgoliaParam(
          data['wishlist_item_id'],
          ParamType.String,
          false,
        ),
        entityType: convertAlgoliaParam(
          data['entity_type'],
          ParamType.String,
          false,
        ),
        addedAt: convertAlgoliaParam(
          data['added_at'],
          ParamType.DateTime,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserWishlistItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserWishlistItemStruct &&
        wishlistItemId == other.wishlistItemId &&
        entityType == other.entityType &&
        addedAt == other.addedAt;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([wishlistItemId, entityType, addedAt]);
}

UserWishlistItemStruct createUserWishlistItemStruct({
  String? wishlistItemId,
  String? entityType,
  DateTime? addedAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserWishlistItemStruct(
      wishlistItemId: wishlistItemId,
      entityType: entityType,
      addedAt: addedAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserWishlistItemStruct? updateUserWishlistItemStruct(
  UserWishlistItemStruct? userWishlistItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userWishlistItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserWishlistItemStructData(
  Map<String, dynamic> firestoreData,
  UserWishlistItemStruct? userWishlistItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userWishlistItem == null) {
    return;
  }
  if (userWishlistItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userWishlistItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userWishlistItemData =
      getUserWishlistItemFirestoreData(userWishlistItem, forFieldValue);
  final nestedData =
      userWishlistItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userWishlistItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserWishlistItemFirestoreData(
  UserWishlistItemStruct? userWishlistItem, [
  bool forFieldValue = false,
]) {
  if (userWishlistItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userWishlistItem.toMap());

  // Add any Firestore field values
  mapToFirestore(userWishlistItem.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserWishlistItemListFirestoreData(
  List<UserWishlistItemStruct>? userWishlistItems,
) =>
    userWishlistItems
        ?.map((e) => getUserWishlistItemFirestoreData(e, true))
        .toList() ??
    [];
