import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reveiws_record.g.dart';

abstract class ReveiwsRecord
    implements Built<ReveiwsRecord, ReveiwsRecordBuilder> {
  static Serializer<ReveiwsRecord> get serializer => _$reveiwsRecordSerializer;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'review_text')
  String? get reviewText;

  int? get rating;

  @BuiltValueField(wireName: 'review_user_photo')
  String? get reviewUserPhoto;

  @BuiltValueField(wireName: 'reviewed_by')
  DocumentReference? get reviewedBy;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ReveiwsRecordBuilder builder) => builder
    ..reviewText = ''
    ..rating = 0
    ..reviewUserPhoto = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reveiws');

  static Stream<ReveiwsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ReveiwsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ReveiwsRecord._();
  factory ReveiwsRecord([void Function(ReveiwsRecordBuilder) updates]) =
      _$ReveiwsRecord;

  static ReveiwsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createReveiwsRecordData({
  DateTime? createdAt,
  String? reviewText,
  int? rating,
  String? reviewUserPhoto,
  DocumentReference? reviewedBy,
}) {
  final firestoreData = serializers.toFirestore(
    ReveiwsRecord.serializer,
    ReveiwsRecord(
      (r) => r
        ..createdAt = createdAt
        ..reviewText = reviewText
        ..rating = rating
        ..reviewUserPhoto = reviewUserPhoto
        ..reviewedBy = reviewedBy,
    ),
  );

  return firestoreData;
}
