// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_post_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RequestPostRecord> _$requestPostRecordSerializer =
    new _$RequestPostRecordSerializer();

class _$RequestPostRecordSerializer
    implements StructuredSerializer<RequestPostRecord> {
  @override
  final Iterable<Type> types = const [RequestPostRecord, _$RequestPostRecord];
  @override
  final String wireName = 'RequestPostRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RequestPostRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.postPhoto;
    if (value != null) {
      result
        ..add('post_photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
    value = object.numComments;
    if (value != null) {
      result
        ..add('num_comments')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
    value = object.numLikes;
    if (value != null) {
      result
        ..add('num_likes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.postType;
    if (value != null) {
      result
        ..add('post_type')
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
  RequestPostRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RequestPostRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'post_photo':
          result.postPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
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
        case 'num_comments':
          result.numComments = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'liked_by':
          result.likedBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'num_likes':
          result.numLikes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'post_type':
          result.postType = serializers.deserialize(value,
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

class _$RequestPostRecord extends RequestPostRecord {
  @override
  final String? postPhoto;
  @override
  final String? postTitle;
  @override
  final String? postDescription;
  @override
  final DocumentReference<Object?>? postUser;
  @override
  final DateTime? timePosted;
  @override
  final int? numComments;
  @override
  final BuiltList<DocumentReference<Object?>>? likedBy;
  @override
  final int? numLikes;
  @override
  final String? postType;
  @override
  final String? postUserLocation;
  @override
  final String? postUserPhoto;
  @override
  final String? postID;
  @override
  final String? postUserName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RequestPostRecord(
          [void Function(RequestPostRecordBuilder)? updates]) =>
      (new RequestPostRecordBuilder()..update(updates))._build();

  _$RequestPostRecord._(
      {this.postPhoto,
      this.postTitle,
      this.postDescription,
      this.postUser,
      this.timePosted,
      this.numComments,
      this.likedBy,
      this.numLikes,
      this.postType,
      this.postUserLocation,
      this.postUserPhoto,
      this.postID,
      this.postUserName,
      this.ffRef})
      : super._();

  @override
  RequestPostRecord rebuild(void Function(RequestPostRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RequestPostRecordBuilder toBuilder() =>
      new RequestPostRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RequestPostRecord &&
        postPhoto == other.postPhoto &&
        postTitle == other.postTitle &&
        postDescription == other.postDescription &&
        postUser == other.postUser &&
        timePosted == other.timePosted &&
        numComments == other.numComments &&
        likedBy == other.likedBy &&
        numLikes == other.numLikes &&
        postType == other.postType &&
        postUserLocation == other.postUserLocation &&
        postUserPhoto == other.postUserPhoto &&
        postID == other.postID &&
        postUserName == other.postUserName &&
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
                                                        $jc(0,
                                                            postPhoto.hashCode),
                                                        postTitle.hashCode),
                                                    postDescription.hashCode),
                                                postUser.hashCode),
                                            timePosted.hashCode),
                                        numComments.hashCode),
                                    likedBy.hashCode),
                                numLikes.hashCode),
                            postType.hashCode),
                        postUserLocation.hashCode),
                    postUserPhoto.hashCode),
                postID.hashCode),
            postUserName.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RequestPostRecord')
          ..add('postPhoto', postPhoto)
          ..add('postTitle', postTitle)
          ..add('postDescription', postDescription)
          ..add('postUser', postUser)
          ..add('timePosted', timePosted)
          ..add('numComments', numComments)
          ..add('likedBy', likedBy)
          ..add('numLikes', numLikes)
          ..add('postType', postType)
          ..add('postUserLocation', postUserLocation)
          ..add('postUserPhoto', postUserPhoto)
          ..add('postID', postID)
          ..add('postUserName', postUserName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RequestPostRecordBuilder
    implements Builder<RequestPostRecord, RequestPostRecordBuilder> {
  _$RequestPostRecord? _$v;

  String? _postPhoto;
  String? get postPhoto => _$this._postPhoto;
  set postPhoto(String? postPhoto) => _$this._postPhoto = postPhoto;

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

  int? _numComments;
  int? get numComments => _$this._numComments;
  set numComments(int? numComments) => _$this._numComments = numComments;

  ListBuilder<DocumentReference<Object?>>? _likedBy;
  ListBuilder<DocumentReference<Object?>> get likedBy =>
      _$this._likedBy ??= new ListBuilder<DocumentReference<Object?>>();
  set likedBy(ListBuilder<DocumentReference<Object?>>? likedBy) =>
      _$this._likedBy = likedBy;

  int? _numLikes;
  int? get numLikes => _$this._numLikes;
  set numLikes(int? numLikes) => _$this._numLikes = numLikes;

  String? _postType;
  String? get postType => _$this._postType;
  set postType(String? postType) => _$this._postType = postType;

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

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RequestPostRecordBuilder() {
    RequestPostRecord._initializeBuilder(this);
  }

  RequestPostRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _postPhoto = $v.postPhoto;
      _postTitle = $v.postTitle;
      _postDescription = $v.postDescription;
      _postUser = $v.postUser;
      _timePosted = $v.timePosted;
      _numComments = $v.numComments;
      _likedBy = $v.likedBy?.toBuilder();
      _numLikes = $v.numLikes;
      _postType = $v.postType;
      _postUserLocation = $v.postUserLocation;
      _postUserPhoto = $v.postUserPhoto;
      _postID = $v.postID;
      _postUserName = $v.postUserName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RequestPostRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RequestPostRecord;
  }

  @override
  void update(void Function(RequestPostRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RequestPostRecord build() => _build();

  _$RequestPostRecord _build() {
    _$RequestPostRecord _$result;
    try {
      _$result = _$v ??
          new _$RequestPostRecord._(
              postPhoto: postPhoto,
              postTitle: postTitle,
              postDescription: postDescription,
              postUser: postUser,
              timePosted: timePosted,
              numComments: numComments,
              likedBy: _likedBy?.build(),
              numLikes: numLikes,
              postType: postType,
              postUserLocation: postUserLocation,
              postUserPhoto: postUserPhoto,
              postID: postID,
              postUserName: postUserName,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'likedBy';
        _likedBy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RequestPostRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
