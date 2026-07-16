// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TranslateInfoStruct extends FFFirebaseStruct {
  TranslateInfoStruct({
    TranslateLanguageListStruct? slug,
    TranslateLanguageListStruct? name,
    TranslateLanguageListStruct? shortDescription,
    TranslateLanguageListStruct? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _slug = slug,
        _name = name,
        _shortDescription = shortDescription,
        _description = description,
        super(firestoreUtilData);

  // "slug" field.
  TranslateLanguageListStruct? _slug;
  TranslateLanguageListStruct get slug =>
      _slug ?? TranslateLanguageListStruct();
  set slug(TranslateLanguageListStruct? val) => _slug = val;

  void updateSlug(Function(TranslateLanguageListStruct) updateFn) {
    updateFn(_slug ??= TranslateLanguageListStruct());
  }

  bool hasSlug() => _slug != null;

  // "name" field.
  TranslateLanguageListStruct? _name;
  TranslateLanguageListStruct get name =>
      _name ?? TranslateLanguageListStruct();
  set name(TranslateLanguageListStruct? val) => _name = val;

  void updateName(Function(TranslateLanguageListStruct) updateFn) {
    updateFn(_name ??= TranslateLanguageListStruct());
  }

  bool hasName() => _name != null;

  // "short_description" field.
  TranslateLanguageListStruct? _shortDescription;
  TranslateLanguageListStruct get shortDescription =>
      _shortDescription ?? TranslateLanguageListStruct();
  set shortDescription(TranslateLanguageListStruct? val) =>
      _shortDescription = val;

  void updateShortDescription(Function(TranslateLanguageListStruct) updateFn) {
    updateFn(_shortDescription ??= TranslateLanguageListStruct());
  }

  bool hasShortDescription() => _shortDescription != null;

  // "description" field.
  TranslateLanguageListStruct? _description;
  TranslateLanguageListStruct get description =>
      _description ?? TranslateLanguageListStruct();
  set description(TranslateLanguageListStruct? val) => _description = val;

  void updateDescription(Function(TranslateLanguageListStruct) updateFn) {
    updateFn(_description ??= TranslateLanguageListStruct());
  }

  bool hasDescription() => _description != null;

  static TranslateInfoStruct fromMap(Map<String, dynamic> data) =>
      TranslateInfoStruct(
        slug: data['slug'] is TranslateLanguageListStruct
            ? data['slug']
            : TranslateLanguageListStruct.maybeFromMap(data['slug']),
        name: data['name'] is TranslateLanguageListStruct
            ? data['name']
            : TranslateLanguageListStruct.maybeFromMap(data['name']),
        shortDescription:
            data['short_description'] is TranslateLanguageListStruct
                ? data['short_description']
                : TranslateLanguageListStruct.maybeFromMap(
                    data['short_description']),
        description: data['description'] is TranslateLanguageListStruct
            ? data['description']
            : TranslateLanguageListStruct.maybeFromMap(data['description']),
      );

  static TranslateInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? TranslateInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'slug': _slug?.toMap(),
        'name': _name?.toMap(),
        'short_description': _shortDescription?.toMap(),
        'description': _description?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'slug': serializeParam(
          _slug,
          ParamType.DataStruct,
        ),
        'name': serializeParam(
          _name,
          ParamType.DataStruct,
        ),
        'short_description': serializeParam(
          _shortDescription,
          ParamType.DataStruct,
        ),
        'description': serializeParam(
          _description,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static TranslateInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      TranslateInfoStruct(
        slug: deserializeStructParam(
          data['slug'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLanguageListStruct.fromSerializableMap,
        ),
        name: deserializeStructParam(
          data['name'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLanguageListStruct.fromSerializableMap,
        ),
        shortDescription: deserializeStructParam(
          data['short_description'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLanguageListStruct.fromSerializableMap,
        ),
        description: deserializeStructParam(
          data['description'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLanguageListStruct.fromSerializableMap,
        ),
      );

  static TranslateInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      TranslateInfoStruct(
        slug: convertAlgoliaParam(
          data['slug'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLanguageListStruct.fromAlgoliaData,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLanguageListStruct.fromAlgoliaData,
        ),
        shortDescription: convertAlgoliaParam(
          data['short_description'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLanguageListStruct.fromAlgoliaData,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLanguageListStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'TranslateInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TranslateInfoStruct &&
        slug == other.slug &&
        name == other.name &&
        shortDescription == other.shortDescription &&
        description == other.description;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([slug, name, shortDescription, description]);
}

TranslateInfoStruct createTranslateInfoStruct({
  TranslateLanguageListStruct? slug,
  TranslateLanguageListStruct? name,
  TranslateLanguageListStruct? shortDescription,
  TranslateLanguageListStruct? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TranslateInfoStruct(
      slug: slug ?? (clearUnsetFields ? TranslateLanguageListStruct() : null),
      name: name ?? (clearUnsetFields ? TranslateLanguageListStruct() : null),
      shortDescription: shortDescription ??
          (clearUnsetFields ? TranslateLanguageListStruct() : null),
      description: description ??
          (clearUnsetFields ? TranslateLanguageListStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TranslateInfoStruct? updateTranslateInfoStruct(
  TranslateInfoStruct? translateInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    translateInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTranslateInfoStructData(
  Map<String, dynamic> firestoreData,
  TranslateInfoStruct? translateInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (translateInfo == null) {
    return;
  }
  if (translateInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && translateInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final translateInfoData =
      getTranslateInfoFirestoreData(translateInfo, forFieldValue);
  final nestedData =
      translateInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = translateInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTranslateInfoFirestoreData(
  TranslateInfoStruct? translateInfo, [
  bool forFieldValue = false,
]) {
  if (translateInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(translateInfo.toMap());

  // Handle nested data for "slug" field.
  addTranslateLanguageListStructData(
    firestoreData,
    translateInfo.hasSlug() ? translateInfo.slug : null,
    'slug',
    forFieldValue,
  );

  // Handle nested data for "name" field.
  addTranslateLanguageListStructData(
    firestoreData,
    translateInfo.hasName() ? translateInfo.name : null,
    'name',
    forFieldValue,
  );

  // Handle nested data for "short_description" field.
  addTranslateLanguageListStructData(
    firestoreData,
    translateInfo.hasShortDescription() ? translateInfo.shortDescription : null,
    'short_description',
    forFieldValue,
  );

  // Handle nested data for "description" field.
  addTranslateLanguageListStructData(
    firestoreData,
    translateInfo.hasDescription() ? translateInfo.description : null,
    'description',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(translateInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTranslateInfoListFirestoreData(
  List<TranslateInfoStruct>? translateInfos,
) =>
    translateInfos
        ?.map((e) => getTranslateInfoFirestoreData(e, true))
        .toList() ??
    [];
