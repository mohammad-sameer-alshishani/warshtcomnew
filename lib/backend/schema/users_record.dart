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

  @BuiltValueField(wireName: 'user_rate')
  double? get userRate;

  @BuiltValueField(wireName: 'user_work')
  String? get userWork;

  @BuiltValueField(wireName: 'user_bio')
  String? get userBio;

  @BuiltValueField(wireName: 'updated_time')
  DateTime? get updatedTime;

  @BuiltValueField(wireName: 'liked_posts')
  BuiltList<DocumentReference>? get likedPosts;

  @BuiltValueField(wireName: 'all_reviews')
  BuiltList<DocumentReference>? get allReviews;

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
    ..userRate = 0.0
    ..userWork = ''
    ..userBio = ''
    ..likedPosts = ListBuilder()
    ..allReviews = ListBuilder();

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
  double? userRate,
  String? userWork,
  String? userBio,
  DateTime? updatedTime,
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
        ..userRate = userRate
        ..userWork = userWork
        ..userBio = userBio
        ..updatedTime = updatedTime
        ..likedPosts = null
        ..allReviews = null,
    ),
  );

  return firestoreData;
}
