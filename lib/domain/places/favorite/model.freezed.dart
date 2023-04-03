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
mixin _$FavoritePlace {
  PlaceEntity get placeEntity => throw _privateConstructorUsedError;
  PlaceStatus get status => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritePlaceCopyWith<FavoritePlace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritePlaceCopyWith<$Res> {
  factory $FavoritePlaceCopyWith(
          FavoritePlace value, $Res Function(FavoritePlace) then) =
      _$FavoritePlaceCopyWithImpl<$Res, FavoritePlace>;
  @useResult
  $Res call({PlaceEntity placeEntity, PlaceStatus status, int priority});
}

/// @nodoc
class _$FavoritePlaceCopyWithImpl<$Res, $Val extends FavoritePlace>
    implements $FavoritePlaceCopyWith<$Res> {
  _$FavoritePlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeEntity = null,
    Object? status = null,
    Object? priority = null,
  }) {
    return _then(_value.copyWith(
      placeEntity: null == placeEntity
          ? _value.placeEntity
          : placeEntity // ignore: cast_nullable_to_non_nullable
              as PlaceEntity,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PlaceStatus,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavoritePlaceCopyWith<$Res>
    implements $FavoritePlaceCopyWith<$Res> {
  factory _$$_FavoritePlaceCopyWith(
          _$_FavoritePlace value, $Res Function(_$_FavoritePlace) then) =
      __$$_FavoritePlaceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlaceEntity placeEntity, PlaceStatus status, int priority});
}

/// @nodoc
class __$$_FavoritePlaceCopyWithImpl<$Res>
    extends _$FavoritePlaceCopyWithImpl<$Res, _$_FavoritePlace>
    implements _$$_FavoritePlaceCopyWith<$Res> {
  __$$_FavoritePlaceCopyWithImpl(
      _$_FavoritePlace _value, $Res Function(_$_FavoritePlace) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeEntity = null,
    Object? status = null,
    Object? priority = null,
  }) {
    return _then(_$_FavoritePlace(
      placeEntity: null == placeEntity
          ? _value.placeEntity
          : placeEntity // ignore: cast_nullable_to_non_nullable
              as PlaceEntity,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PlaceStatus,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FavoritePlace extends _FavoritePlace {
  const _$_FavoritePlace(
      {required this.placeEntity, required this.status, required this.priority})
      : super._();

  @override
  final PlaceEntity placeEntity;
  @override
  final PlaceStatus status;
  @override
  final int priority;

  @override
  String toString() {
    return 'FavoritePlace(placeEntity: $placeEntity, status: $status, priority: $priority)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoritePlace &&
            (identical(other.placeEntity, placeEntity) ||
                other.placeEntity == placeEntity) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @override
  int get hashCode => Object.hash(runtimeType, placeEntity, status, priority);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoritePlaceCopyWith<_$_FavoritePlace> get copyWith =>
      __$$_FavoritePlaceCopyWithImpl<_$_FavoritePlace>(this, _$identity);
}

abstract class _FavoritePlace extends FavoritePlace {
  const factory _FavoritePlace(
      {required final PlaceEntity placeEntity,
      required final PlaceStatus status,
      required final int priority}) = _$_FavoritePlace;
  const _FavoritePlace._() : super._();

  @override
  PlaceEntity get placeEntity;
  @override
  PlaceStatus get status;
  @override
  int get priority;
  @override
  @JsonKey(ignore: true)
  _$$_FavoritePlaceCopyWith<_$_FavoritePlace> get copyWith =>
      throw _privateConstructorUsedError;
}
