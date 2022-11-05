// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
    value = object.userGender;
    if (value != null) {
      result
        ..add('user_gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userLocation;
    if (value != null) {
      result
        ..add('user_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userWork;
    if (value != null) {
      result
        ..add('user_work')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userBio;
    if (value != null) {
      result
        ..add('user_bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updatedTime;
    if (value != null) {
      result
        ..add('updated_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.likedPosts;
    if (value != null) {
      result
        ..add('liked_posts')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.userRate;
    if (value != null) {
      result
        ..add('user_rate')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.allPosts;
    if (value != null) {
      result
        ..add('all_posts')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.searchHistory;
    if (value != null) {
      result
        ..add('search_history')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.allReviewsAboutMe;
    if (value != null) {
      result
        ..add('all_reviews_about_me')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.allReviewsByMe;
    if (value != null) {
      result
        ..add('all_reviews_by_me')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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
        case 'user_gender':
          result.userGender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_location':
          result.userLocation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_work':
          result.userWork = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_bio':
          result.userBio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updated_time':
          result.updatedTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'liked_posts':
          result.likedPosts.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'user_rate':
          result.userRate.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'all_posts':
          result.allPosts.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'search_history':
          result.searchHistory.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'all_reviews_about_me':
          result.allReviewsAboutMe.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'all_reviews_by_me':
          result.allReviewsByMe.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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

class _$UsersRecord extends UsersRecord {
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
  final String? userGender;
  @override
  final String? userLocation;
  @override
  final String? userWork;
  @override
  final String? userBio;
  @override
  final DateTime? updatedTime;
  @override
  final BuiltList<DocumentReference<Object?>>? likedPosts;
  @override
  final BuiltList<double>? userRate;
  @override
  final BuiltList<DocumentReference<Object?>>? allPosts;
  @override
  final BuiltList<String>? searchHistory;
  @override
  final BuiltList<DocumentReference<Object?>>? allReviewsAboutMe;
  @override
  final BuiltList<DocumentReference<Object?>>? allReviewsByMe;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.userGender,
      this.userLocation,
      this.userWork,
      this.userBio,
      this.updatedTime,
      this.likedPosts,
      this.userRate,
      this.allPosts,
      this.searchHistory,
      this.allReviewsAboutMe,
      this.allReviewsByMe,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        userGender == other.userGender &&
        userLocation == other.userLocation &&
        userWork == other.userWork &&
        userBio == other.userBio &&
        updatedTime == other.updatedTime &&
        likedPosts == other.likedPosts &&
        userRate == other.userRate &&
        allPosts == other.allPosts &&
        searchHistory == other.searchHistory &&
        allReviewsAboutMe == other.allReviewsAboutMe &&
        allReviewsByMe == other.allReviewsByMe &&
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
                                                                            0,
                                                                            email
                                                                                .hashCode),
                                                                        displayName
                                                                            .hashCode),
                                                                    photoUrl
                                                                        .hashCode),
                                                                uid.hashCode),
                                                            createdTime
                                                                .hashCode),
                                                        phoneNumber.hashCode),
                                                    userGender.hashCode),
                                                userLocation.hashCode),
                                            userWork.hashCode),
                                        userBio.hashCode),
                                    updatedTime.hashCode),
                                likedPosts.hashCode),
                            userRate.hashCode),
                        allPosts.hashCode),
                    searchHistory.hashCode),
                allReviewsAboutMe.hashCode),
            allReviewsByMe.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('userGender', userGender)
          ..add('userLocation', userLocation)
          ..add('userWork', userWork)
          ..add('userBio', userBio)
          ..add('updatedTime', updatedTime)
          ..add('likedPosts', likedPosts)
          ..add('userRate', userRate)
          ..add('allPosts', allPosts)
          ..add('searchHistory', searchHistory)
          ..add('allReviewsAboutMe', allReviewsAboutMe)
          ..add('allReviewsByMe', allReviewsByMe)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

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

  String? _userGender;
  String? get userGender => _$this._userGender;
  set userGender(String? userGender) => _$this._userGender = userGender;

  String? _userLocation;
  String? get userLocation => _$this._userLocation;
  set userLocation(String? userLocation) => _$this._userLocation = userLocation;

  String? _userWork;
  String? get userWork => _$this._userWork;
  set userWork(String? userWork) => _$this._userWork = userWork;

  String? _userBio;
  String? get userBio => _$this._userBio;
  set userBio(String? userBio) => _$this._userBio = userBio;

  DateTime? _updatedTime;
  DateTime? get updatedTime => _$this._updatedTime;
  set updatedTime(DateTime? updatedTime) => _$this._updatedTime = updatedTime;

  ListBuilder<DocumentReference<Object?>>? _likedPosts;
  ListBuilder<DocumentReference<Object?>> get likedPosts =>
      _$this._likedPosts ??= new ListBuilder<DocumentReference<Object?>>();
  set likedPosts(ListBuilder<DocumentReference<Object?>>? likedPosts) =>
      _$this._likedPosts = likedPosts;

  ListBuilder<double>? _userRate;
  ListBuilder<double> get userRate =>
      _$this._userRate ??= new ListBuilder<double>();
  set userRate(ListBuilder<double>? userRate) => _$this._userRate = userRate;

  ListBuilder<DocumentReference<Object?>>? _allPosts;
  ListBuilder<DocumentReference<Object?>> get allPosts =>
      _$this._allPosts ??= new ListBuilder<DocumentReference<Object?>>();
  set allPosts(ListBuilder<DocumentReference<Object?>>? allPosts) =>
      _$this._allPosts = allPosts;

  ListBuilder<String>? _searchHistory;
  ListBuilder<String> get searchHistory =>
      _$this._searchHistory ??= new ListBuilder<String>();
  set searchHistory(ListBuilder<String>? searchHistory) =>
      _$this._searchHistory = searchHistory;

  ListBuilder<DocumentReference<Object?>>? _allReviewsAboutMe;
  ListBuilder<DocumentReference<Object?>> get allReviewsAboutMe =>
      _$this._allReviewsAboutMe ??=
          new ListBuilder<DocumentReference<Object?>>();
  set allReviewsAboutMe(
          ListBuilder<DocumentReference<Object?>>? allReviewsAboutMe) =>
      _$this._allReviewsAboutMe = allReviewsAboutMe;

  ListBuilder<DocumentReference<Object?>>? _allReviewsByMe;
  ListBuilder<DocumentReference<Object?>> get allReviewsByMe =>
      _$this._allReviewsByMe ??= new ListBuilder<DocumentReference<Object?>>();
  set allReviewsByMe(ListBuilder<DocumentReference<Object?>>? allReviewsByMe) =>
      _$this._allReviewsByMe = allReviewsByMe;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _userGender = $v.userGender;
      _userLocation = $v.userLocation;
      _userWork = $v.userWork;
      _userBio = $v.userBio;
      _updatedTime = $v.updatedTime;
      _likedPosts = $v.likedPosts?.toBuilder();
      _userRate = $v.userRate?.toBuilder();
      _allPosts = $v.allPosts?.toBuilder();
      _searchHistory = $v.searchHistory?.toBuilder();
      _allReviewsAboutMe = $v.allReviewsAboutMe?.toBuilder();
      _allReviewsByMe = $v.allReviewsByMe?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              userGender: userGender,
              userLocation: userLocation,
              userWork: userWork,
              userBio: userBio,
              updatedTime: updatedTime,
              likedPosts: _likedPosts?.build(),
              userRate: _userRate?.build(),
              allPosts: _allPosts?.build(),
              searchHistory: _searchHistory?.build(),
              allReviewsAboutMe: _allReviewsAboutMe?.build(),
              allReviewsByMe: _allReviewsByMe?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'likedPosts';
        _likedPosts?.build();
        _$failedField = 'userRate';
        _userRate?.build();
        _$failedField = 'allPosts';
        _allPosts?.build();
        _$failedField = 'searchHistory';
        _searchHistory?.build();
        _$failedField = 'allReviewsAboutMe';
        _allReviewsAboutMe?.build();
        _$failedField = 'allReviewsByMe';
        _allReviewsByMe?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
