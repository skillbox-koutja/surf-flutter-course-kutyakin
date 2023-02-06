// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sight.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Sight {
  String get name => throw _privateConstructorUsedError;
  MapCoordinates get coordinates => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  SightType get type => throw _privateConstructorUsedError;
  List<SightPhoto> get photos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SightCopyWith<Sight> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SightCopyWith<$Res> {
  factory $SightCopyWith(Sight value, $Res Function(Sight) then) =
      _$SightCopyWithImpl<$Res, Sight>;
  @useResult
  $Res call(
      {String name,
      MapCoordinates coordinates,
      String details,
      SightType type,
      List<SightPhoto> photos});
}

/// @nodoc
class _$SightCopyWithImpl<$Res, $Val extends Sight>
    implements $SightCopyWith<$Res> {
  _$SightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? coordinates = null,
    Object? details = null,
    Object? type = null,
    Object? photos = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as MapCoordinates,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SightType,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<SightPhoto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SightCopyWith<$Res> implements $SightCopyWith<$Res> {
  factory _$$_SightCopyWith(_$_Sight value, $Res Function(_$_Sight) then) =
      __$$_SightCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      MapCoordinates coordinates,
      String details,
      SightType type,
      List<SightPhoto> photos});
}

/// @nodoc
class __$$_SightCopyWithImpl<$Res> extends _$SightCopyWithImpl<$Res, _$_Sight>
    implements _$$_SightCopyWith<$Res> {
  __$$_SightCopyWithImpl(_$_Sight _value, $Res Function(_$_Sight) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? coordinates = null,
    Object? details = null,
    Object? type = null,
    Object? photos = null,
  }) {
    return _then(_$_Sight(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as MapCoordinates,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SightType,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<SightPhoto>,
    ));
  }
}

/// @nodoc

class _$_Sight extends _Sight {
  const _$_Sight(
      {required this.name,
      required this.coordinates,
      required this.details,
      required this.type,
      required final List<SightPhoto> photos})
      : _photos = photos,
        super._();

  @override
  final String name;
  @override
  final MapCoordinates coordinates;
  @override
  final String details;
  @override
  final SightType type;
  final List<SightPhoto> _photos;
  @override
  List<SightPhoto> get photos {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  String toString() {
    return 'Sight(name: $name, coordinates: $coordinates, details: $details, type: $type, photos: $photos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Sight &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, coordinates, details, type,
      const DeepCollectionEquality().hash(_photos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SightCopyWith<_$_Sight> get copyWith =>
      __$$_SightCopyWithImpl<_$_Sight>(this, _$identity);
}

abstract class _Sight extends Sight {
  const factory _Sight(
      {required final String name,
      required final MapCoordinates coordinates,
      required final String details,
      required final SightType type,
      required final List<SightPhoto> photos}) = _$_Sight;
  const _Sight._() : super._();

  @override
  String get name;
  @override
  MapCoordinates get coordinates;
  @override
  String get details;
  @override
  SightType get type;
  @override
  List<SightPhoto> get photos;
  @override
  @JsonKey(ignore: true)
  _$$_SightCopyWith<_$_Sight> get copyWith =>
      throw _privateConstructorUsedError;
}
