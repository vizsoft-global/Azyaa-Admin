// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FormListStruct extends FFFirebaseStruct {
  FormListStruct({
    int? formId,
    String? status,
    DateTime? uploadedAt,
    String? documentName,
    String? documentUrl,
    String? name,
    String? email,
    String? phone,
    String? bio,
    String? brandPhoto,
    String? alternativeEmail,
    String? alternativePhone,
    List<String>? contentCategory,
    double? experienceInYears,
    double? engagementRate,
    String? preferredPromotionStyle,
    String? portfolioLink,
    String? instagramProfile,
    String? tiktokHandle,
    String? youtubeChannel,
    String? otherProfile,
    String? productionCapabilities,
    String? location,
    String? testimonials,
    bool? customOrders,
    bool? eventCollabrations,
    List<String>? contentCategoryList,
    String? facebookProfile,
    String? instagramProfileFollowers,
    String? facebookProfileFollowers,
    String? tiktokProfileFollowers,
    String? youtubeProfileFollowers,
    List<String>? brandGallery,
    bool? storeAvailable,
    bool? brandCollaboration,
    String? selfie,
    String? alternativeCountry,
    String? alternativeCountryFlag,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _formId = formId,
        _status = status,
        _uploadedAt = uploadedAt,
        _documentName = documentName,
        _documentUrl = documentUrl,
        _name = name,
        _email = email,
        _phone = phone,
        _bio = bio,
        _brandPhoto = brandPhoto,
        _alternativeEmail = alternativeEmail,
        _alternativePhone = alternativePhone,
        _contentCategory = contentCategory,
        _experienceInYears = experienceInYears,
        _engagementRate = engagementRate,
        _preferredPromotionStyle = preferredPromotionStyle,
        _portfolioLink = portfolioLink,
        _instagramProfile = instagramProfile,
        _tiktokHandle = tiktokHandle,
        _youtubeChannel = youtubeChannel,
        _otherProfile = otherProfile,
        _productionCapabilities = productionCapabilities,
        _location = location,
        _testimonials = testimonials,
        _customOrders = customOrders,
        _eventCollabrations = eventCollabrations,
        _contentCategoryList = contentCategoryList,
        _facebookProfile = facebookProfile,
        _instagramProfileFollowers = instagramProfileFollowers,
        _facebookProfileFollowers = facebookProfileFollowers,
        _tiktokProfileFollowers = tiktokProfileFollowers,
        _youtubeProfileFollowers = youtubeProfileFollowers,
        _brandGallery = brandGallery,
        _storeAvailable = storeAvailable,
        _brandCollaboration = brandCollaboration,
        _selfie = selfie,
        _alternativeCountry = alternativeCountry,
        _alternativeCountryFlag = alternativeCountryFlag,
        super(firestoreUtilData);

  // "form_id" field.
  int? _formId;
  int get formId => _formId ?? 0;
  set formId(int? val) => _formId = val;

  void incrementFormId(int amount) => formId = formId + amount;

  bool hasFormId() => _formId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "uploaded_at" field.
  DateTime? _uploadedAt;
  DateTime? get uploadedAt => _uploadedAt;
  set uploadedAt(DateTime? val) => _uploadedAt = val;

  bool hasUploadedAt() => _uploadedAt != null;

  // "document_name" field.
  String? _documentName;
  String get documentName => _documentName ?? '';
  set documentName(String? val) => _documentName = val;

  bool hasDocumentName() => _documentName != null;

  // "document_url" field.
  String? _documentUrl;
  String get documentUrl => _documentUrl ?? '';
  set documentUrl(String? val) => _documentUrl = val;

  bool hasDocumentUrl() => _documentUrl != null;

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

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  set bio(String? val) => _bio = val;

  bool hasBio() => _bio != null;

  // "brand_photo" field.
  String? _brandPhoto;
  String get brandPhoto => _brandPhoto ?? '';
  set brandPhoto(String? val) => _brandPhoto = val;

  bool hasBrandPhoto() => _brandPhoto != null;

  // "alternative_email" field.
  String? _alternativeEmail;
  String get alternativeEmail => _alternativeEmail ?? '';
  set alternativeEmail(String? val) => _alternativeEmail = val;

  bool hasAlternativeEmail() => _alternativeEmail != null;

  // "alternative_phone" field.
  String? _alternativePhone;
  String get alternativePhone => _alternativePhone ?? '';
  set alternativePhone(String? val) => _alternativePhone = val;

  bool hasAlternativePhone() => _alternativePhone != null;

  // "content_category" field.
  List<String>? _contentCategory;
  List<String> get contentCategory => _contentCategory ?? const [];
  set contentCategory(List<String>? val) => _contentCategory = val;

  void updateContentCategory(Function(List<String>) updateFn) {
    updateFn(_contentCategory ??= []);
  }

  bool hasContentCategory() => _contentCategory != null;

  // "experience_in_years" field.
  double? _experienceInYears;
  double get experienceInYears => _experienceInYears ?? 0.0;
  set experienceInYears(double? val) => _experienceInYears = val;

  void incrementExperienceInYears(double amount) =>
      experienceInYears = experienceInYears + amount;

  bool hasExperienceInYears() => _experienceInYears != null;

  // "engagement_rate" field.
  double? _engagementRate;
  double get engagementRate => _engagementRate ?? 0.0;
  set engagementRate(double? val) => _engagementRate = val;

  void incrementEngagementRate(double amount) =>
      engagementRate = engagementRate + amount;

  bool hasEngagementRate() => _engagementRate != null;

  // "preferred_promotion_style" field.
  String? _preferredPromotionStyle;
  String get preferredPromotionStyle => _preferredPromotionStyle ?? '';
  set preferredPromotionStyle(String? val) => _preferredPromotionStyle = val;

  bool hasPreferredPromotionStyle() => _preferredPromotionStyle != null;

  // "portfolio_link" field.
  String? _portfolioLink;
  String get portfolioLink => _portfolioLink ?? '';
  set portfolioLink(String? val) => _portfolioLink = val;

  bool hasPortfolioLink() => _portfolioLink != null;

  // "instagram_profile" field.
  String? _instagramProfile;
  String get instagramProfile => _instagramProfile ?? '';
  set instagramProfile(String? val) => _instagramProfile = val;

  bool hasInstagramProfile() => _instagramProfile != null;

  // "tiktok_handle" field.
  String? _tiktokHandle;
  String get tiktokHandle => _tiktokHandle ?? '';
  set tiktokHandle(String? val) => _tiktokHandle = val;

  bool hasTiktokHandle() => _tiktokHandle != null;

  // "youtube_channel" field.
  String? _youtubeChannel;
  String get youtubeChannel => _youtubeChannel ?? '';
  set youtubeChannel(String? val) => _youtubeChannel = val;

  bool hasYoutubeChannel() => _youtubeChannel != null;

  // "other_profile" field.
  String? _otherProfile;
  String get otherProfile => _otherProfile ?? '';
  set otherProfile(String? val) => _otherProfile = val;

  bool hasOtherProfile() => _otherProfile != null;

  // "production_capabilities" field.
  String? _productionCapabilities;
  String get productionCapabilities => _productionCapabilities ?? '';
  set productionCapabilities(String? val) => _productionCapabilities = val;

  bool hasProductionCapabilities() => _productionCapabilities != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "testimonials" field.
  String? _testimonials;
  String get testimonials => _testimonials ?? '';
  set testimonials(String? val) => _testimonials = val;

  bool hasTestimonials() => _testimonials != null;

  // "custom_orders" field.
  bool? _customOrders;
  bool get customOrders => _customOrders ?? false;
  set customOrders(bool? val) => _customOrders = val;

  bool hasCustomOrders() => _customOrders != null;

  // "event_collabrations" field.
  bool? _eventCollabrations;
  bool get eventCollabrations => _eventCollabrations ?? false;
  set eventCollabrations(bool? val) => _eventCollabrations = val;

  bool hasEventCollabrations() => _eventCollabrations != null;

  // "content_category_list" field.
  List<String>? _contentCategoryList;
  List<String> get contentCategoryList => _contentCategoryList ?? const [];
  set contentCategoryList(List<String>? val) => _contentCategoryList = val;

  void updateContentCategoryList(Function(List<String>) updateFn) {
    updateFn(_contentCategoryList ??= []);
  }

  bool hasContentCategoryList() => _contentCategoryList != null;

  // "facebook_profile" field.
  String? _facebookProfile;
  String get facebookProfile => _facebookProfile ?? '';
  set facebookProfile(String? val) => _facebookProfile = val;

  bool hasFacebookProfile() => _facebookProfile != null;

  // "instagram_profile_followers" field.
  String? _instagramProfileFollowers;
  String get instagramProfileFollowers => _instagramProfileFollowers ?? '';
  set instagramProfileFollowers(String? val) =>
      _instagramProfileFollowers = val;

  bool hasInstagramProfileFollowers() => _instagramProfileFollowers != null;

  // "facebook_profile_followers" field.
  String? _facebookProfileFollowers;
  String get facebookProfileFollowers => _facebookProfileFollowers ?? '';
  set facebookProfileFollowers(String? val) => _facebookProfileFollowers = val;

  bool hasFacebookProfileFollowers() => _facebookProfileFollowers != null;

  // "tiktok_profile_followers" field.
  String? _tiktokProfileFollowers;
  String get tiktokProfileFollowers => _tiktokProfileFollowers ?? '';
  set tiktokProfileFollowers(String? val) => _tiktokProfileFollowers = val;

  bool hasTiktokProfileFollowers() => _tiktokProfileFollowers != null;

  // "youtube_profile_followers" field.
  String? _youtubeProfileFollowers;
  String get youtubeProfileFollowers => _youtubeProfileFollowers ?? '';
  set youtubeProfileFollowers(String? val) => _youtubeProfileFollowers = val;

  bool hasYoutubeProfileFollowers() => _youtubeProfileFollowers != null;

  // "brand_gallery" field.
  List<String>? _brandGallery;
  List<String> get brandGallery => _brandGallery ?? const [];
  set brandGallery(List<String>? val) => _brandGallery = val;

  void updateBrandGallery(Function(List<String>) updateFn) {
    updateFn(_brandGallery ??= []);
  }

  bool hasBrandGallery() => _brandGallery != null;

  // "store_available" field.
  bool? _storeAvailable;
  bool get storeAvailable => _storeAvailable ?? false;
  set storeAvailable(bool? val) => _storeAvailable = val;

  bool hasStoreAvailable() => _storeAvailable != null;

  // "brand_collaboration" field.
  bool? _brandCollaboration;
  bool get brandCollaboration => _brandCollaboration ?? false;
  set brandCollaboration(bool? val) => _brandCollaboration = val;

  bool hasBrandCollaboration() => _brandCollaboration != null;

  // "selfie" field.
  String? _selfie;
  String get selfie => _selfie ?? '';
  set selfie(String? val) => _selfie = val;

  bool hasSelfie() => _selfie != null;

  // "alternative_country" field.
  String? _alternativeCountry;
  String get alternativeCountry => _alternativeCountry ?? '';
  set alternativeCountry(String? val) => _alternativeCountry = val;

  bool hasAlternativeCountry() => _alternativeCountry != null;

  // "alternative_country_flag" field.
  String? _alternativeCountryFlag;
  String get alternativeCountryFlag => _alternativeCountryFlag ?? '';
  set alternativeCountryFlag(String? val) => _alternativeCountryFlag = val;

  bool hasAlternativeCountryFlag() => _alternativeCountryFlag != null;

  static FormListStruct fromMap(Map<String, dynamic> data) => FormListStruct(
        formId: castToType<int>(data['form_id']),
        status: data['status'] as String?,
        uploadedAt: data['uploaded_at'] as DateTime?,
        documentName: data['document_name'] as String?,
        documentUrl: data['document_url'] as String?,
        name: data['name'] as String?,
        email: data['email'] as String?,
        phone: data['phone'] as String?,
        bio: data['bio'] as String?,
        brandPhoto: data['brand_photo'] as String?,
        alternativeEmail: data['alternative_email'] as String?,
        alternativePhone: data['alternative_phone'] as String?,
        contentCategory: getDataList(data['content_category']),
        experienceInYears: castToType<double>(data['experience_in_years']),
        engagementRate: castToType<double>(data['engagement_rate']),
        preferredPromotionStyle: data['preferred_promotion_style'] as String?,
        portfolioLink: data['portfolio_link'] as String?,
        instagramProfile: data['instagram_profile'] as String?,
        tiktokHandle: data['tiktok_handle'] as String?,
        youtubeChannel: data['youtube_channel'] as String?,
        otherProfile: data['other_profile'] as String?,
        productionCapabilities: data['production_capabilities'] as String?,
        location: data['location'] as String?,
        testimonials: data['testimonials'] as String?,
        customOrders: data['custom_orders'] as bool?,
        eventCollabrations: data['event_collabrations'] as bool?,
        contentCategoryList: getDataList(data['content_category_list']),
        facebookProfile: data['facebook_profile'] as String?,
        instagramProfileFollowers:
            data['instagram_profile_followers'] as String?,
        facebookProfileFollowers: data['facebook_profile_followers'] as String?,
        tiktokProfileFollowers: data['tiktok_profile_followers'] as String?,
        youtubeProfileFollowers: data['youtube_profile_followers'] as String?,
        brandGallery: getDataList(data['brand_gallery']),
        storeAvailable: data['store_available'] as bool?,
        brandCollaboration: data['brand_collaboration'] as bool?,
        selfie: data['selfie'] as String?,
        alternativeCountry: data['alternative_country'] as String?,
        alternativeCountryFlag: data['alternative_country_flag'] as String?,
      );

  static FormListStruct? maybeFromMap(dynamic data) =>
      data is Map ? FormListStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'form_id': _formId,
        'status': _status,
        'uploaded_at': _uploadedAt,
        'document_name': _documentName,
        'document_url': _documentUrl,
        'name': _name,
        'email': _email,
        'phone': _phone,
        'bio': _bio,
        'brand_photo': _brandPhoto,
        'alternative_email': _alternativeEmail,
        'alternative_phone': _alternativePhone,
        'content_category': _contentCategory,
        'experience_in_years': _experienceInYears,
        'engagement_rate': _engagementRate,
        'preferred_promotion_style': _preferredPromotionStyle,
        'portfolio_link': _portfolioLink,
        'instagram_profile': _instagramProfile,
        'tiktok_handle': _tiktokHandle,
        'youtube_channel': _youtubeChannel,
        'other_profile': _otherProfile,
        'production_capabilities': _productionCapabilities,
        'location': _location,
        'testimonials': _testimonials,
        'custom_orders': _customOrders,
        'event_collabrations': _eventCollabrations,
        'content_category_list': _contentCategoryList,
        'facebook_profile': _facebookProfile,
        'instagram_profile_followers': _instagramProfileFollowers,
        'facebook_profile_followers': _facebookProfileFollowers,
        'tiktok_profile_followers': _tiktokProfileFollowers,
        'youtube_profile_followers': _youtubeProfileFollowers,
        'brand_gallery': _brandGallery,
        'store_available': _storeAvailable,
        'brand_collaboration': _brandCollaboration,
        'selfie': _selfie,
        'alternative_country': _alternativeCountry,
        'alternative_country_flag': _alternativeCountryFlag,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'form_id': serializeParam(
          _formId,
          ParamType.int,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'uploaded_at': serializeParam(
          _uploadedAt,
          ParamType.DateTime,
        ),
        'document_name': serializeParam(
          _documentName,
          ParamType.String,
        ),
        'document_url': serializeParam(
          _documentUrl,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'bio': serializeParam(
          _bio,
          ParamType.String,
        ),
        'brand_photo': serializeParam(
          _brandPhoto,
          ParamType.String,
        ),
        'alternative_email': serializeParam(
          _alternativeEmail,
          ParamType.String,
        ),
        'alternative_phone': serializeParam(
          _alternativePhone,
          ParamType.String,
        ),
        'content_category': serializeParam(
          _contentCategory,
          ParamType.String,
          isList: true,
        ),
        'experience_in_years': serializeParam(
          _experienceInYears,
          ParamType.double,
        ),
        'engagement_rate': serializeParam(
          _engagementRate,
          ParamType.double,
        ),
        'preferred_promotion_style': serializeParam(
          _preferredPromotionStyle,
          ParamType.String,
        ),
        'portfolio_link': serializeParam(
          _portfolioLink,
          ParamType.String,
        ),
        'instagram_profile': serializeParam(
          _instagramProfile,
          ParamType.String,
        ),
        'tiktok_handle': serializeParam(
          _tiktokHandle,
          ParamType.String,
        ),
        'youtube_channel': serializeParam(
          _youtubeChannel,
          ParamType.String,
        ),
        'other_profile': serializeParam(
          _otherProfile,
          ParamType.String,
        ),
        'production_capabilities': serializeParam(
          _productionCapabilities,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'testimonials': serializeParam(
          _testimonials,
          ParamType.String,
        ),
        'custom_orders': serializeParam(
          _customOrders,
          ParamType.bool,
        ),
        'event_collabrations': serializeParam(
          _eventCollabrations,
          ParamType.bool,
        ),
        'content_category_list': serializeParam(
          _contentCategoryList,
          ParamType.String,
          isList: true,
        ),
        'facebook_profile': serializeParam(
          _facebookProfile,
          ParamType.String,
        ),
        'instagram_profile_followers': serializeParam(
          _instagramProfileFollowers,
          ParamType.String,
        ),
        'facebook_profile_followers': serializeParam(
          _facebookProfileFollowers,
          ParamType.String,
        ),
        'tiktok_profile_followers': serializeParam(
          _tiktokProfileFollowers,
          ParamType.String,
        ),
        'youtube_profile_followers': serializeParam(
          _youtubeProfileFollowers,
          ParamType.String,
        ),
        'brand_gallery': serializeParam(
          _brandGallery,
          ParamType.String,
          isList: true,
        ),
        'store_available': serializeParam(
          _storeAvailable,
          ParamType.bool,
        ),
        'brand_collaboration': serializeParam(
          _brandCollaboration,
          ParamType.bool,
        ),
        'selfie': serializeParam(
          _selfie,
          ParamType.String,
        ),
        'alternative_country': serializeParam(
          _alternativeCountry,
          ParamType.String,
        ),
        'alternative_country_flag': serializeParam(
          _alternativeCountryFlag,
          ParamType.String,
        ),
      }.withoutNulls;

  static FormListStruct fromSerializableMap(Map<String, dynamic> data) =>
      FormListStruct(
        formId: deserializeParam(
          data['form_id'],
          ParamType.int,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        uploadedAt: deserializeParam(
          data['uploaded_at'],
          ParamType.DateTime,
          false,
        ),
        documentName: deserializeParam(
          data['document_name'],
          ParamType.String,
          false,
        ),
        documentUrl: deserializeParam(
          data['document_url'],
          ParamType.String,
          false,
        ),
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
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        bio: deserializeParam(
          data['bio'],
          ParamType.String,
          false,
        ),
        brandPhoto: deserializeParam(
          data['brand_photo'],
          ParamType.String,
          false,
        ),
        alternativeEmail: deserializeParam(
          data['alternative_email'],
          ParamType.String,
          false,
        ),
        alternativePhone: deserializeParam(
          data['alternative_phone'],
          ParamType.String,
          false,
        ),
        contentCategory: deserializeParam<String>(
          data['content_category'],
          ParamType.String,
          true,
        ),
        experienceInYears: deserializeParam(
          data['experience_in_years'],
          ParamType.double,
          false,
        ),
        engagementRate: deserializeParam(
          data['engagement_rate'],
          ParamType.double,
          false,
        ),
        preferredPromotionStyle: deserializeParam(
          data['preferred_promotion_style'],
          ParamType.String,
          false,
        ),
        portfolioLink: deserializeParam(
          data['portfolio_link'],
          ParamType.String,
          false,
        ),
        instagramProfile: deserializeParam(
          data['instagram_profile'],
          ParamType.String,
          false,
        ),
        tiktokHandle: deserializeParam(
          data['tiktok_handle'],
          ParamType.String,
          false,
        ),
        youtubeChannel: deserializeParam(
          data['youtube_channel'],
          ParamType.String,
          false,
        ),
        otherProfile: deserializeParam(
          data['other_profile'],
          ParamType.String,
          false,
        ),
        productionCapabilities: deserializeParam(
          data['production_capabilities'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        testimonials: deserializeParam(
          data['testimonials'],
          ParamType.String,
          false,
        ),
        customOrders: deserializeParam(
          data['custom_orders'],
          ParamType.bool,
          false,
        ),
        eventCollabrations: deserializeParam(
          data['event_collabrations'],
          ParamType.bool,
          false,
        ),
        contentCategoryList: deserializeParam<String>(
          data['content_category_list'],
          ParamType.String,
          true,
        ),
        facebookProfile: deserializeParam(
          data['facebook_profile'],
          ParamType.String,
          false,
        ),
        instagramProfileFollowers: deserializeParam(
          data['instagram_profile_followers'],
          ParamType.String,
          false,
        ),
        facebookProfileFollowers: deserializeParam(
          data['facebook_profile_followers'],
          ParamType.String,
          false,
        ),
        tiktokProfileFollowers: deserializeParam(
          data['tiktok_profile_followers'],
          ParamType.String,
          false,
        ),
        youtubeProfileFollowers: deserializeParam(
          data['youtube_profile_followers'],
          ParamType.String,
          false,
        ),
        brandGallery: deserializeParam<String>(
          data['brand_gallery'],
          ParamType.String,
          true,
        ),
        storeAvailable: deserializeParam(
          data['store_available'],
          ParamType.bool,
          false,
        ),
        brandCollaboration: deserializeParam(
          data['brand_collaboration'],
          ParamType.bool,
          false,
        ),
        selfie: deserializeParam(
          data['selfie'],
          ParamType.String,
          false,
        ),
        alternativeCountry: deserializeParam(
          data['alternative_country'],
          ParamType.String,
          false,
        ),
        alternativeCountryFlag: deserializeParam(
          data['alternative_country_flag'],
          ParamType.String,
          false,
        ),
      );

  static FormListStruct fromAlgoliaData(Map<String, dynamic> data) =>
      FormListStruct(
        formId: convertAlgoliaParam(
          data['form_id'],
          ParamType.int,
          false,
        ),
        status: convertAlgoliaParam(
          data['status'],
          ParamType.String,
          false,
        ),
        uploadedAt: convertAlgoliaParam(
          data['uploaded_at'],
          ParamType.DateTime,
          false,
        ),
        documentName: convertAlgoliaParam(
          data['document_name'],
          ParamType.String,
          false,
        ),
        documentUrl: convertAlgoliaParam(
          data['document_url'],
          ParamType.String,
          false,
        ),
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
        phone: convertAlgoliaParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        bio: convertAlgoliaParam(
          data['bio'],
          ParamType.String,
          false,
        ),
        brandPhoto: convertAlgoliaParam(
          data['brand_photo'],
          ParamType.String,
          false,
        ),
        alternativeEmail: convertAlgoliaParam(
          data['alternative_email'],
          ParamType.String,
          false,
        ),
        alternativePhone: convertAlgoliaParam(
          data['alternative_phone'],
          ParamType.String,
          false,
        ),
        contentCategory: convertAlgoliaParam<String>(
          data['content_category'],
          ParamType.String,
          true,
        ),
        experienceInYears: convertAlgoliaParam(
          data['experience_in_years'],
          ParamType.double,
          false,
        ),
        engagementRate: convertAlgoliaParam(
          data['engagement_rate'],
          ParamType.double,
          false,
        ),
        preferredPromotionStyle: convertAlgoliaParam(
          data['preferred_promotion_style'],
          ParamType.String,
          false,
        ),
        portfolioLink: convertAlgoliaParam(
          data['portfolio_link'],
          ParamType.String,
          false,
        ),
        instagramProfile: convertAlgoliaParam(
          data['instagram_profile'],
          ParamType.String,
          false,
        ),
        tiktokHandle: convertAlgoliaParam(
          data['tiktok_handle'],
          ParamType.String,
          false,
        ),
        youtubeChannel: convertAlgoliaParam(
          data['youtube_channel'],
          ParamType.String,
          false,
        ),
        otherProfile: convertAlgoliaParam(
          data['other_profile'],
          ParamType.String,
          false,
        ),
        productionCapabilities: convertAlgoliaParam(
          data['production_capabilities'],
          ParamType.String,
          false,
        ),
        location: convertAlgoliaParam(
          data['location'],
          ParamType.String,
          false,
        ),
        testimonials: convertAlgoliaParam(
          data['testimonials'],
          ParamType.String,
          false,
        ),
        customOrders: convertAlgoliaParam(
          data['custom_orders'],
          ParamType.bool,
          false,
        ),
        eventCollabrations: convertAlgoliaParam(
          data['event_collabrations'],
          ParamType.bool,
          false,
        ),
        contentCategoryList: convertAlgoliaParam<String>(
          data['content_category_list'],
          ParamType.String,
          true,
        ),
        facebookProfile: convertAlgoliaParam(
          data['facebook_profile'],
          ParamType.String,
          false,
        ),
        instagramProfileFollowers: convertAlgoliaParam(
          data['instagram_profile_followers'],
          ParamType.String,
          false,
        ),
        facebookProfileFollowers: convertAlgoliaParam(
          data['facebook_profile_followers'],
          ParamType.String,
          false,
        ),
        tiktokProfileFollowers: convertAlgoliaParam(
          data['tiktok_profile_followers'],
          ParamType.String,
          false,
        ),
        youtubeProfileFollowers: convertAlgoliaParam(
          data['youtube_profile_followers'],
          ParamType.String,
          false,
        ),
        brandGallery: convertAlgoliaParam<String>(
          data['brand_gallery'],
          ParamType.String,
          true,
        ),
        storeAvailable: convertAlgoliaParam(
          data['store_available'],
          ParamType.bool,
          false,
        ),
        brandCollaboration: convertAlgoliaParam(
          data['brand_collaboration'],
          ParamType.bool,
          false,
        ),
        selfie: convertAlgoliaParam(
          data['selfie'],
          ParamType.String,
          false,
        ),
        alternativeCountry: convertAlgoliaParam(
          data['alternative_country'],
          ParamType.String,
          false,
        ),
        alternativeCountryFlag: convertAlgoliaParam(
          data['alternative_country_flag'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'FormListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FormListStruct &&
        formId == other.formId &&
        status == other.status &&
        uploadedAt == other.uploadedAt &&
        documentName == other.documentName &&
        documentUrl == other.documentUrl &&
        name == other.name &&
        email == other.email &&
        phone == other.phone &&
        bio == other.bio &&
        brandPhoto == other.brandPhoto &&
        alternativeEmail == other.alternativeEmail &&
        alternativePhone == other.alternativePhone &&
        listEquality.equals(contentCategory, other.contentCategory) &&
        experienceInYears == other.experienceInYears &&
        engagementRate == other.engagementRate &&
        preferredPromotionStyle == other.preferredPromotionStyle &&
        portfolioLink == other.portfolioLink &&
        instagramProfile == other.instagramProfile &&
        tiktokHandle == other.tiktokHandle &&
        youtubeChannel == other.youtubeChannel &&
        otherProfile == other.otherProfile &&
        productionCapabilities == other.productionCapabilities &&
        location == other.location &&
        testimonials == other.testimonials &&
        customOrders == other.customOrders &&
        eventCollabrations == other.eventCollabrations &&
        listEquality.equals(contentCategoryList, other.contentCategoryList) &&
        facebookProfile == other.facebookProfile &&
        instagramProfileFollowers == other.instagramProfileFollowers &&
        facebookProfileFollowers == other.facebookProfileFollowers &&
        tiktokProfileFollowers == other.tiktokProfileFollowers &&
        youtubeProfileFollowers == other.youtubeProfileFollowers &&
        listEquality.equals(brandGallery, other.brandGallery) &&
        storeAvailable == other.storeAvailable &&
        brandCollaboration == other.brandCollaboration &&
        selfie == other.selfie &&
        alternativeCountry == other.alternativeCountry &&
        alternativeCountryFlag == other.alternativeCountryFlag;
  }

  @override
  int get hashCode => const ListEquality().hash([
        formId,
        status,
        uploadedAt,
        documentName,
        documentUrl,
        name,
        email,
        phone,
        bio,
        brandPhoto,
        alternativeEmail,
        alternativePhone,
        contentCategory,
        experienceInYears,
        engagementRate,
        preferredPromotionStyle,
        portfolioLink,
        instagramProfile,
        tiktokHandle,
        youtubeChannel,
        otherProfile,
        productionCapabilities,
        location,
        testimonials,
        customOrders,
        eventCollabrations,
        contentCategoryList,
        facebookProfile,
        instagramProfileFollowers,
        facebookProfileFollowers,
        tiktokProfileFollowers,
        youtubeProfileFollowers,
        brandGallery,
        storeAvailable,
        brandCollaboration,
        selfie,
        alternativeCountry,
        alternativeCountryFlag
      ]);
}

FormListStruct createFormListStruct({
  int? formId,
  String? status,
  DateTime? uploadedAt,
  String? documentName,
  String? documentUrl,
  String? name,
  String? email,
  String? phone,
  String? bio,
  String? brandPhoto,
  String? alternativeEmail,
  String? alternativePhone,
  double? experienceInYears,
  double? engagementRate,
  String? preferredPromotionStyle,
  String? portfolioLink,
  String? instagramProfile,
  String? tiktokHandle,
  String? youtubeChannel,
  String? otherProfile,
  String? productionCapabilities,
  String? location,
  String? testimonials,
  bool? customOrders,
  bool? eventCollabrations,
  String? facebookProfile,
  String? instagramProfileFollowers,
  String? facebookProfileFollowers,
  String? tiktokProfileFollowers,
  String? youtubeProfileFollowers,
  bool? storeAvailable,
  bool? brandCollaboration,
  String? selfie,
  String? alternativeCountry,
  String? alternativeCountryFlag,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FormListStruct(
      formId: formId,
      status: status,
      uploadedAt: uploadedAt,
      documentName: documentName,
      documentUrl: documentUrl,
      name: name,
      email: email,
      phone: phone,
      bio: bio,
      brandPhoto: brandPhoto,
      alternativeEmail: alternativeEmail,
      alternativePhone: alternativePhone,
      experienceInYears: experienceInYears,
      engagementRate: engagementRate,
      preferredPromotionStyle: preferredPromotionStyle,
      portfolioLink: portfolioLink,
      instagramProfile: instagramProfile,
      tiktokHandle: tiktokHandle,
      youtubeChannel: youtubeChannel,
      otherProfile: otherProfile,
      productionCapabilities: productionCapabilities,
      location: location,
      testimonials: testimonials,
      customOrders: customOrders,
      eventCollabrations: eventCollabrations,
      facebookProfile: facebookProfile,
      instagramProfileFollowers: instagramProfileFollowers,
      facebookProfileFollowers: facebookProfileFollowers,
      tiktokProfileFollowers: tiktokProfileFollowers,
      youtubeProfileFollowers: youtubeProfileFollowers,
      storeAvailable: storeAvailable,
      brandCollaboration: brandCollaboration,
      selfie: selfie,
      alternativeCountry: alternativeCountry,
      alternativeCountryFlag: alternativeCountryFlag,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FormListStruct? updateFormListStruct(
  FormListStruct? formList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    formList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFormListStructData(
  Map<String, dynamic> firestoreData,
  FormListStruct? formList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (formList == null) {
    return;
  }
  if (formList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && formList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final formListData = getFormListFirestoreData(formList, forFieldValue);
  final nestedData = formListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = formList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFormListFirestoreData(
  FormListStruct? formList, [
  bool forFieldValue = false,
]) {
  if (formList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(formList.toMap());

  // Add any Firestore field values
  mapToFirestore(formList.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFormListListFirestoreData(
  List<FormListStruct>? formLists,
) =>
    formLists?.map((e) => getFormListFirestoreData(e, true)).toList() ?? [];
