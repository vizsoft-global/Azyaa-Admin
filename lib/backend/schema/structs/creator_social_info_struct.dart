// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CreatorSocialInfoStruct extends FFFirebaseStruct {
  CreatorSocialInfoStruct({
    String? creatorDisplayImage,
    String? creatorEmail,
    String? creatorXId,
    bool? tictokStatus,
    String? creatorTictokId,
    String? tictokFollowers,
    bool? youtubeStatus,
    String? creatorYoutubeId,
    String? youtubeFollowers,
    String? xFollowers,
    String? creatorFacebookId,
    bool? facebookStatus,
    String? facebookFollowers,
    bool? instagranStatus,
    String? creatorInstagramId,
    String? instagramFollowers,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _creatorDisplayImage = creatorDisplayImage,
        _creatorEmail = creatorEmail,
        _creatorXId = creatorXId,
        _tictokStatus = tictokStatus,
        _creatorTictokId = creatorTictokId,
        _tictokFollowers = tictokFollowers,
        _youtubeStatus = youtubeStatus,
        _creatorYoutubeId = creatorYoutubeId,
        _youtubeFollowers = youtubeFollowers,
        _xFollowers = xFollowers,
        _creatorFacebookId = creatorFacebookId,
        _facebookStatus = facebookStatus,
        _facebookFollowers = facebookFollowers,
        _instagranStatus = instagranStatus,
        _creatorInstagramId = creatorInstagramId,
        _instagramFollowers = instagramFollowers,
        super(firestoreUtilData);

  // "creator_display_image" field.
  String? _creatorDisplayImage;
  String get creatorDisplayImage => _creatorDisplayImage ?? '';
  set creatorDisplayImage(String? val) => _creatorDisplayImage = val;

  bool hasCreatorDisplayImage() => _creatorDisplayImage != null;

  // "creator_email" field.
  String? _creatorEmail;
  String get creatorEmail => _creatorEmail ?? '';
  set creatorEmail(String? val) => _creatorEmail = val;

  bool hasCreatorEmail() => _creatorEmail != null;

  // "creator_x_id" field.
  String? _creatorXId;
  String get creatorXId => _creatorXId ?? '';
  set creatorXId(String? val) => _creatorXId = val;

  bool hasCreatorXId() => _creatorXId != null;

  // "tictok_status" field.
  bool? _tictokStatus;
  bool get tictokStatus => _tictokStatus ?? false;
  set tictokStatus(bool? val) => _tictokStatus = val;

  bool hasTictokStatus() => _tictokStatus != null;

  // "creator_tictok_id" field.
  String? _creatorTictokId;
  String get creatorTictokId => _creatorTictokId ?? '';
  set creatorTictokId(String? val) => _creatorTictokId = val;

  bool hasCreatorTictokId() => _creatorTictokId != null;

  // "tictok_followers" field.
  String? _tictokFollowers;
  String get tictokFollowers => _tictokFollowers ?? '';
  set tictokFollowers(String? val) => _tictokFollowers = val;

  bool hasTictokFollowers() => _tictokFollowers != null;

  // "youtube_status" field.
  bool? _youtubeStatus;
  bool get youtubeStatus => _youtubeStatus ?? false;
  set youtubeStatus(bool? val) => _youtubeStatus = val;

  bool hasYoutubeStatus() => _youtubeStatus != null;

  // "creator_youtube_id" field.
  String? _creatorYoutubeId;
  String get creatorYoutubeId => _creatorYoutubeId ?? '';
  set creatorYoutubeId(String? val) => _creatorYoutubeId = val;

  bool hasCreatorYoutubeId() => _creatorYoutubeId != null;

  // "youtube_followers" field.
  String? _youtubeFollowers;
  String get youtubeFollowers => _youtubeFollowers ?? '';
  set youtubeFollowers(String? val) => _youtubeFollowers = val;

  bool hasYoutubeFollowers() => _youtubeFollowers != null;

  // "x_followers" field.
  String? _xFollowers;
  String get xFollowers => _xFollowers ?? '';
  set xFollowers(String? val) => _xFollowers = val;

  bool hasXFollowers() => _xFollowers != null;

  // "creator_facebook_id" field.
  String? _creatorFacebookId;
  String get creatorFacebookId => _creatorFacebookId ?? '';
  set creatorFacebookId(String? val) => _creatorFacebookId = val;

  bool hasCreatorFacebookId() => _creatorFacebookId != null;

  // "facebook_status" field.
  bool? _facebookStatus;
  bool get facebookStatus => _facebookStatus ?? false;
  set facebookStatus(bool? val) => _facebookStatus = val;

  bool hasFacebookStatus() => _facebookStatus != null;

  // "facebook_followers" field.
  String? _facebookFollowers;
  String get facebookFollowers => _facebookFollowers ?? '';
  set facebookFollowers(String? val) => _facebookFollowers = val;

  bool hasFacebookFollowers() => _facebookFollowers != null;

  // "instagran_status" field.
  bool? _instagranStatus;
  bool get instagranStatus => _instagranStatus ?? false;
  set instagranStatus(bool? val) => _instagranStatus = val;

  bool hasInstagranStatus() => _instagranStatus != null;

  // "creator_instagram_id" field.
  String? _creatorInstagramId;
  String get creatorInstagramId => _creatorInstagramId ?? '';
  set creatorInstagramId(String? val) => _creatorInstagramId = val;

  bool hasCreatorInstagramId() => _creatorInstagramId != null;

  // "instagram_followers" field.
  String? _instagramFollowers;
  String get instagramFollowers => _instagramFollowers ?? '';
  set instagramFollowers(String? val) => _instagramFollowers = val;

  bool hasInstagramFollowers() => _instagramFollowers != null;

  static CreatorSocialInfoStruct fromMap(Map<String, dynamic> data) =>
      CreatorSocialInfoStruct(
        creatorDisplayImage: data['creator_display_image'] as String?,
        creatorEmail: data['creator_email'] as String?,
        creatorXId: data['creator_x_id'] as String?,
        tictokStatus: data['tictok_status'] as bool?,
        creatorTictokId: data['creator_tictok_id'] as String?,
        tictokFollowers: data['tictok_followers'] as String?,
        youtubeStatus: data['youtube_status'] as bool?,
        creatorYoutubeId: data['creator_youtube_id'] as String?,
        youtubeFollowers: data['youtube_followers'] as String?,
        xFollowers: data['x_followers'] as String?,
        creatorFacebookId: data['creator_facebook_id'] as String?,
        facebookStatus: data['facebook_status'] as bool?,
        facebookFollowers: data['facebook_followers'] as String?,
        instagranStatus: data['instagran_status'] as bool?,
        creatorInstagramId: data['creator_instagram_id'] as String?,
        instagramFollowers: data['instagram_followers'] as String?,
      );

  static CreatorSocialInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? CreatorSocialInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'creator_display_image': _creatorDisplayImage,
        'creator_email': _creatorEmail,
        'creator_x_id': _creatorXId,
        'tictok_status': _tictokStatus,
        'creator_tictok_id': _creatorTictokId,
        'tictok_followers': _tictokFollowers,
        'youtube_status': _youtubeStatus,
        'creator_youtube_id': _creatorYoutubeId,
        'youtube_followers': _youtubeFollowers,
        'x_followers': _xFollowers,
        'creator_facebook_id': _creatorFacebookId,
        'facebook_status': _facebookStatus,
        'facebook_followers': _facebookFollowers,
        'instagran_status': _instagranStatus,
        'creator_instagram_id': _creatorInstagramId,
        'instagram_followers': _instagramFollowers,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'creator_display_image': serializeParam(
          _creatorDisplayImage,
          ParamType.String,
        ),
        'creator_email': serializeParam(
          _creatorEmail,
          ParamType.String,
        ),
        'creator_x_id': serializeParam(
          _creatorXId,
          ParamType.String,
        ),
        'tictok_status': serializeParam(
          _tictokStatus,
          ParamType.bool,
        ),
        'creator_tictok_id': serializeParam(
          _creatorTictokId,
          ParamType.String,
        ),
        'tictok_followers': serializeParam(
          _tictokFollowers,
          ParamType.String,
        ),
        'youtube_status': serializeParam(
          _youtubeStatus,
          ParamType.bool,
        ),
        'creator_youtube_id': serializeParam(
          _creatorYoutubeId,
          ParamType.String,
        ),
        'youtube_followers': serializeParam(
          _youtubeFollowers,
          ParamType.String,
        ),
        'x_followers': serializeParam(
          _xFollowers,
          ParamType.String,
        ),
        'creator_facebook_id': serializeParam(
          _creatorFacebookId,
          ParamType.String,
        ),
        'facebook_status': serializeParam(
          _facebookStatus,
          ParamType.bool,
        ),
        'facebook_followers': serializeParam(
          _facebookFollowers,
          ParamType.String,
        ),
        'instagran_status': serializeParam(
          _instagranStatus,
          ParamType.bool,
        ),
        'creator_instagram_id': serializeParam(
          _creatorInstagramId,
          ParamType.String,
        ),
        'instagram_followers': serializeParam(
          _instagramFollowers,
          ParamType.String,
        ),
      }.withoutNulls;

  static CreatorSocialInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CreatorSocialInfoStruct(
        creatorDisplayImage: deserializeParam(
          data['creator_display_image'],
          ParamType.String,
          false,
        ),
        creatorEmail: deserializeParam(
          data['creator_email'],
          ParamType.String,
          false,
        ),
        creatorXId: deserializeParam(
          data['creator_x_id'],
          ParamType.String,
          false,
        ),
        tictokStatus: deserializeParam(
          data['tictok_status'],
          ParamType.bool,
          false,
        ),
        creatorTictokId: deserializeParam(
          data['creator_tictok_id'],
          ParamType.String,
          false,
        ),
        tictokFollowers: deserializeParam(
          data['tictok_followers'],
          ParamType.String,
          false,
        ),
        youtubeStatus: deserializeParam(
          data['youtube_status'],
          ParamType.bool,
          false,
        ),
        creatorYoutubeId: deserializeParam(
          data['creator_youtube_id'],
          ParamType.String,
          false,
        ),
        youtubeFollowers: deserializeParam(
          data['youtube_followers'],
          ParamType.String,
          false,
        ),
        xFollowers: deserializeParam(
          data['x_followers'],
          ParamType.String,
          false,
        ),
        creatorFacebookId: deserializeParam(
          data['creator_facebook_id'],
          ParamType.String,
          false,
        ),
        facebookStatus: deserializeParam(
          data['facebook_status'],
          ParamType.bool,
          false,
        ),
        facebookFollowers: deserializeParam(
          data['facebook_followers'],
          ParamType.String,
          false,
        ),
        instagranStatus: deserializeParam(
          data['instagran_status'],
          ParamType.bool,
          false,
        ),
        creatorInstagramId: deserializeParam(
          data['creator_instagram_id'],
          ParamType.String,
          false,
        ),
        instagramFollowers: deserializeParam(
          data['instagram_followers'],
          ParamType.String,
          false,
        ),
      );

  static CreatorSocialInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CreatorSocialInfoStruct(
        creatorDisplayImage: convertAlgoliaParam(
          data['creator_display_image'],
          ParamType.String,
          false,
        ),
        creatorEmail: convertAlgoliaParam(
          data['creator_email'],
          ParamType.String,
          false,
        ),
        creatorXId: convertAlgoliaParam(
          data['creator_x_id'],
          ParamType.String,
          false,
        ),
        tictokStatus: convertAlgoliaParam(
          data['tictok_status'],
          ParamType.bool,
          false,
        ),
        creatorTictokId: convertAlgoliaParam(
          data['creator_tictok_id'],
          ParamType.String,
          false,
        ),
        tictokFollowers: convertAlgoliaParam(
          data['tictok_followers'],
          ParamType.String,
          false,
        ),
        youtubeStatus: convertAlgoliaParam(
          data['youtube_status'],
          ParamType.bool,
          false,
        ),
        creatorYoutubeId: convertAlgoliaParam(
          data['creator_youtube_id'],
          ParamType.String,
          false,
        ),
        youtubeFollowers: convertAlgoliaParam(
          data['youtube_followers'],
          ParamType.String,
          false,
        ),
        xFollowers: convertAlgoliaParam(
          data['x_followers'],
          ParamType.String,
          false,
        ),
        creatorFacebookId: convertAlgoliaParam(
          data['creator_facebook_id'],
          ParamType.String,
          false,
        ),
        facebookStatus: convertAlgoliaParam(
          data['facebook_status'],
          ParamType.bool,
          false,
        ),
        facebookFollowers: convertAlgoliaParam(
          data['facebook_followers'],
          ParamType.String,
          false,
        ),
        instagranStatus: convertAlgoliaParam(
          data['instagran_status'],
          ParamType.bool,
          false,
        ),
        creatorInstagramId: convertAlgoliaParam(
          data['creator_instagram_id'],
          ParamType.String,
          false,
        ),
        instagramFollowers: convertAlgoliaParam(
          data['instagram_followers'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CreatorSocialInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CreatorSocialInfoStruct &&
        creatorDisplayImage == other.creatorDisplayImage &&
        creatorEmail == other.creatorEmail &&
        creatorXId == other.creatorXId &&
        tictokStatus == other.tictokStatus &&
        creatorTictokId == other.creatorTictokId &&
        tictokFollowers == other.tictokFollowers &&
        youtubeStatus == other.youtubeStatus &&
        creatorYoutubeId == other.creatorYoutubeId &&
        youtubeFollowers == other.youtubeFollowers &&
        xFollowers == other.xFollowers &&
        creatorFacebookId == other.creatorFacebookId &&
        facebookStatus == other.facebookStatus &&
        facebookFollowers == other.facebookFollowers &&
        instagranStatus == other.instagranStatus &&
        creatorInstagramId == other.creatorInstagramId &&
        instagramFollowers == other.instagramFollowers;
  }

  @override
  int get hashCode => const ListEquality().hash([
        creatorDisplayImage,
        creatorEmail,
        creatorXId,
        tictokStatus,
        creatorTictokId,
        tictokFollowers,
        youtubeStatus,
        creatorYoutubeId,
        youtubeFollowers,
        xFollowers,
        creatorFacebookId,
        facebookStatus,
        facebookFollowers,
        instagranStatus,
        creatorInstagramId,
        instagramFollowers
      ]);
}

CreatorSocialInfoStruct createCreatorSocialInfoStruct({
  String? creatorDisplayImage,
  String? creatorEmail,
  String? creatorXId,
  bool? tictokStatus,
  String? creatorTictokId,
  String? tictokFollowers,
  bool? youtubeStatus,
  String? creatorYoutubeId,
  String? youtubeFollowers,
  String? xFollowers,
  String? creatorFacebookId,
  bool? facebookStatus,
  String? facebookFollowers,
  bool? instagranStatus,
  String? creatorInstagramId,
  String? instagramFollowers,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CreatorSocialInfoStruct(
      creatorDisplayImage: creatorDisplayImage,
      creatorEmail: creatorEmail,
      creatorXId: creatorXId,
      tictokStatus: tictokStatus,
      creatorTictokId: creatorTictokId,
      tictokFollowers: tictokFollowers,
      youtubeStatus: youtubeStatus,
      creatorYoutubeId: creatorYoutubeId,
      youtubeFollowers: youtubeFollowers,
      xFollowers: xFollowers,
      creatorFacebookId: creatorFacebookId,
      facebookStatus: facebookStatus,
      facebookFollowers: facebookFollowers,
      instagranStatus: instagranStatus,
      creatorInstagramId: creatorInstagramId,
      instagramFollowers: instagramFollowers,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CreatorSocialInfoStruct? updateCreatorSocialInfoStruct(
  CreatorSocialInfoStruct? creatorSocialInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    creatorSocialInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCreatorSocialInfoStructData(
  Map<String, dynamic> firestoreData,
  CreatorSocialInfoStruct? creatorSocialInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (creatorSocialInfo == null) {
    return;
  }
  if (creatorSocialInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && creatorSocialInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final creatorSocialInfoData =
      getCreatorSocialInfoFirestoreData(creatorSocialInfo, forFieldValue);
  final nestedData =
      creatorSocialInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = creatorSocialInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCreatorSocialInfoFirestoreData(
  CreatorSocialInfoStruct? creatorSocialInfo, [
  bool forFieldValue = false,
]) {
  if (creatorSocialInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(creatorSocialInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(creatorSocialInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCreatorSocialInfoListFirestoreData(
  List<CreatorSocialInfoStruct>? creatorSocialInfos,
) =>
    creatorSocialInfos
        ?.map((e) => getCreatorSocialInfoFirestoreData(e, true))
        .toList() ??
    [];
