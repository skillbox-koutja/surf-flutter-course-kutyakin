// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'selector.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategorySelector {
  BuiltList<CategoryOption> get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategorySelectorCopyWith<CategorySelector> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorySelectorCopyWith<$Res> {
  factory $CategorySelectorCopyWith(
          CategorySelector value, $Res Function(CategorySelector) then) =
      _$CategorySelectorCopyWithImpl<$Res, CategorySelector>;
  @useResult
  $Res call({BuiltList<CategoryOption> list});
}

/// @nodoc
class _$CategorySelectorCopyWithImpl<$Res, $Val extends CategorySelector>
    implements $CategorySelectorCopyWith<$Res> {
  _$CategorySelectorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as BuiltList<CategoryOption>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategorySelectorCopyWith<$Res>
    implements $CategorySelectorCopyWith<$Res> {
  factory _$$_CategorySelectorCopyWith(
          _$_CategorySelector value, $Res Function(_$_CategorySelector) then) =
      __$$_CategorySelectorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuiltList<CategoryOption> list});
}

/// @nodoc
class __$$_CategorySelectorCopyWithImpl<$Res>
    extends _$CategorySelectorCopyWithImpl<$Res, _$_CategorySelector>
    implements _$$_CategorySelectorCopyWith<$Res> {
  __$$_CategorySelectorCopyWithImpl(
      _$_CategorySelector _value, $Res Function(_$_CategorySelector) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$_CategorySelector(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as BuiltList<CategoryOption>,
    ));
  }
}

/// @nodoc

class _$_CategorySelector extends _CategorySelector {
  _$_CategorySelector({required this.list}) : super._();

  @override
  final BuiltList<CategoryOption> list;

  @override
  String toString() {
    return 'CategorySelector(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategorySelector &&
            const DeepCollectionEquality().equals(other.list, list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategorySelectorCopyWith<_$_CategorySelector> get copyWith =>
      __$$_CategorySelectorCopyWithImpl<_$_CategorySelector>(this, _$identity);
}

abstract class _CategorySelector extends CategorySelector {
  factory _CategorySelector({required final BuiltList<CategoryOption> list}) =
      _$_CategorySelector;
  _CategorySelector._() : super._();

  @override
  BuiltList<CategoryOption> get list;
  @override
  @JsonKey(ignore: true)
  _$$_CategorySelectorCopyWith<_$_CategorySelector> get copyWith =>
      throw _privateConstructorUsedError;
}
