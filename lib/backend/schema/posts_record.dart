import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'posts_record.g.dart';

abstract class PostsRecord implements Built<PostsRecord, PostsRecordBuilder> {
  static Serializer<PostsRecord> get serializer => _$postsRecordSerializer;

  @BuiltValueField(wireName: 'post_title')
  String? get postTitle;

  @BuiltValueField(wireName: 'post_description')
  String? get postDescription;

  @BuiltValueField(wireName: 'post_user')
  DocumentReference? get postUser;

  @BuiltValueField(wireName: 'time_posted')
  DateTime? get timePosted;

  @BuiltValueField(wireName: 'liked_by')
  BuiltList<DocumentReference>? get likedBy;

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

  @BuiltValueField(wireName: 'post_user_name')
  String? get postUserName;

  @BuiltValueField(wireName: 'post_photo')
  BuiltList<String>? get postPhoto;

  @BuiltValueField(wireName: 'time_edited')
  DateTime? get timeEdited;

  bool? get isRequest;

  @BuiltValueField(wireName: 'num_likes')
  int? get numLikes;

  @BuiltValueField(wireName: 'num_comments')
  int? get numComments;

  @BuiltValueField(wireName: 'num_votes')
  int? get numVotes;

  @BuiltValueField(wireName: 'commented_by')
  BuiltList<DocumentReference>? get commentedBy;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PostsRecordBuilder builder) => builder
    ..postTitle = ''
    ..postDescription = ''
    ..likedBy = ListBuilder()
    ..price = 0.0
    ..postType = ''
    ..priceType = ''
    ..postUserLocation = ''
    ..postUserPhoto = ''
    ..postID = ''
    ..postUserName = ''
    ..postPhoto = ListBuilder()
    ..isRequest = false
    ..numLikes = 0
    ..numComments = 0
    ..numVotes = 0
    ..commentedBy = ListBuilder()
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = '';

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
  String? postTitle,
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  double? price,
  String? postType,
  String? priceType,
  String? postUserLocation,
  String? postUserPhoto,
  String? postID,
  String? postUserName,
  DateTime? timeEdited,
  bool? isRequest,
  int? numLikes,
  int? numComments,
  int? numVotes,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = serializers.toFirestore(
    PostsRecord.serializer,
    PostsRecord(
      (p) => p
        ..postTitle = postTitle
        ..postDescription = postDescription
        ..postUser = postUser
        ..timePosted = timePosted
        ..likedBy = null
        ..price = price
        ..postType = postType
        ..priceType = priceType
        ..postUserLocation = postUserLocation
        ..postUserPhoto = postUserPhoto
        ..postID = postID
        ..postUserName = postUserName
        ..postPhoto = null
        ..timeEdited = timeEdited
        ..isRequest = isRequest
        ..numLikes = numLikes
        ..numComments = numComments
        ..numVotes = numVotes
        ..commentedBy = null
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber,
    ),
  );

  return firestoreData;
}
