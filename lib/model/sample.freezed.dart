// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sample.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Sample _$SampleFromJson(Map<String, dynamic> json) {
  return _Sample.fromJson(json);
}

/// @nodoc
mixin _$Sample {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;

  /// Serializes this Sample to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Sample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SampleCopyWith<Sample> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleCopyWith<$Res> {
  factory $SampleCopyWith(Sample value, $Res Function(Sample) then) =
      _$SampleCopyWithImpl<$Res, Sample>;
  @useResult
  $Res call({String id, String name, int age});
}

/// @nodoc
class _$SampleCopyWithImpl<$Res, $Val extends Sample>
    implements $SampleCopyWith<$Res> {
  _$SampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Sample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? age = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SampleImplCopyWith<$Res> implements $SampleCopyWith<$Res> {
  factory _$$SampleImplCopyWith(
          _$SampleImpl value, $Res Function(_$SampleImpl) then) =
      __$$SampleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, int age});
}

/// @nodoc
class __$$SampleImplCopyWithImpl<$Res>
    extends _$SampleCopyWithImpl<$Res, _$SampleImpl>
    implements _$$SampleImplCopyWith<$Res> {
  __$$SampleImplCopyWithImpl(
      _$SampleImpl _value, $Res Function(_$SampleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Sample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? age = null,
  }) {
    return _then(_$SampleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SampleImpl implements _Sample {
  const _$SampleImpl({required this.id, required this.name, required this.age});

  factory _$SampleImpl.fromJson(Map<String, dynamic> json) =>
      _$$SampleImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int age;

  @override
  String toString() {
    return 'Sample(id: $id, name: $name, age: $age)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SampleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, age);

  /// Create a copy of Sample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SampleImplCopyWith<_$SampleImpl> get copyWith =>
      __$$SampleImplCopyWithImpl<_$SampleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SampleImplToJson(
      this,
    );
  }
}

abstract class _Sample implements Sample {
  const factory _Sample(
      {required final String id,
      required final String name,
      required final int age}) = _$SampleImpl;

  factory _Sample.fromJson(Map<String, dynamic> json) = _$SampleImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get age;

  /// Create a copy of Sample
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SampleImplCopyWith<_$SampleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
