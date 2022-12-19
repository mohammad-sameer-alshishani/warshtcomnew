import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'request_post_record.g.dart';

abstract class RequestPostRecord
    implements Built<RequestPostRecord, RequestPostRecordBuilder> {
  static Serializer<RequestPostRecord> get serializer =>
      _$requestPostRecordSerializer;

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

  @BuiltValueField(wireName: 'liked_by')
  BuiltList<DocumentReference>? get likedBy;

  @BuiltValueField(wireName: 'post_type')
  String? get postType;

  @BuiltValueField(wireName: 'post_user_location')
  String? get postUserLocation;

  @BuiltValueField(wireName: 'post_user_photo')
  String? get postUserPhoto;

  @BuiltValueField(wireName: 'post_ID')
  String? get postID;

  @BuiltValueField(wireName: 'post_user_name')
  String? get postUserName;

  @BuiltValueField(wireName: 'time_edited')
  DateTime? get timeEdited;

  double? get price;

  @BuiltValueField(wireName: 'price_type')
  String? get priceType;

  @BuiltValueField(wireName: 'post_photo')
  BuiltList<String>? get postPhoto;

  @BuiltValueField(wireName: 'commented_by')
  BuiltList<DocumentReference>? get commentedBy;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RequestPostRecordBuilder builder) => builder
    ..postTitle = ''
    ..postDescription = ''
    ..numComments = 0
    ..likedBy = ListBuilder()
    ..postType = ''
    ..postUserLocation = ''
    ..postUserPhoto = ''
    ..postID = ''
    ..postUserName = ''
    ..price = 0.0
    ..priceType = ''
    ..postPhoto = ListBuilder()
    ..commentedBy = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('requestPost');

  static Stream<RequestPostRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RequestPostRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RequestPostRecord._();
  factory RequestPostRecord([void Function(RequestPostRecordBuilder) updates]) =
      _$RequestPostRecord;

  static RequestPostRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRequestPostRecordData({
  String? postTitle,
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numComments,
  String? postType,
  String? postUserLocation,
  String? postUserPhoto,
  String? postID,
  String? postUserName,
  DateTime? timeEdited,
  double? price,
  String? priceType,
}) {
  final firestoreData = serializers.toFirestore(
    RequestPostRecord.serializer,
    RequestPostRecord(
      (r) => r
        ..postTitle = postTitle
        ..postDescription = postDescription
        ..postUser = postUser
        ..timePosted = timePosted
        ..numComments = numComments
        ..likedBy = null
        ..postType = postType
        ..postUserLocation = postUserLocation
        ..postUserPhoto = postUserPhoto
        ..postID = postID
        ..postUserName = postUserName
        ..timeEdited = timeEdited
        ..price = price
        ..priceType = priceType
        ..postPhoto = null
        ..commentedBy = null,
    ),
  );

  return firestoreData;
}
