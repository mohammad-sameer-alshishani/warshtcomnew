import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'jops_types_struct.g.dart';

abstract class JopsTypesStruct
    implements Built<JopsTypesStruct, JopsTypesStructBuilder> {
  static Serializer<JopsTypesStruct> get serializer =>
      _$jopsTypesStructSerializer;

  String? get sadas;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(JopsTypesStructBuilder builder) => builder
    ..sadas = ''
    ..firestoreUtilData = FirestoreUtilData();

  JopsTypesStruct._();
  factory JopsTypesStruct([void Function(JopsTypesStructBuilder) updates]) =
      _$JopsTypesStruct;
}

JopsTypesStruct createJopsTypesStruct({
  String? sadas,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    JopsTypesStruct(
      (j) => j
        ..sadas = sadas
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

JopsTypesStruct? updateJopsTypesStruct(
  JopsTypesStruct? jopsTypes, {
  bool clearUnsetFields = true,
}) =>
    jopsTypes != null
        ? (jopsTypes.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addJopsTypesStructData(
  Map<String, dynamic> firestoreData,
  JopsTypesStruct? jopsTypes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (jopsTypes == null) {
    return;
  }
  if (jopsTypes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && jopsTypes.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final jopsTypesData = getJopsTypesFirestoreData(jopsTypes, forFieldValue);
  final nestedData = jopsTypesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = jopsTypes.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getJopsTypesFirestoreData(
  JopsTypesStruct? jopsTypes, [
  bool forFieldValue = false,
]) {
  if (jopsTypes == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(JopsTypesStruct.serializer, jopsTypes);

  // Add any Firestore field values
  jopsTypes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getJopsTypesListFirestoreData(
  List<JopsTypesStruct>? jopsTypess,
) =>
    jopsTypess?.map((j) => getJopsTypesFirestoreData(j, true)).toList() ?? [];
