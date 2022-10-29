// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reveiws_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReveiwsRecord> _$reveiwsRecordSerializer =
    new _$ReveiwsRecordSerializer();

class _$ReveiwsRecordSerializer implements StructuredSerializer<ReveiwsRecord> {
  @override
  final Iterable<Type> types = const [ReveiwsRecord, _$ReveiwsRecord];
  @override
  final String wireName = 'ReveiwsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReveiwsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.reviewText;
    if (value != null) {
      result
        ..add('review_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.reviewUserPhoto;
    if (value != null) {
      result
        ..add('review_user_photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reviewedBy;
    if (value != null) {
      result
        ..add('reviewed_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  ReveiwsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReveiwsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'review_text':
          result.reviewText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'review_user_photo':
          result.reviewUserPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'reviewed_by':
          result.reviewedBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$ReveiwsRecord extends ReveiwsRecord {
  @override
  final DateTime? createdAt;
  @override
  final String? reviewText;
  @override
  final int? rating;
  @override
  final String? reviewUserPhoto;
  @override
  final DocumentReference<Object?>? reviewedBy;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ReveiwsRecord([void Function(ReveiwsRecordBuilder)? updates]) =>
      (new ReveiwsRecordBuilder()..update(updates))._build();

  _$ReveiwsRecord._(
      {this.createdAt,
      this.reviewText,
      this.rating,
      this.reviewUserPhoto,
      this.reviewedBy,
      this.ffRef})
      : super._();

  @override
  ReveiwsRecord rebuild(void Function(ReveiwsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReveiwsRecordBuilder toBuilder() => new ReveiwsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReveiwsRecord &&
        createdAt == other.createdAt &&
        reviewText == other.reviewText &&
        rating == other.rating &&
        reviewUserPhoto == other.reviewUserPhoto &&
        reviewedBy == other.reviewedBy &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, createdAt.hashCode), reviewText.hashCode),
                    rating.hashCode),
                reviewUserPhoto.hashCode),
            reviewedBy.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReveiwsRecord')
          ..add('createdAt', createdAt)
          ..add('reviewText', reviewText)
          ..add('rating', rating)
          ..add('reviewUserPhoto', reviewUserPhoto)
          ..add('reviewedBy', reviewedBy)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ReveiwsRecordBuilder
    implements Builder<ReveiwsRecord, ReveiwsRecordBuilder> {
  _$ReveiwsRecord? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _reviewText;
  String? get reviewText => _$this._reviewText;
  set reviewText(String? reviewText) => _$this._reviewText = reviewText;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  String? _reviewUserPhoto;
  String? get reviewUserPhoto => _$this._reviewUserPhoto;
  set reviewUserPhoto(String? reviewUserPhoto) =>
      _$this._reviewUserPhoto = reviewUserPhoto;

  DocumentReference<Object?>? _reviewedBy;
  DocumentReference<Object?>? get reviewedBy => _$this._reviewedBy;
  set reviewedBy(DocumentReference<Object?>? reviewedBy) =>
      _$this._reviewedBy = reviewedBy;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ReveiwsRecordBuilder() {
    ReveiwsRecord._initializeBuilder(this);
  }

  ReveiwsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _reviewText = $v.reviewText;
      _rating = $v.rating;
      _reviewUserPhoto = $v.reviewUserPhoto;
      _reviewedBy = $v.reviewedBy;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReveiwsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReveiwsRecord;
  }

  @override
  void update(void Function(ReveiwsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReveiwsRecord build() => _build();

  _$ReveiwsRecord _build() {
    final _$result = _$v ??
        new _$ReveiwsRecord._(
            createdAt: createdAt,
            reviewText: reviewText,
            rating: rating,
            reviewUserPhoto: reviewUserPhoto,
            reviewedBy: reviewedBy,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
