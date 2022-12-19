// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostsRecord> _$postsRecordSerializer = new _$PostsRecordSerializer();

class _$PostsRecordSerializer implements StructuredSerializer<PostsRecord> {
  @override
  final Iterable<Type> types = const [PostsRecord, _$PostsRecord];
  @override
  final String wireName = 'PostsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.postTitle;
    if (value != null) {
      result
        ..add('post_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postDescription;
    if (value != null) {
      result
        ..add('post_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postUser;
    if (value != null) {
      result
        ..add('post_user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.timePosted;
    if (value != null) {
      result
        ..add('time_posted')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.likedBy;
    if (value != null) {
      result
        ..add('liked_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.postType;
    if (value != null) {
      result
        ..add('post_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.priceType;
    if (value != null) {
      result
        ..add('price_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postUserLocation;
    if (value != null) {
      result
        ..add('post_user_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postUserPhoto;
    if (value != null) {
      result
        ..add('post_user_photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postID;
    if (value != null) {
      result
        ..add('post_ID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postUserName;
    if (value != null) {
      result
        ..add('post_user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postPhoto;
    if (value != null) {
      result
        ..add('post_photo')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.timeEdited;
    if (value != null) {
      result
        ..add('time_edited')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.isRequest;
    if (value != null) {
      result
        ..add('isRequest')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.numLikes;
    if (value != null) {
      result
        ..add('num_likes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numComments;
    if (value != null) {
      result
        ..add('num_comments')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numVotes;
    if (value != null) {
      result
        ..add('num_votes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.commentedBy;
    if (value != null) {
      result
        ..add('commented_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  PostsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'post_title':
          result.postTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_description':
          result.postDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_user':
          result.postUser = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'time_posted':
          result.timePosted = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'liked_by':
          result.likedBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'post_type':
          result.postType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price_type':
          result.priceType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_user_location':
          result.postUserLocation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_user_photo':
          result.postUserPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_ID':
          result.postID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_user_name':
          result.postUserName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_photo':
          result.postPhoto.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'time_edited':
          result.timeEdited = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'isRequest':
          result.isRequest = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'num_likes':
          result.numLikes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num_comments':
          result.numComments = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num_votes':
          result.numVotes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'commented_by':
          result.commentedBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$PostsRecord extends PostsRecord {
  @override
  final String? postTitle;
  @override
  final String? postDescription;
  @override
  final DocumentReference<Object?>? postUser;
  @override
  final DateTime? timePosted;
  @override
  final BuiltList<DocumentReference<Object?>>? likedBy;
  @override
  final double? price;
  @override
  final String? postType;
  @override
  final String? priceType;
  @override
  final String? postUserLocation;
  @override
  final String? postUserPhoto;
  @override
  final String? postID;
  @override
  final String? postUserName;
  @override
  final BuiltList<String>? postPhoto;
  @override
  final DateTime? timeEdited;
  @override
  final bool? isRequest;
  @override
  final int? numLikes;
  @override
  final int? numComments;
  @override
  final int? numVotes;
  @override
  final BuiltList<DocumentReference<Object?>>? commentedBy;
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PostsRecord([void Function(PostsRecordBuilder)? updates]) =>
      (new PostsRecordBuilder()..update(updates))._build();

  _$PostsRecord._(
      {this.postTitle,
      this.postDescription,
      this.postUser,
      this.timePosted,
      this.likedBy,
      this.price,
      this.postType,
      this.priceType,
      this.postUserLocation,
      this.postUserPhoto,
      this.postID,
      this.postUserName,
      this.postPhoto,
      this.timeEdited,
      this.isRequest,
      this.numLikes,
      this.numComments,
      this.numVotes,
      this.commentedBy,
      this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.ffRef})
      : super._();

  @override
  PostsRecord rebuild(void Function(PostsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostsRecordBuilder toBuilder() => new PostsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostsRecord &&
        postTitle == other.postTitle &&
        postDescription == other.postDescription &&
        postUser == other.postUser &&
        timePosted == other.timePosted &&
        likedBy == other.likedBy &&
        price == other.price &&
        postType == other.postType &&
        priceType == other.priceType &&
        postUserLocation == other.postUserLocation &&
        postUserPhoto == other.postUserPhoto &&
        postID == other.postID &&
        postUserName == other.postUserName &&
        postPhoto == other.postPhoto &&
        timeEdited == other.timeEdited &&
        isRequest == other.isRequest &&
        numLikes == other.numLikes &&
        numComments == other.numComments &&
        numVotes == other.numVotes &&
        commentedBy == other.commentedBy &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc(0, postTitle.hashCode), postDescription.hashCode), postUser.hashCode), timePosted.hashCode), likedBy.hashCode), price.hashCode), postType.hashCode),
                                                                                priceType.hashCode),
                                                                            postUserLocation.hashCode),
                                                                        postUserPhoto.hashCode),
                                                                    postID.hashCode),
                                                                postUserName.hashCode),
                                                            postPhoto.hashCode),
                                                        timeEdited.hashCode),
                                                    isRequest.hashCode),
                                                numLikes.hashCode),
                                            numComments.hashCode),
                                        numVotes.hashCode),
                                    commentedBy.hashCode),
                                email.hashCode),
                            displayName.hashCode),
                        photoUrl.hashCode),
                    uid.hashCode),
                createdTime.hashCode),
            phoneNumber.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostsRecord')
          ..add('postTitle', postTitle)
          ..add('postDescription', postDescription)
          ..add('postUser', postUser)
          ..add('timePosted', timePosted)
          ..add('likedBy', likedBy)
          ..add('price', price)
          ..add('postType', postType)
          ..add('priceType', priceType)
          ..add('postUserLocation', postUserLocation)
          ..add('postUserPhoto', postUserPhoto)
          ..add('postID', postID)
          ..add('postUserName', postUserName)
          ..add('postPhoto', postPhoto)
          ..add('timeEdited', timeEdited)
          ..add('isRequest', isRequest)
          ..add('numLikes', numLikes)
          ..add('numComments', numComments)
          ..add('numVotes', numVotes)
          ..add('commentedBy', commentedBy)
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PostsRecordBuilder implements Builder<PostsRecord, PostsRecordBuilder> {
  _$PostsRecord? _$v;

  String? _postTitle;
  String? get postTitle => _$this._postTitle;
  set postTitle(String? postTitle) => _$this._postTitle = postTitle;

  String? _postDescription;
  String? get postDescription => _$this._postDescription;
  set postDescription(String? postDescription) =>
      _$this._postDescription = postDescription;

  DocumentReference<Object?>? _postUser;
  DocumentReference<Object?>? get postUser => _$this._postUser;
  set postUser(DocumentReference<Object?>? postUser) =>
      _$this._postUser = postUser;

  DateTime? _timePosted;
  DateTime? get timePosted => _$this._timePosted;
  set timePosted(DateTime? timePosted) => _$this._timePosted = timePosted;

  ListBuilder<DocumentReference<Object?>>? _likedBy;
  ListBuilder<DocumentReference<Object?>> get likedBy =>
      _$this._likedBy ??= new ListBuilder<DocumentReference<Object?>>();
  set likedBy(ListBuilder<DocumentReference<Object?>>? likedBy) =>
      _$this._likedBy = likedBy;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  String? _postType;
  String? get postType => _$this._postType;
  set postType(String? postType) => _$this._postType = postType;

  String? _priceType;
  String? get priceType => _$this._priceType;
  set priceType(String? priceType) => _$this._priceType = priceType;

  String? _postUserLocation;
  String? get postUserLocation => _$this._postUserLocation;
  set postUserLocation(String? postUserLocation) =>
      _$this._postUserLocation = postUserLocation;

  String? _postUserPhoto;
  String? get postUserPhoto => _$this._postUserPhoto;
  set postUserPhoto(String? postUserPhoto) =>
      _$this._postUserPhoto = postUserPhoto;

  String? _postID;
  String? get postID => _$this._postID;
  set postID(String? postID) => _$this._postID = postID;

  String? _postUserName;
  String? get postUserName => _$this._postUserName;
  set postUserName(String? postUserName) => _$this._postUserName = postUserName;

  ListBuilder<String>? _postPhoto;
  ListBuilder<String> get postPhoto =>
      _$this._postPhoto ??= new ListBuilder<String>();
  set postPhoto(ListBuilder<String>? postPhoto) =>
      _$this._postPhoto = postPhoto;

  DateTime? _timeEdited;
  DateTime? get timeEdited => _$this._timeEdited;
  set timeEdited(DateTime? timeEdited) => _$this._timeEdited = timeEdited;

  bool? _isRequest;
  bool? get isRequest => _$this._isRequest;
  set isRequest(bool? isRequest) => _$this._isRequest = isRequest;

  int? _numLikes;
  int? get numLikes => _$this._numLikes;
  set numLikes(int? numLikes) => _$this._numLikes = numLikes;

  int? _numComments;
  int? get numComments => _$this._numComments;
  set numComments(int? numComments) => _$this._numComments = numComments;

  int? _numVotes;
  int? get numVotes => _$this._numVotes;
  set numVotes(int? numVotes) => _$this._numVotes = numVotes;

  ListBuilder<DocumentReference<Object?>>? _commentedBy;
  ListBuilder<DocumentReference<Object?>> get commentedBy =>
      _$this._commentedBy ??= new ListBuilder<DocumentReference<Object?>>();
  set commentedBy(ListBuilder<DocumentReference<Object?>>? commentedBy) =>
      _$this._commentedBy = commentedBy;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PostsRecordBuilder() {
    PostsRecord._initializeBuilder(this);
  }

  PostsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _postTitle = $v.postTitle;
      _postDescription = $v.postDescription;
      _postUser = $v.postUser;
      _timePosted = $v.timePosted;
      _likedBy = $v.likedBy?.toBuilder();
      _price = $v.price;
      _postType = $v.postType;
      _priceType = $v.priceType;
      _postUserLocation = $v.postUserLocation;
      _postUserPhoto = $v.postUserPhoto;
      _postID = $v.postID;
      _postUserName = $v.postUserName;
      _postPhoto = $v.postPhoto?.toBuilder();
      _timeEdited = $v.timeEdited;
      _isRequest = $v.isRequest;
      _numLikes = $v.numLikes;
      _numComments = $v.numComments;
      _numVotes = $v.numVotes;
      _commentedBy = $v.commentedBy?.toBuilder();
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostsRecord;
  }

  @override
  void update(void Function(PostsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostsRecord build() => _build();

  _$PostsRecord _build() {
    _$PostsRecord _$result;
    try {
      _$result = _$v ??
          new _$PostsRecord._(
              postTitle: postTitle,
              postDescription: postDescription,
              postUser: postUser,
              timePosted: timePosted,
              likedBy: _likedBy?.build(),
              price: price,
              postType: postType,
              priceType: priceType,
              postUserLocation: postUserLocation,
              postUserPhoto: postUserPhoto,
              postID: postID,
              postUserName: postUserName,
              postPhoto: _postPhoto?.build(),
              timeEdited: timeEdited,
              isRequest: isRequest,
              numLikes: numLikes,
              numComments: numComments,
              numVotes: numVotes,
              commentedBy: _commentedBy?.build(),
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'likedBy';
        _likedBy?.build();

        _$failedField = 'postPhoto';
        _postPhoto?.build();

        _$failedField = 'commentedBy';
        _commentedBy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PostsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
