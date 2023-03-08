// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchPlaceRequest _$SearchPlaceRequestFromJson(Map<String, dynamic> json) {
  return _SearchPlaceRequest.fromJson(json);
}

/// @nodoc
mixin _$SearchPlaceRequest {
  String? get nameFilter => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lng => throw _privateConstructorUsedError;
  double? get radius => throw _privateConstructorUsedError;
  List<String>? get typeFilter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchPlaceRequestCopyWith<SearchPlaceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPlaceRequestCopyWith<$Res> {
  factory $SearchPlaceRequestCopyWith(
          SearchPlaceRequest value, $Res Function(SearchPlaceRequest) then) =
      _$SearchPlaceRequestCopyWithImpl<$Res, SearchPlaceRequest>;
  @useResult
  $Res call(
      {String? nameFilter,
      double? lat,
      double? lng,
      double? radius,
      List<String>? typeFilter});
}

/// @nodoc
class _$SearchPlaceRequestCopyWithImpl<$Res, $Val extends SearchPlaceRequest>
    implements $SearchPlaceRequestCopyWith<$Res> {
  _$SearchPlaceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameFilter = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? radius = freezed,
    Object? typeFilter = freezed,
  }) {
    return _then(_value.copyWith(
      nameFilter: freezed == nameFilter
          ? _value.nameFilter
          : nameFilter // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double?,
      typeFilter: freezed == typeFilter
          ? _value.typeFilter
          : typeFilter // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchPlaceRequestCopyWith<$Res>
    implements $SearchPlaceRequestCopyWith<$Res> {
  factory _$$_SearchPlaceRequestCopyWith(_$_SearchPlaceRequest value,
          $Res Function(_$_SearchPlaceRequest) then) =
      __$$_SearchPlaceRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? nameFilter,
      double? lat,
      double? lng,
      double? radius,
      List<String>? typeFilter});
}

/// @nodoc
class __$$_SearchPlaceRequestCopyWithImpl<$Res>
    extends _$SearchPlaceRequestCopyWithImpl<$Res, _$_SearchPlaceRequest>
    implements _$$_SearchPlaceRequestCopyWith<$Res> {
  __$$_SearchPlaceRequestCopyWithImpl(
      _$_SearchPlaceRequest _value, $Res Function(_$_SearchPlaceRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameFilter = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? radius = freezed,
    Object? typeFilter = freezed,
  }) {
    return _then(_$_SearchPlaceRequest(
      nameFilter: freezed == nameFilter
          ? _value.nameFilter
          : nameFilter // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double?,
      typeFilter: freezed == typeFilter
          ? _value._typeFilter
          : typeFilter // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchPlaceRequest implements _SearchPlaceRequest {
  const _$_SearchPlaceRequest(
      {this.nameFilter,
      this.lat,
      this.lng,
      this.radius,
      final List<String>? typeFilter})
      : _typeFilter = typeFilter;

  factory _$_SearchPlaceRequest.fromJson(Map<String, dynamic> json) =>
      _$$_SearchPlaceRequestFromJson(json);

  @override
  final String? nameFilter;
  @override
  final double? lat;
  @override
  final double? lng;
  @override
  final double? radius;
  final List<String>? _typeFilter;
  @override
  List<String>? get typeFilter {
    final value = _typeFilter;
    if (value == null) return null;
    if (_typeFilter is EqualUnmodifiableListView) return _typeFilter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchPlaceRequest(nameFilter: $nameFilter, lat: $lat, lng: $lng, radius: $radius, typeFilter: $typeFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchPlaceRequest &&
            (identical(other.nameFilter, nameFilter) ||
                other.nameFilter == nameFilter) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            const DeepCollectionEquality()
                .equals(other._typeFilter, _typeFilter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nameFilter, lat, lng, radius,
      const DeepCollectionEquality().hash(_typeFilter));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchPlaceRequestCopyWith<_$_SearchPlaceRequest> get copyWith =>
      __$$_SearchPlaceRequestCopyWithImpl<_$_SearchPlaceRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchPlaceRequestToJson(
      this,
    );
  }
}

abstract class _SearchPlaceRequest implements SearchPlaceRequest {
  const factory _SearchPlaceRequest(
      {final String? nameFilter,
      final double? lat,
      final double? lng,
      final double? radius,
      final List<String>? typeFilter}) = _$_SearchPlaceRequest;

  factory _SearchPlaceRequest.fromJson(Map<String, dynamic> json) =
      _$_SearchPlaceRequest.fromJson;

  @override
  String? get nameFilter;
  @override
  double? get lat;
  @override
  double? get lng;
  @override
  double? get radius;
  @override
  List<String>? get typeFilter;
  @override
  @JsonKey(ignore: true)
  _$$_SearchPlaceRequestCopyWith<_$_SearchPlaceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
