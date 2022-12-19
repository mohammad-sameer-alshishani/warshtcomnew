// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReportsRecord> _$reportsRecordSerializer =
    new _$ReportsRecordSerializer();

class _$ReportsRecordSerializer implements StructuredSerializer<ReportsRecord> {
  @override
  final Iterable<Type> types = const [ReportsRecord, _$ReportsRecord];
  @override
  final String wireName = 'ReportsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReportsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.reportedByRef;
    if (value != null) {
      result
        ..add('reported_by_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.reportPhoto;
    if (value != null) {
      result
        ..add('report_photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reportText;
    if (value != null) {
      result
        ..add('report_text')
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
  ReportsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReportsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'reported_by_ref':
          result.reportedByRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'report_photo':
          result.reportPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'report_text':
          result.reportText = serializers.deserialize(value,
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

class _$ReportsRecord extends ReportsRecord {
  @override
  final DocumentReference<Object?>? reportedByRef;
  @override
  final String? reportPhoto;
  @override
  final String? reportText;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ReportsRecord([void Function(ReportsRecordBuilder)? updates]) =>
      (new ReportsRecordBuilder()..update(updates))._build();

  _$ReportsRecord._(
      {this.reportedByRef, this.reportPhoto, this.reportText, this.ffRef})
      : super._();

  @override
  ReportsRecord rebuild(void Function(ReportsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportsRecordBuilder toBuilder() => new ReportsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportsRecord &&
        reportedByRef == other.reportedByRef &&
        reportPhoto == other.reportPhoto &&
        reportText == other.reportText &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, reportedByRef.hashCode), reportPhoto.hashCode),
            reportText.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReportsRecord')
          ..add('reportedByRef', reportedByRef)
          ..add('reportPhoto', reportPhoto)
          ..add('reportText', reportText)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ReportsRecordBuilder
    implements Builder<ReportsRecord, ReportsRecordBuilder> {
  _$ReportsRecord? _$v;

  DocumentReference<Object?>? _reportedByRef;
  DocumentReference<Object?>? get reportedByRef => _$this._reportedByRef;
  set reportedByRef(DocumentReference<Object?>? reportedByRef) =>
      _$this._reportedByRef = reportedByRef;

  String? _reportPhoto;
  String? get reportPhoto => _$this._reportPhoto;
  set reportPhoto(String? reportPhoto) => _$this._reportPhoto = reportPhoto;

  String? _reportText;
  String? get reportText => _$this._reportText;
  set reportText(String? reportText) => _$this._reportText = reportText;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ReportsRecordBuilder() {
    ReportsRecord._initializeBuilder(this);
  }

  ReportsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reportedByRef = $v.reportedByRef;
      _reportPhoto = $v.reportPhoto;
      _reportText = $v.reportText;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReportsRecord;
  }

  @override
  void update(void Function(ReportsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportsRecord build() => _build();

  _$ReportsRecord _build() {
    final _$result = _$v ??
        new _$ReportsRecord._(
            reportedByRef: reportedByRef,
            reportPhoto: reportPhoto,
            reportText: reportText,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
