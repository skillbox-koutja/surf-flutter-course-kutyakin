// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Field<T, E> {
  T get value => throw _privateConstructorUsedError;
  Validator<T> get validator => throw _privateConstructorUsedError;
  BuiltList<E> get errors => throw _privateConstructorUsedError;
  bool get isDirty => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FieldCopyWith<T, E, Field<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldCopyWith<T, E, $Res> {
  factory $FieldCopyWith(Field<T, E> value, $Res Function(Field<T, E>) then) =
      _$FieldCopyWithImpl<T, E, $Res, Field<T, E>>;
  @useResult
  $Res call(
      {T value, Validator<T> validator, BuiltList<E> errors, bool isDirty});
}

/// @nodoc
class _$FieldCopyWithImpl<T, E, $Res, $Val extends Field<T, E>>
    implements $FieldCopyWith<T, E, $Res> {
  _$FieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? validator = null,
    Object? errors = null,
    Object? isDirty = null,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      validator: null == validator
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as Validator<T>,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as BuiltList<E>,
      isDirty: null == isDirty
          ? _value.isDirty
          : isDirty // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FieldCopyWith<T, E, $Res>
    implements $FieldCopyWith<T, E, $Res> {
  factory _$$_FieldCopyWith(
          _$_Field<T, E> value, $Res Function(_$_Field<T, E>) then) =
      __$$_FieldCopyWithImpl<T, E, $Res>;
  @override
  @useResult
  $Res call(
      {T value, Validator<T> validator, BuiltList<E> errors, bool isDirty});
}

/// @nodoc
class __$$_FieldCopyWithImpl<T, E, $Res>
    extends _$FieldCopyWithImpl<T, E, $Res, _$_Field<T, E>>
    implements _$$_FieldCopyWith<T, E, $Res> {
  __$$_FieldCopyWithImpl(
      _$_Field<T, E> _value, $Res Function(_$_Field<T, E>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? validator = null,
    Object? errors = null,
    Object? isDirty = null,
  }) {
    return _then(_$_Field<T, E>(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      validator: null == validator
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as Validator<T>,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as BuiltList<E>,
      isDirty: null == isDirty
          ? _value.isDirty
          : isDirty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Field<T, E> extends _Field<T, E> {
  const _$_Field(
      {required this.value,
      required this.validator,
      required this.errors,
      required this.isDirty})
      : super._();

  @override
  final T value;
  @override
  final Validator<T> validator;
  @override
  final BuiltList<E> errors;
  @override
  final bool isDirty;

  @override
  String toString() {
    return 'Field<$T, $E>(value: $value, validator: $validator, errors: $errors, isDirty: $isDirty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Field<T, E> &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.validator, validator) ||
                other.validator == validator) &&
            const DeepCollectionEquality().equals(other.errors, errors) &&
            (identical(other.isDirty, isDirty) || other.isDirty == isDirty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(value),
      validator,
      const DeepCollectionEquality().hash(errors),
      isDirty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FieldCopyWith<T, E, _$_Field<T, E>> get copyWith =>
      __$$_FieldCopyWithImpl<T, E, _$_Field<T, E>>(this, _$identity);
}

abstract class _Field<T, E> extends Field<T, E> {
  const factory _Field(
      {required final T value,
      required final Validator<T> validator,
      required final BuiltList<E> errors,
      required final bool isDirty}) = _$_Field<T, E>;
  const _Field._() : super._();

  @override
  T get value;
  @override
  Validator<T> get validator;
  @override
  BuiltList<E> get errors;
  @override
  bool get isDirty;
  @override
  @JsonKey(ignore: true)
  _$$_FieldCopyWith<T, E, _$_Field<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}
