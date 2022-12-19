import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'comments_record.g.dart';

abstract class CommentsRecord
    implements Built<CommentsRecord, CommentsRecordBuilder> {
  static Serializer<CommentsRecord> get serializer =>
      _$commentsRecordSerializer;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'comment_text')
  String? get commentText;

  @BuiltValueField(wireName: 'commented_by_ref')
  DocumentReference? get commentedByRef;

  @BuiltValueField(wireName: 'commented_post')
  DocumentReference? get commentedPost;

  @BuiltValueField(wireName: 'commented_post_user_ref')
  DocumentReference? get commentedPostUserRef;

  @BuiltValueField(wireName: 'commented_by_user_photo')
  String? get commentedByUserPhoto;

  @BuiltValueField(wireName: 'commented_post_id')
  String? get commentedPostId;

  @BuiltValueField(wireName: 'commented_by_id')
  String? get commentedById;

  @BuiltValueField(wireName: 'commented_request_post')
  DocumentReference? get commentedRequestPost;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CommentsRecordBuilder builder) => builder
    ..commentText = ''
    ..commentedByUserPhoto = ''
    ..commentedPostId = ''
    ..commentedById = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CommentsRecord._();
  factory CommentsRecord([void Function(CommentsRecordBuilder) updates]) =
      _$CommentsRecord;

  static CommentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCommentsRecordData({
  DateTime? createdAt,
  String? commentText,
  DocumentReference? commentedByRef,
  DocumentReference? commentedPost,
  DocumentReference? commentedPostUserRef,
  String? commentedByUserPhoto,
  String? commentedPostId,
  String? commentedById,
  DocumentReference? commentedRequestPost,
}) {
  final firestoreData = serializers.toFirestore(
    CommentsRecord.serializer,
    CommentsRecord(
      (c) => c
        ..createdAt = createdAt
        ..commentText = commentText
        ..commentedByRef = commentedByRef
        ..commentedPost = commentedPost
        ..commentedPostUserRef = commentedPostUserRef
        ..commentedByUserPhoto = commentedByUserPhoto
        ..commentedPostId = commentedPostId
        ..commentedById = commentedById
        ..commentedRequestPost = commentedRequestPost,
    ),
  );

  return firestoreData;
}
