import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

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

  @BuiltValueField(wireName: 'user_gender')
  String? get userGender;

  @BuiltValueField(wireName: 'user_location')
  String? get userLocation;

  @BuiltValueField(wireName: 'user_work')
  String? get userWork;

  @BuiltValueField(wireName: 'user_bio')
  String? get userBio;

  @BuiltValueField(wireName: 'updated_time')
  DateTime? get updatedTime;

  @BuiltValueField(wireName: 'liked_posts')
  BuiltList<DocumentReference>? get likedPosts;

  @BuiltValueField(wireName: 'user_rate')
  BuiltList<double>? get userRate;

  @BuiltValueField(wireName: 'all_posts')
  BuiltList<DocumentReference>? get allPosts;

  @BuiltValueField(wireName: 'search_history')
  BuiltList<String>? get searchHistory;

  @BuiltValueField(wireName: 'all_reviews_about_me')
  BuiltList<DocumentReference>? get allReviewsAboutMe;

  @BuiltValueField(wireName: 'all_reviews_by_me')
  BuiltList<DocumentReference>? get allReviewsByMe;

  bool? get provider;

  bool? get isGuest;

  bool? get ownsCar;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..userGender = ''
    ..userLocation = ''
    ..userWork = ''
    ..userBio = ''
    ..likedPosts = ListBuilder()
    ..userRate = ListBuilder()
    ..allPosts = ListBuilder()
    ..searchHistory = ListBuilder()
    ..allReviewsAboutMe = ListBuilder()
    ..allReviewsByMe = ListBuilder()
    ..provider = false
    ..isGuest = false
    ..ownsCar = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? userGender,
  String? userLocation,
  String? userWork,
  String? userBio,
  DateTime? updatedTime,
  bool? provider,
  bool? isGuest,
  bool? ownsCar,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..userGender = userGender
        ..userLocation = userLocation
        ..userWork = userWork
        ..userBio = userBio
        ..updatedTime = updatedTime
        ..likedPosts = null
        ..userRate = null
        ..allPosts = null
        ..searchHistory = null
        ..allReviewsAboutMe = null
        ..allReviewsByMe = null
        ..provider = provider
        ..isGuest = isGuest
        ..ownsCar = ownsCar,
    ),
  );

  return firestoreData;
}
