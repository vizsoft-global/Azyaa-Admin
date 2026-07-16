import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "user_role" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  bool hasUserRole() => _userRole != null;

  // "user_info" field.
  UserRelatedInfoStruct? _userInfo;
  UserRelatedInfoStruct get userInfo => _userInfo ?? UserRelatedInfoStruct();
  bool hasUserInfo() => _userInfo != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "user_cart" field.
  UserCartStruct? _userCart;
  UserCartStruct get userCart => _userCart ?? UserCartStruct();
  bool hasUserCart() => _userCart != null;

  // "referral_code" field.
  String? _referralCode;
  String get referralCode => _referralCode ?? '';
  bool hasReferralCode() => _referralCode != null;

  // "points_balance" field.
  int? _pointsBalance;
  int get pointsBalance => _pointsBalance ?? 0;
  bool hasPointsBalance() => _pointsBalance != null;

  // "user_preferences" field.
  UserPreferencesStruct? _userPreferences;
  UserPreferencesStruct get userPreferences =>
      _userPreferences ?? UserPreferencesStruct();
  bool hasUserPreferences() => _userPreferences != null;

  // "designer_requests" field.
  DesignerRequestsStruct? _designerRequests;
  DesignerRequestsStruct get designerRequests =>
      _designerRequests ?? DesignerRequestsStruct();
  bool hasDesignerRequests() => _designerRequests != null;

  // "creator_main_info" field.
  CreatorMainInfoStruct? _creatorMainInfo;
  CreatorMainInfoStruct get creatorMainInfo =>
      _creatorMainInfo ?? CreatorMainInfoStruct();
  bool hasCreatorMainInfo() => _creatorMainInfo != null;

  // "designer_main_info" field.
  DesignerMainInfoStruct? _designerMainInfo;
  DesignerMainInfoStruct get designerMainInfo =>
      _designerMainInfo ?? DesignerMainInfoStruct();
  bool hasDesignerMainInfo() => _designerMainInfo != null;

  // "user_body" field.
  List<UserBodyStruct>? _userBody;
  List<UserBodyStruct> get userBody => _userBody ?? const [];
  bool hasUserBody() => _userBody != null;

  // "user_shippingaddress" field.
  List<UserShippingaddressStruct>? _userShippingaddress;
  List<UserShippingaddressStruct> get userShippingaddress =>
      _userShippingaddress ?? const [];
  bool hasUserShippingaddress() => _userShippingaddress != null;

  // "user_memberships" field.
  UserMembershipsStruct? _userMemberships;
  UserMembershipsStruct get userMemberships =>
      _userMemberships ?? UserMembershipsStruct();
  bool hasUserMemberships() => _userMemberships != null;

  // "creator_requests" field.
  CreatorRequestsStruct? _creatorRequests;
  CreatorRequestsStruct get creatorRequests =>
      _creatorRequests ?? CreatorRequestsStruct();
  bool hasCreatorRequests() => _creatorRequests != null;

  // "user_recent_views" field.
  List<UserRecentViewedListStruct>? _userRecentViews;
  List<UserRecentViewedListStruct> get userRecentViews =>
      _userRecentViews ?? const [];
  bool hasUserRecentViews() => _userRecentViews != null;

  // "user_designer_following" field.
  List<DocumentReference>? _userDesignerFollowing;
  List<DocumentReference> get userDesignerFollowing =>
      _userDesignerFollowing ?? const [];
  bool hasUserDesignerFollowing() => _userDesignerFollowing != null;

  // "user_creator_following" field.
  List<DocumentReference>? _userCreatorFollowing;
  List<DocumentReference> get userCreatorFollowing =>
      _userCreatorFollowing ?? const [];
  bool hasUserCreatorFollowing() => _userCreatorFollowing != null;

  // "user_wishlist_item" field.
  List<UserWishlistItemStruct>? _userWishlistItem;
  List<UserWishlistItemStruct> get userWishlistItem =>
      _userWishlistItem ?? const [];
  bool hasUserWishlistItem() => _userWishlistItem != null;

  // "user_wishlist_share_list" field.
  List<UserWishlistShareListStruct>? _userWishlistShareList;
  List<UserWishlistShareListStruct> get userWishlistShareList =>
      _userWishlistShareList ?? const [];
  bool hasUserWishlistShareList() => _userWishlistShareList != null;

  // "user_vto" field.
  UserVirtualtryonStruct? _userVto;
  UserVirtualtryonStruct get userVto => _userVto ?? UserVirtualtryonStruct();
  bool hasUserVto() => _userVto != null;

  // "role_unique_key" field.
  String? _roleUniqueKey;
  String get roleUniqueKey => _roleUniqueKey ?? '';
  bool hasRoleUniqueKey() => _roleUniqueKey != null;

  // "fcm_token" field.
  String? _fcmToken;
  String get fcmToken => _fcmToken ?? '';
  bool hasFcmToken() => _fcmToken != null;

  // "user_loyalty" field.
  UserLoyaltyStruct? _userLoyalty;
  UserLoyaltyStruct get userLoyalty => _userLoyalty ?? UserLoyaltyStruct();
  bool hasUserLoyalty() => _userLoyalty != null;

  // "user_vto_uploaded_images" field.
  List<String>? _userVtoUploadedImages;
  List<String> get userVtoUploadedImages => _userVtoUploadedImages ?? const [];
  bool hasUserVtoUploadedImages() => _userVtoUploadedImages != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _status = snapshotData['status'] as String?;
    _userRole = snapshotData['user_role'] as String?;
    _userInfo = snapshotData['user_info'] is UserRelatedInfoStruct
        ? snapshotData['user_info']
        : UserRelatedInfoStruct.maybeFromMap(snapshotData['user_info']);
    _userName = snapshotData['user_name'] as String?;
    _userCart = snapshotData['user_cart'] is UserCartStruct
        ? snapshotData['user_cart']
        : UserCartStruct.maybeFromMap(snapshotData['user_cart']);
    _referralCode = snapshotData['referral_code'] as String?;
    _pointsBalance = castToType<int>(snapshotData['points_balance']);
    _userPreferences = snapshotData['user_preferences'] is UserPreferencesStruct
        ? snapshotData['user_preferences']
        : UserPreferencesStruct.maybeFromMap(snapshotData['user_preferences']);
    _designerRequests =
        snapshotData['designer_requests'] is DesignerRequestsStruct
            ? snapshotData['designer_requests']
            : DesignerRequestsStruct.maybeFromMap(
                snapshotData['designer_requests']);
    _creatorMainInfo = snapshotData['creator_main_info']
            is CreatorMainInfoStruct
        ? snapshotData['creator_main_info']
        : CreatorMainInfoStruct.maybeFromMap(snapshotData['creator_main_info']);
    _designerMainInfo =
        snapshotData['designer_main_info'] is DesignerMainInfoStruct
            ? snapshotData['designer_main_info']
            : DesignerMainInfoStruct.maybeFromMap(
                snapshotData['designer_main_info']);
    _userBody = getStructList(
      snapshotData['user_body'],
      UserBodyStruct.fromMap,
    );
    _userShippingaddress = getStructList(
      snapshotData['user_shippingaddress'],
      UserShippingaddressStruct.fromMap,
    );
    _userMemberships = snapshotData['user_memberships'] is UserMembershipsStruct
        ? snapshotData['user_memberships']
        : UserMembershipsStruct.maybeFromMap(snapshotData['user_memberships']);
    _creatorRequests = snapshotData['creator_requests'] is CreatorRequestsStruct
        ? snapshotData['creator_requests']
        : CreatorRequestsStruct.maybeFromMap(snapshotData['creator_requests']);
    _userRecentViews = getStructList(
      snapshotData['user_recent_views'],
      UserRecentViewedListStruct.fromMap,
    );
    _userDesignerFollowing =
        getDataList(snapshotData['user_designer_following']);
    _userCreatorFollowing = getDataList(snapshotData['user_creator_following']);
    _userWishlistItem = getStructList(
      snapshotData['user_wishlist_item'],
      UserWishlistItemStruct.fromMap,
    );
    _userWishlistShareList = getStructList(
      snapshotData['user_wishlist_share_list'],
      UserWishlistShareListStruct.fromMap,
    );
    _userVto = snapshotData['user_vto'] is UserVirtualtryonStruct
        ? snapshotData['user_vto']
        : UserVirtualtryonStruct.maybeFromMap(snapshotData['user_vto']);
    _roleUniqueKey = snapshotData['role_unique_key'] as String?;
    _fcmToken = snapshotData['fcm_token'] as String?;
    _userLoyalty = snapshotData['user_loyalty'] is UserLoyaltyStruct
        ? snapshotData['user_loyalty']
        : UserLoyaltyStruct.maybeFromMap(snapshotData['user_loyalty']);
    _userVtoUploadedImages =
        getDataList(snapshotData['user_vto_uploaded_images']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'phone_number': snapshot.data['phone_number'],
          'status': snapshot.data['status'],
          'user_role': snapshot.data['user_role'],
          'user_info': UserRelatedInfoStruct.fromAlgoliaData(
                  snapshot.data['user_info'] ?? {})
              .toMap(),
          'user_name': snapshot.data['user_name'],
          'user_cart':
              UserCartStruct.fromAlgoliaData(snapshot.data['user_cart'] ?? {})
                  .toMap(),
          'referral_code': snapshot.data['referral_code'],
          'points_balance': convertAlgoliaParam(
            snapshot.data['points_balance'],
            ParamType.int,
            false,
          ),
          'user_preferences': UserPreferencesStruct.fromAlgoliaData(
                  snapshot.data['user_preferences'] ?? {})
              .toMap(),
          'designer_requests': DesignerRequestsStruct.fromAlgoliaData(
                  snapshot.data['designer_requests'] ?? {})
              .toMap(),
          'creator_main_info': CreatorMainInfoStruct.fromAlgoliaData(
                  snapshot.data['creator_main_info'] ?? {})
              .toMap(),
          'designer_main_info': DesignerMainInfoStruct.fromAlgoliaData(
                  snapshot.data['designer_main_info'] ?? {})
              .toMap(),
          'user_body': safeGet(
            () => (snapshot.data['user_body'] as Iterable)
                .map((d) => UserBodyStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'user_shippingaddress': safeGet(
            () => (snapshot.data['user_shippingaddress'] as Iterable)
                .map(
                    (d) => UserShippingaddressStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'user_memberships': UserMembershipsStruct.fromAlgoliaData(
                  snapshot.data['user_memberships'] ?? {})
              .toMap(),
          'creator_requests': CreatorRequestsStruct.fromAlgoliaData(
                  snapshot.data['creator_requests'] ?? {})
              .toMap(),
          'user_recent_views': safeGet(
            () => (snapshot.data['user_recent_views'] as Iterable)
                .map((d) =>
                    UserRecentViewedListStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'user_designer_following': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['user_designer_following'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'user_creator_following': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['user_creator_following'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'user_wishlist_item': safeGet(
            () => (snapshot.data['user_wishlist_item'] as Iterable)
                .map((d) => UserWishlistItemStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'user_wishlist_share_list': safeGet(
            () => (snapshot.data['user_wishlist_share_list'] as Iterable)
                .map((d) =>
                    UserWishlistShareListStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'user_vto': UserVirtualtryonStruct.fromAlgoliaData(
                  snapshot.data['user_vto'] ?? {})
              .toMap(),
          'role_unique_key': snapshot.data['role_unique_key'],
          'fcm_token': snapshot.data['fcm_token'],
          'user_loyalty': UserLoyaltyStruct.fromAlgoliaData(
                  snapshot.data['user_loyalty'] ?? {})
              .toMap(),
          'user_vto_uploaded_images': safeGet(
            () => snapshot.data['user_vto_uploaded_images'].toList(),
          ),
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? status,
  String? userRole,
  UserRelatedInfoStruct? userInfo,
  String? userName,
  UserCartStruct? userCart,
  String? referralCode,
  int? pointsBalance,
  UserPreferencesStruct? userPreferences,
  DesignerRequestsStruct? designerRequests,
  CreatorMainInfoStruct? creatorMainInfo,
  DesignerMainInfoStruct? designerMainInfo,
  UserMembershipsStruct? userMemberships,
  CreatorRequestsStruct? creatorRequests,
  UserVirtualtryonStruct? userVto,
  String? roleUniqueKey,
  String? fcmToken,
  UserLoyaltyStruct? userLoyalty,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'status': status,
      'user_role': userRole,
      'user_info': UserRelatedInfoStruct().toMap(),
      'user_name': userName,
      'user_cart': UserCartStruct().toMap(),
      'referral_code': referralCode,
      'points_balance': pointsBalance,
      'user_preferences': UserPreferencesStruct().toMap(),
      'designer_requests': DesignerRequestsStruct().toMap(),
      'creator_main_info': CreatorMainInfoStruct().toMap(),
      'designer_main_info': DesignerMainInfoStruct().toMap(),
      'user_memberships': UserMembershipsStruct().toMap(),
      'creator_requests': CreatorRequestsStruct().toMap(),
      'user_vto': UserVirtualtryonStruct().toMap(),
      'role_unique_key': roleUniqueKey,
      'fcm_token': fcmToken,
      'user_loyalty': UserLoyaltyStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "user_info" field.
  addUserRelatedInfoStructData(firestoreData, userInfo, 'user_info');

  // Handle nested data for "user_cart" field.
  addUserCartStructData(firestoreData, userCart, 'user_cart');

  // Handle nested data for "user_preferences" field.
  addUserPreferencesStructData(
      firestoreData, userPreferences, 'user_preferences');

  // Handle nested data for "designer_requests" field.
  addDesignerRequestsStructData(
      firestoreData, designerRequests, 'designer_requests');

  // Handle nested data for "creator_main_info" field.
  addCreatorMainInfoStructData(
      firestoreData, creatorMainInfo, 'creator_main_info');

  // Handle nested data for "designer_main_info" field.
  addDesignerMainInfoStructData(
      firestoreData, designerMainInfo, 'designer_main_info');

  // Handle nested data for "user_memberships" field.
  addUserMembershipsStructData(
      firestoreData, userMemberships, 'user_memberships');

  // Handle nested data for "creator_requests" field.
  addCreatorRequestsStructData(
      firestoreData, creatorRequests, 'creator_requests');

  // Handle nested data for "user_vto" field.
  addUserVirtualtryonStructData(firestoreData, userVto, 'user_vto');

  // Handle nested data for "user_loyalty" field.
  addUserLoyaltyStructData(firestoreData, userLoyalty, 'user_loyalty');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.status == e2?.status &&
        e1?.userRole == e2?.userRole &&
        e1?.userInfo == e2?.userInfo &&
        e1?.userName == e2?.userName &&
        e1?.userCart == e2?.userCart &&
        e1?.referralCode == e2?.referralCode &&
        e1?.pointsBalance == e2?.pointsBalance &&
        e1?.userPreferences == e2?.userPreferences &&
        e1?.designerRequests == e2?.designerRequests &&
        e1?.creatorMainInfo == e2?.creatorMainInfo &&
        e1?.designerMainInfo == e2?.designerMainInfo &&
        listEquality.equals(e1?.userBody, e2?.userBody) &&
        listEquality.equals(e1?.userShippingaddress, e2?.userShippingaddress) &&
        e1?.userMemberships == e2?.userMemberships &&
        e1?.creatorRequests == e2?.creatorRequests &&
        listEquality.equals(e1?.userRecentViews, e2?.userRecentViews) &&
        listEquality.equals(
            e1?.userDesignerFollowing, e2?.userDesignerFollowing) &&
        listEquality.equals(
            e1?.userCreatorFollowing, e2?.userCreatorFollowing) &&
        listEquality.equals(e1?.userWishlistItem, e2?.userWishlistItem) &&
        listEquality.equals(
            e1?.userWishlistShareList, e2?.userWishlistShareList) &&
        e1?.userVto == e2?.userVto &&
        e1?.roleUniqueKey == e2?.roleUniqueKey &&
        e1?.fcmToken == e2?.fcmToken &&
        e1?.userLoyalty == e2?.userLoyalty &&
        listEquality.equals(
            e1?.userVtoUploadedImages, e2?.userVtoUploadedImages);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.status,
        e?.userRole,
        e?.userInfo,
        e?.userName,
        e?.userCart,
        e?.referralCode,
        e?.pointsBalance,
        e?.userPreferences,
        e?.designerRequests,
        e?.creatorMainInfo,
        e?.designerMainInfo,
        e?.userBody,
        e?.userShippingaddress,
        e?.userMemberships,
        e?.creatorRequests,
        e?.userRecentViews,
        e?.userDesignerFollowing,
        e?.userCreatorFollowing,
        e?.userWishlistItem,
        e?.userWishlistShareList,
        e?.userVto,
        e?.roleUniqueKey,
        e?.fcmToken,
        e?.userLoyalty,
        e?.userVtoUploadedImages
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
