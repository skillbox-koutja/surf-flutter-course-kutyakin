// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_places_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoritePlacesData {
  bool get loaded => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  Either<Failure, BuiltList<FavoritePlace>> get data =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritePlacesDataCopyWith<FavoritePlacesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritePlacesDataCopyWith<$Res> {
  factory $FavoritePlacesDataCopyWith(
          FavoritePlacesData value, $Res Function(FavoritePlacesData) then) =
      _$FavoritePlacesDataCopyWithImpl<$Res, FavoritePlacesData>;
  @useResult
  $Res call(
      {bool loaded,
      bool loading,
      Either<Failure, BuiltList<FavoritePlace>> data});
}

/// @nodoc
class _$FavoritePlacesDataCopyWithImpl<$Res, $Val extends FavoritePlacesData>
    implements $FavoritePlacesDataCopyWith<$Res> {
  _$FavoritePlacesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loaded = null,
    Object? loading = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      loaded: null == loaded
          ? _value.loaded
          : loaded // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Either<Failure, BuiltList<FavoritePlace>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavoritePlacesDataCopyWith<$Res>
    implements $FavoritePlacesDataCopyWith<$Res> {
  factory _$$_FavoritePlacesDataCopyWith(_$_FavoritePlacesData value,
          $Res Function(_$_FavoritePlacesData) then) =
      __$$_FavoritePlacesDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loaded,
      bool loading,
      Either<Failure, BuiltList<FavoritePlace>> data});
}

/// @nodoc
class __$$_FavoritePlacesDataCopyWithImpl<$Res>
    extends _$FavoritePlacesDataCopyWithImpl<$Res, _$_FavoritePlacesData>
    implements _$$_FavoritePlacesDataCopyWith<$Res> {
  __$$_FavoritePlacesDataCopyWithImpl(
      _$_FavoritePlacesData _value, $Res Function(_$_FavoritePlacesData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loaded = null,
    Object? loading = null,
    Object? data = null,
  }) {
    return _then(_$_FavoritePlacesData(
      loaded: null == loaded
          ? _value.loaded
          : loaded // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Either<Failure, BuiltList<FavoritePlace>>,
    ));
  }
}

/// @nodoc

class _$_FavoritePlacesData extends _FavoritePlacesData {
  const _$_FavoritePlacesData(
      {required this.loaded, required this.loading, required this.data})
      : super._();

  @override
  final bool loaded;
  @override
  final bool loading;
  @override
  final Either<Failure, BuiltList<FavoritePlace>> data;

  @override
  String toString() {
    return 'FavoritePlacesData(loaded: $loaded, loading: $loading, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoritePlacesData &&
            (identical(other.loaded, loaded) || other.loaded == loaded) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loaded, loading, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoritePlacesDataCopyWith<_$_FavoritePlacesData> get copyWith =>
      __$$_FavoritePlacesDataCopyWithImpl<_$_FavoritePlacesData>(
          this, _$identity);
}

abstract class _FavoritePlacesData extends FavoritePlacesData {
  const factory _FavoritePlacesData(
          {required final bool loaded,
          required final bool loading,
          required final Either<Failure, BuiltList<FavoritePlace>> data}) =
      _$_FavoritePlacesData;
  const _FavoritePlacesData._() : super._();

  @override
  bool get loaded;
  @override
  bool get loading;
  @override
  Either<Failure, BuiltList<FavoritePlace>> get data;
  @override
  @JsonKey(ignore: true)
  _$$_FavoritePlacesDataCopyWith<_$_FavoritePlacesData> get copyWith =>
      throw _privateConstructorUsedError;
}
