// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jops_types_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<JopsTypesStruct> _$jopsTypesStructSerializer =
    new _$JopsTypesStructSerializer();

class _$JopsTypesStructSerializer
    implements StructuredSerializer<JopsTypesStruct> {
  @override
  final Iterable<Type> types = const [JopsTypesStruct, _$JopsTypesStruct];
  @override
  final String wireName = 'JopsTypesStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, JopsTypesStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.sadas;
    if (value != null) {
      result
        ..add('sadas')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  JopsTypesStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new JopsTypesStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'sadas':
          result.sadas = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$JopsTypesStruct extends JopsTypesStruct {
  @override
  final String? sadas;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$JopsTypesStruct([void Function(JopsTypesStructBuilder)? updates]) =>
      (new JopsTypesStructBuilder()..update(updates))._build();

  _$JopsTypesStruct._({this.sadas, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'JopsTypesStruct', 'firestoreUtilData');
  }

  @override
  JopsTypesStruct rebuild(void Function(JopsTypesStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JopsTypesStructBuilder toBuilder() =>
      new JopsTypesStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JopsTypesStruct &&
        sadas == other.sadas &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, sadas.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JopsTypesStruct')
          ..add('sadas', sadas)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class JopsTypesStructBuilder
    implements Builder<JopsTypesStruct, JopsTypesStructBuilder> {
  _$JopsTypesStruct? _$v;

  String? _sadas;
  String? get sadas => _$this._sadas;
  set sadas(String? sadas) => _$this._sadas = sadas;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  JopsTypesStructBuilder() {
    JopsTypesStruct._initializeBuilder(this);
  }

  JopsTypesStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sadas = $v.sadas;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JopsTypesStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$JopsTypesStruct;
  }

  @override
  void update(void Function(JopsTypesStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JopsTypesStruct build() => _build();

  _$JopsTypesStruct _build() {
    final _$result = _$v ??
        new _$JopsTypesStruct._(
            sadas: sadas,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'JopsTypesStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
