// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_types_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<JobsTypesRecord> _$jobsTypesRecordSerializer =
    new _$JobsTypesRecordSerializer();

class _$JobsTypesRecordSerializer
    implements StructuredSerializer<JobsTypesRecord> {
  @override
  final Iterable<Type> types = const [JobsTypesRecord, _$JobsTypesRecord];
  @override
  final String wireName = 'JobsTypesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, JobsTypesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.jobsTypes;
    if (value != null) {
      result
        ..add('jobsTypes')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  JobsTypesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new JobsTypesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'jobsTypes':
          result.jobsTypes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$JobsTypesRecord extends JobsTypesRecord {
  @override
  final BuiltList<String>? jobsTypes;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$JobsTypesRecord([void Function(JobsTypesRecordBuilder)? updates]) =>
      (new JobsTypesRecordBuilder()..update(updates))._build();

  _$JobsTypesRecord._({this.jobsTypes, this.ffRef}) : super._();

  @override
  JobsTypesRecord rebuild(void Function(JobsTypesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JobsTypesRecordBuilder toBuilder() =>
      new JobsTypesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JobsTypesRecord &&
        jobsTypes == other.jobsTypes &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, jobsTypes.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JobsTypesRecord')
          ..add('jobsTypes', jobsTypes)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class JobsTypesRecordBuilder
    implements Builder<JobsTypesRecord, JobsTypesRecordBuilder> {
  _$JobsTypesRecord? _$v;

  ListBuilder<String>? _jobsTypes;
  ListBuilder<String> get jobsTypes =>
      _$this._jobsTypes ??= new ListBuilder<String>();
  set jobsTypes(ListBuilder<String>? jobsTypes) =>
      _$this._jobsTypes = jobsTypes;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  JobsTypesRecordBuilder() {
    JobsTypesRecord._initializeBuilder(this);
  }

  JobsTypesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _jobsTypes = $v.jobsTypes?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JobsTypesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$JobsTypesRecord;
  }

  @override
  void update(void Function(JobsTypesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JobsTypesRecord build() => _build();

  _$JobsTypesRecord _build() {
    _$JobsTypesRecord _$result;
    try {
      _$result = _$v ??
          new _$JobsTypesRecord._(jobsTypes: _jobsTypes?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'jobsTypes';
        _jobsTypes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'JobsTypesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
