// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GeoFilter {
  Geo get geo => throw _privateConstructorUsedError;
  double get radius => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GeoFilterCopyWith<GeoFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoFilterCopyWith<$Res> {
  factory $GeoFilterCopyWith(GeoFilter value, $Res Function(GeoFilter) then) =
      _$GeoFilterCopyWithImpl<$Res, GeoFilter>;
  @useResult
  $Res call({Geo geo, double radius});
}

/// @nodoc
class _$GeoFilterCopyWithImpl<$Res, $Val extends GeoFilter>
    implements $GeoFilterCopyWith<$Res> {
  _$GeoFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geo = null,
    Object? radius = null,
  }) {
    return _then(_value.copyWith(
      geo: null == geo
          ? _value.geo
          : geo // ignore: cast_nullable_to_non_nullable
              as Geo,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GeoFilterCopyWith<$Res> implements $GeoFilterCopyWith<$Res> {
  factory _$$_GeoFilterCopyWith(
          _$_GeoFilter value, $Res Function(_$_GeoFilter) then) =
      __$$_GeoFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Geo geo, double radius});
}

/// @nodoc
class __$$_GeoFilterCopyWithImpl<$Res>
    extends _$GeoFilterCopyWithImpl<$Res, _$_GeoFilter>
    implements _$$_GeoFilterCopyWith<$Res> {
  __$$_GeoFilterCopyWithImpl(
      _$_GeoFilter _value, $Res Function(_$_GeoFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geo = null,
    Object? radius = null,
  }) {
    return _then(_$_GeoFilter(
      geo: null == geo
          ? _value.geo
          : geo // ignore: cast_nullable_to_non_nullable
              as Geo,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_GeoFilter extends _GeoFilter {
  const _$_GeoFilter({required this.geo, required this.radius}) : super._();

  @override
  final Geo geo;
  @override
  final double radius;

  @override
  String toString() {
    return 'GeoFilter(geo: $geo, radius: $radius)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeoFilter &&
            (identical(other.geo, geo) || other.geo == geo) &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @override
  int get hashCode => Object.hash(runtimeType, geo, radius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeoFilterCopyWith<_$_GeoFilter> get copyWith =>
      __$$_GeoFilterCopyWithImpl<_$_GeoFilter>(this, _$identity);
}

abstract class _GeoFilter extends GeoFilter {
  const factory _GeoFilter(
      {required final Geo geo, required final double radius}) = _$_GeoFilter;
  const _GeoFilter._() : super._();

  @override
  Geo get geo;
  @override
  double get radius;
  @override
  @JsonKey(ignore: true)
  _$$_GeoFilterCopyWith<_$_GeoFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
