// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditablePlace {
  BuiltMap<EditablePlaceFieldKeys, Field<dynamic, EditablePlaceError>>
      get fields => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditablePlaceCopyWith<EditablePlace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditablePlaceCopyWith<$Res> {
  factory $EditablePlaceCopyWith(
          EditablePlace value, $Res Function(EditablePlace) then) =
      _$EditablePlaceCopyWithImpl<$Res, EditablePlace>;
  @useResult
  $Res call(
      {BuiltMap<EditablePlaceFieldKeys, Field<dynamic, EditablePlaceError>>
          fields});
}

/// @nodoc
class _$EditablePlaceCopyWithImpl<$Res, $Val extends EditablePlace>
    implements $EditablePlaceCopyWith<$Res> {
  _$EditablePlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fields = null,
  }) {
    return _then(_value.copyWith(
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as BuiltMap<EditablePlaceFieldKeys,
                  Field<dynamic, EditablePlaceError>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditablePlaceCopyWith<$Res>
    implements $EditablePlaceCopyWith<$Res> {
  factory _$$_EditablePlaceCopyWith(
          _$_EditablePlace value, $Res Function(_$_EditablePlace) then) =
      __$$_EditablePlaceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BuiltMap<EditablePlaceFieldKeys, Field<dynamic, EditablePlaceError>>
          fields});
}

/// @nodoc
class __$$_EditablePlaceCopyWithImpl<$Res>
    extends _$EditablePlaceCopyWithImpl<$Res, _$_EditablePlace>
    implements _$$_EditablePlaceCopyWith<$Res> {
  __$$_EditablePlaceCopyWithImpl(
      _$_EditablePlace _value, $Res Function(_$_EditablePlace) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fields = null,
  }) {
    return _then(_$_EditablePlace(
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as BuiltMap<EditablePlaceFieldKeys,
                  Field<dynamic, EditablePlaceError>>,
    ));
  }
}

/// @nodoc

class _$_EditablePlace extends _EditablePlace {
  const _$_EditablePlace({required this.fields}) : super._();

  @override
  final BuiltMap<EditablePlaceFieldKeys, Field<dynamic, EditablePlaceError>>
      fields;

  @override
  String toString() {
    return 'EditablePlace(fields: $fields)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditablePlace &&
            (identical(other.fields, fields) || other.fields == fields));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fields);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditablePlaceCopyWith<_$_EditablePlace> get copyWith =>
      __$$_EditablePlaceCopyWithImpl<_$_EditablePlace>(this, _$identity);
}

abstract class _EditablePlace extends EditablePlace {
  const factory _EditablePlace(
      {required final BuiltMap<EditablePlaceFieldKeys,
              Field<dynamic, EditablePlaceError>>
          fields}) = _$_EditablePlace;
  const _EditablePlace._() : super._();

  @override
  BuiltMap<EditablePlaceFieldKeys, Field<dynamic, EditablePlaceError>>
      get fields;
  @override
  @JsonKey(ignore: true)
  _$$_EditablePlaceCopyWith<_$_EditablePlace> get copyWith =>
      throw _privateConstructorUsedError;
}
