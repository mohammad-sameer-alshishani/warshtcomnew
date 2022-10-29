import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'posts_record.g.dart';

abstract class PostsRecord implements Built<PostsRecord, PostsRecordBuilder> {
  static Serializer<PostsRecord> get serializer => _$postsRecordSerializer;

  @BuiltValueField(wireName: 'post_photo')
  String? get postPhoto;

  @BuiltValueField(wireName: 'post_title')
  String? get postTitle;

  @BuiltValueField(wireName: 'post_description')
  String? get postDescription;

  @BuiltValueField(wireName: 'post_user')
  DocumentReference? get postUser;

  @BuiltValueField(wireName: 'time_posted')
  DateTime? get timePosted;

  @BuiltValueField(wireName: 'num_comments')
  int? get numComments;

  @BuiltValueField(wireName: 'num_votes')
  int? get numVotes;

  @BuiltValueField(wireName: 'liked_by')
  BuiltList<DocumentReference>? get likedBy;

  @BuiltValueField(wireName: 'num_likes')
  int? get numLikes;

  double? get price;

  @BuiltValueField(wireName: 'post_type')
  String? get postType;

  @BuiltValueField(wireName: 'price_type')
  String? get priceType;

  @BuiltValueField(wireName: 'post_user_location')
  String? get postUserLocation;

  @BuiltValueField(wireName: 'post_user_photo')
  String? get postUserPhoto;

  @BuiltValueField(wireName: 'post_ID')
  String? get postID;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PostsRecordBuilder builder) => builder
    ..postPhoto = ''
    ..postTitle = ''
    ..postDescription = ''
    ..numComments = 0
    ..numVotes = 0
    ..likedBy = ListBuilder()
    ..numLikes = 0
    ..price = 0.0
    ..postType = ''
    ..priceType = ''
    ..postUserLocation = ''
    ..postUserPhoto = ''
    ..postID = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PostsRecord._();
  factory PostsRecord([void Function(PostsRecordBuilder) updates]) =
      _$PostsRecord;

  static PostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPostsRecordData({
  String? postPhoto,
  String? postTitle,
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numComments,
  int? numVotes,
  int? numLikes,
  double? price,
  String? postType,
  String? priceType,
  String? postUserLocation,
  String? postUserPhoto,
  String? postID,
}) {
  final firestoreData = serializers.toFirestore(
    PostsRecord.serializer,
    PostsRecord(
      (p) => p
        ..postPhoto = postPhoto
        ..postTitle = postTitle
        ..postDescription = postDescription
        ..postUser = postUser
        ..timePosted = timePosted
        ..numComments = numComments
        ..numVotes = numVotes
        ..likedBy = null
        ..numLikes = numLikes
        ..price = price
        ..postType = postType
        ..priceType = priceType
        ..postUserLocation = postUserLocation
        ..postUserPhoto = postUserPhoto
        ..postID = postID,
    ),
  );

  return firestoreData;
}
