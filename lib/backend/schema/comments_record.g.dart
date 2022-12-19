// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommentsRecord> _$commentsRecordSerializer =
    new _$CommentsRecordSerializer();

class _$CommentsRecordSerializer
    implements StructuredSerializer<CommentsRecord> {
  @override
  final Iterable<Type> types = const [CommentsRecord, _$CommentsRecord];
  @override
  final String wireName = 'CommentsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CommentsRecord object,
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
    value = object.commentText;
    if (value != null) {
      result
        ..add('comment_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.commentedByRef;
    if (value != null) {
      result
        ..add('commented_by_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.commentedPost;
    if (value != null) {
      result
        ..add('commented_post')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.commentedPostUserRef;
    if (value != null) {
      result
        ..add('commented_post_user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.commentedByUserPhoto;
    if (value != null) {
      result
        ..add('commented_by_user_photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.commentedPostId;
    if (value != null) {
      result
        ..add('commented_post_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.commentedById;
    if (value != null) {
      result
        ..add('commented_by_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.commentedRequestPost;
    if (value != null) {
      result
        ..add('commented_request_post')
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
  CommentsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommentsRecordBuilder();

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
        case 'comment_text':
          result.commentText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'commented_by_ref':
          result.commentedByRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'commented_post':
          result.commentedPost = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'commented_post_user_ref':
          result.commentedPostUserRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'commented_by_user_photo':
          result.commentedByUserPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'commented_post_id':
          result.commentedPostId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'commented_by_id':
          result.commentedById = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'commented_request_post':
          result.commentedRequestPost = serializers.deserialize(value,
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

class _$CommentsRecord extends CommentsRecord {
  @override
  final DateTime? createdAt;
  @override
  final String? commentText;
  @override
  final DocumentReference<Object?>? commentedByRef;
  @override
  final DocumentReference<Object?>? commentedPost;
  @override
  final DocumentReference<Object?>? commentedPostUserRef;
  @override
  final String? commentedByUserPhoto;
  @override
  final String? commentedPostId;
  @override
  final String? commentedById;
  @override
  final DocumentReference<Object?>? commentedRequestPost;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CommentsRecord([void Function(CommentsRecordBuilder)? updates]) =>
      (new CommentsRecordBuilder()..update(updates))._build();

  _$CommentsRecord._(
      {this.createdAt,
      this.commentText,
      this.commentedByRef,
      this.commentedPost,
      this.commentedPostUserRef,
      this.commentedByUserPhoto,
      this.commentedPostId,
      this.commentedById,
      this.commentedRequestPost,
      this.ffRef})
      : super._();

  @override
  CommentsRecord rebuild(void Function(CommentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentsRecordBuilder toBuilder() =>
      new CommentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentsRecord &&
        createdAt == other.createdAt &&
        commentText == other.commentText &&
        commentedByRef == other.commentedByRef &&
        commentedPost == other.commentedPost &&
        commentedPostUserRef == other.commentedPostUserRef &&
        commentedByUserPhoto == other.commentedByUserPhoto &&
        commentedPostId == other.commentedPostId &&
        commentedById == other.commentedById &&
        commentedRequestPost == other.commentedRequestPost &&
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
                                    $jc($jc(0, createdAt.hashCode),
                                        commentText.hashCode),
                                    commentedByRef.hashCode),
                                commentedPost.hashCode),
                            commentedPostUserRef.hashCode),
                        commentedByUserPhoto.hashCode),
                    commentedPostId.hashCode),
                commentedById.hashCode),
            commentedRequestPost.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommentsRecord')
          ..add('createdAt', createdAt)
          ..add('commentText', commentText)
          ..add('commentedByRef', commentedByRef)
          ..add('commentedPost', commentedPost)
          ..add('commentedPostUserRef', commentedPostUserRef)
          ..add('commentedByUserPhoto', commentedByUserPhoto)
          ..add('commentedPostId', commentedPostId)
          ..add('commentedById', commentedById)
          ..add('commentedRequestPost', commentedRequestPost)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CommentsRecordBuilder
    implements Builder<CommentsRecord, CommentsRecordBuilder> {
  _$CommentsRecord? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _commentText;
  String? get commentText => _$this._commentText;
  set commentText(String? commentText) => _$this._commentText = commentText;

  DocumentReference<Object?>? _commentedByRef;
  DocumentReference<Object?>? get commentedByRef => _$this._commentedByRef;
  set commentedByRef(DocumentReference<Object?>? commentedByRef) =>
      _$this._commentedByRef = commentedByRef;

  DocumentReference<Object?>? _commentedPost;
  DocumentReference<Object?>? get commentedPost => _$this._commentedPost;
  set commentedPost(DocumentReference<Object?>? commentedPost) =>
      _$this._commentedPost = commentedPost;

  DocumentReference<Object?>? _commentedPostUserRef;
  DocumentReference<Object?>? get commentedPostUserRef =>
      _$this._commentedPostUserRef;
  set commentedPostUserRef(DocumentReference<Object?>? commentedPostUserRef) =>
      _$this._commentedPostUserRef = commentedPostUserRef;

  String? _commentedByUserPhoto;
  String? get commentedByUserPhoto => _$this._commentedByUserPhoto;
  set commentedByUserPhoto(String? commentedByUserPhoto) =>
      _$this._commentedByUserPhoto = commentedByUserPhoto;

  String? _commentedPostId;
  String? get commentedPostId => _$this._commentedPostId;
  set commentedPostId(String? commentedPostId) =>
      _$this._commentedPostId = commentedPostId;

  String? _commentedById;
  String? get commentedById => _$this._commentedById;
  set commentedById(String? commentedById) =>
      _$this._commentedById = commentedById;

  DocumentReference<Object?>? _commentedRequestPost;
  DocumentReference<Object?>? get commentedRequestPost =>
      _$this._commentedRequestPost;
  set commentedRequestPost(DocumentReference<Object?>? commentedRequestPost) =>
      _$this._commentedRequestPost = commentedRequestPost;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CommentsRecordBuilder() {
    CommentsRecord._initializeBuilder(this);
  }

  CommentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _commentText = $v.commentText;
      _commentedByRef = $v.commentedByRef;
      _commentedPost = $v.commentedPost;
      _commentedPostUserRef = $v.commentedPostUserRef;
      _commentedByUserPhoto = $v.commentedByUserPhoto;
      _commentedPostId = $v.commentedPostId;
      _commentedById = $v.commentedById;
      _commentedRequestPost = $v.commentedRequestPost;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentsRecord;
  }

  @override
  void update(void Function(CommentsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommentsRecord build() => _build();

  _$CommentsRecord _build() {
    final _$result = _$v ??
        new _$CommentsRecord._(
            createdAt: createdAt,
            commentText: commentText,
            commentedByRef: commentedByRef,
            commentedPost: commentedPost,
            commentedPostUserRef: commentedPostUserRef,
            commentedByUserPhoto: commentedByUserPhoto,
            commentedPostId: commentedPostId,
            commentedById: commentedById,
            commentedRequestPost: commentedRequestPost,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
