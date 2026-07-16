// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserWishlistShareListStruct extends FFFirebaseStruct {
  UserWishlistShareListStruct({
    int? wishlistId,
    InfoStruct? wishlistInfo,
    bool? isPublic,
    String? shareCode,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<UserWishlistItemStruct>? items,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _wishlistId = wishlistId,
        _wishlistInfo = wishlistInfo,
        _isPublic = isPublic,
        _shareCode = shareCode,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _items = items,
        super(firestoreUtilData);

  // "wishlist_id" field.
  int? _wishlistId;
  int get wishlistId => _wishlistId ?? 0;
  set wishlistId(int? val) => _wishlistId = val;

  void incrementWishlistId(int amount) => wishlistId = wishlistId + amount;

  bool hasWishlistId() => _wishlistId != null;

  // "wishlist_info" field.
  InfoStruct? _wishlistInfo;
  InfoStruct get wishlistInfo => _wishlistInfo ?? InfoStruct();
  set wishlistInfo(InfoStruct? val) => _wishlistInfo = val;

  void updateWishlistInfo(Function(InfoStruct) updateFn) {
    updateFn(_wishlistInfo ??= InfoStruct());
  }

  bool hasWishlistInfo() => _wishlistInfo != null;

  // "is_public" field.
  bool? _isPublic;
  bool get isPublic => _isPublic ?? false;
  set isPublic(bool? val) => _isPublic = val;

  bool hasIsPublic() => _isPublic != null;

  // "share_code" field.
  String? _shareCode;
  String get shareCode => _shareCode ?? '';
  set shareCode(String? val) => _shareCode = val;

  bool hasShareCode() => _shareCode != null;

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

  // "items" field.
  List<UserWishlistItemStruct>? _items;
  List<UserWishlistItemStruct> get items => _items ?? const [];
  set items(List<UserWishlistItemStruct>? val) => _items = val;

  void updateItems(Function(List<UserWishlistItemStruct>) updateFn) {
    updateFn(_items ??= []);
  }

  bool hasItems() => _items != null;

  static UserWishlistShareListStruct fromMap(Map<String, dynamic> data) =>
      UserWishlistShareListStruct(
        wishlistId: castToType<int>(data['wishlist_id']),
        wishlistInfo: data['wishlist_info'] is InfoStruct
            ? data['wishlist_info']
            : InfoStruct.maybeFromMap(data['wishlist_info']),
        isPublic: data['is_public'] as bool?,
        shareCode: data['share_code'] as String?,
        createdAt: data['created_at'] as DateTime?,
        updatedAt: data['updated_at'] as DateTime?,
        items: getStructList(
          data['items'],
          UserWishlistItemStruct.fromMap,
        ),
      );

  static UserWishlistShareListStruct? maybeFromMap(dynamic data) => data is Map
      ? UserWishlistShareListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'wishlist_id': _wishlistId,
        'wishlist_info': _wishlistInfo?.toMap(),
        'is_public': _isPublic,
        'share_code': _shareCode,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'items': _items?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'wishlist_id': serializeParam(
          _wishlistId,
          ParamType.int,
        ),
        'wishlist_info': serializeParam(
          _wishlistInfo,
          ParamType.DataStruct,
        ),
        'is_public': serializeParam(
          _isPublic,
          ParamType.bool,
        ),
        'share_code': serializeParam(
          _shareCode,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static UserWishlistShareListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserWishlistShareListStruct(
        wishlistId: deserializeParam(
          data['wishlist_id'],
          ParamType.int,
          false,
        ),
        wishlistInfo: deserializeStructParam(
          data['wishlist_info'],
          ParamType.DataStruct,
          false,
          structBuilder: InfoStruct.fromSerializableMap,
        ),
        isPublic: deserializeParam(
          data['is_public'],
          ParamType.bool,
          false,
        ),
        shareCode: deserializeParam(
          data['share_code'],
          ParamType.String,
          false,
        ),
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
        items: deserializeStructParam<UserWishlistItemStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: UserWishlistItemStruct.fromSerializableMap,
        ),
      );

  static UserWishlistShareListStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      UserWishlistShareListStruct(
        wishlistId: convertAlgoliaParam(
          data['wishlist_id'],
          ParamType.int,
          false,
        ),
        wishlistInfo: convertAlgoliaParam(
          data['wishlist_info'],
          ParamType.DataStruct,
          false,
          structBuilder: InfoStruct.fromAlgoliaData,
        ),
        isPublic: convertAlgoliaParam(
          data['is_public'],
          ParamType.bool,
          false,
        ),
        shareCode: convertAlgoliaParam(
          data['share_code'],
          ParamType.String,
          false,
        ),
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
        items: convertAlgoliaParam<UserWishlistItemStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: UserWishlistItemStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserWishlistShareListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserWishlistShareListStruct &&
        wishlistId == other.wishlistId &&
        wishlistInfo == other.wishlistInfo &&
        isPublic == other.isPublic &&
        shareCode == other.shareCode &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        listEquality.equals(items, other.items);
  }

  @override
  int get hashCode => const ListEquality().hash([
        wishlistId,
        wishlistInfo,
        isPublic,
        shareCode,
        createdAt,
        updatedAt,
        items
      ]);
}

UserWishlistShareListStruct createUserWishlistShareListStruct({
  int? wishlistId,
  InfoStruct? wishlistInfo,
  bool? isPublic,
  String? shareCode,
  DateTime? createdAt,
  DateTime? updatedAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserWishlistShareListStruct(
      wishlistId: wishlistId,
      wishlistInfo: wishlistInfo ?? (clearUnsetFields ? InfoStruct() : null),
      isPublic: isPublic,
      shareCode: shareCode,
      createdAt: createdAt,
      updatedAt: updatedAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserWishlistShareListStruct? updateUserWishlistShareListStruct(
  UserWishlistShareListStruct? userWishlistShareList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userWishlistShareList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserWishlistShareListStructData(
  Map<String, dynamic> firestoreData,
  UserWishlistShareListStruct? userWishlistShareList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userWishlistShareList == null) {
    return;
  }
  if (userWishlistShareList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      userWishlistShareList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userWishlistShareListData = getUserWishlistShareListFirestoreData(
      userWishlistShareList, forFieldValue);
  final nestedData =
      userWishlistShareListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userWishlistShareList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserWishlistShareListFirestoreData(
  UserWishlistShareListStruct? userWishlistShareList, [
  bool forFieldValue = false,
]) {
  if (userWishlistShareList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userWishlistShareList.toMap());

  // Handle nested data for "wishlist_info" field.
  addInfoStructData(
    firestoreData,
    userWishlistShareList.hasWishlistInfo()
        ? userWishlistShareList.wishlistInfo
        : null,
    'wishlist_info',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(userWishlistShareList.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserWishlistShareListListFirestoreData(
  List<UserWishlistShareListStruct>? userWishlistShareLists,
) =>
    userWishlistShareLists
        ?.map((e) => getUserWishlistShareListFirestoreData(e, true))
        .toList() ??
    [];
