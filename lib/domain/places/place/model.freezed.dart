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
mixin _$Place {
  String get name => throw _privateConstructorUsedError;
  Geo get geo => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  PlaceType get type => throw _privateConstructorUsedError;
  BuiltList<PlacePhoto> get photos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaceCopyWith<Place> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceCopyWith<$Res> {
  factory $PlaceCopyWith(Place value, $Res Function(Place) then) =
      _$PlaceCopyWithImpl<$Res, Place>;
  @useResult
  $Res call(
      {String name,
      Geo geo,
      String details,
      PlaceType type,
      BuiltList<PlacePhoto> photos});
}

/// @nodoc
class _$PlaceCopyWithImpl<$Res, $Val extends Place>
    implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? geo = null,
    Object? details = null,
    Object? type = null,
    Object? photos = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      geo: null == geo
          ? _value.geo
          : geo // ignore: cast_nullable_to_non_nullable
              as Geo,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PlaceType,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as BuiltList<PlacePhoto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlaceCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$$_PlaceCopyWith(_$_Place value, $Res Function(_$_Place) then) =
      __$$_PlaceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      Geo geo,
      String details,
      PlaceType type,
      BuiltList<PlacePhoto> photos});
}

/// @nodoc
class __$$_PlaceCopyWithImpl<$Res> extends _$PlaceCopyWithImpl<$Res, _$_Place>
    implements _$$_PlaceCopyWith<$Res> {
  __$$_PlaceCopyWithImpl(_$_Place _value, $Res Function(_$_Place) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? geo = null,
    Object? details = null,
    Object? type = null,
    Object? photos = null,
  }) {
    return _then(_$_Place(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      geo: null == geo
          ? _value.geo
          : geo // ignore: cast_nullable_to_non_nullable
              as Geo,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PlaceType,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as BuiltList<PlacePhoto>,
    ));
  }
}

/// @nodoc

class _$_Place extends _Place {
  const _$_Place(
      {required this.name,
      required this.geo,
      required this.details,
      required this.type,
      required this.photos})
      : super._();

  @override
  final String name;
  @override
  final Geo geo;
  @override
  final String details;
  @override
  final PlaceType type;
  @override
  final BuiltList<PlacePhoto> photos;

  @override
  String toString() {
    return 'Place(name: $name, geo: $geo, details: $details, type: $type, photos: $photos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Place &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.geo, geo) || other.geo == geo) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.photos, photos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, geo, details, type,
      const DeepCollectionEquality().hash(photos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaceCopyWith<_$_Place> get copyWith =>
      __$$_PlaceCopyWithImpl<_$_Place>(this, _$identity);
}

abstract class _Place extends Place {
  const factory _Place(
      {required final String name,
      required final Geo geo,
      required final String details,
      required final PlaceType type,
      required final BuiltList<PlacePhoto> photos}) = _$_Place;
  const _Place._() : super._();

  @override
  String get name;
  @override
  Geo get geo;
  @override
  String get details;
  @override
  PlaceType get type;
  @override
  BuiltList<PlacePhoto> get photos;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceCopyWith<_$_Place> get copyWith =>
      throw _privateConstructorUsedError;
}
