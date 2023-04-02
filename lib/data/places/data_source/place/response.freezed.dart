// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaceDto _$PlaceDtoFromJson(Map<String, dynamic> json) {
  return _PlaceDto.fromJson(json);
}

/// @nodoc
mixin _$PlaceDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get placeType => throw _privateConstructorUsedError;
  List<String> get urls => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceDtoCopyWith<PlaceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDtoCopyWith<$Res> {
  factory $PlaceDtoCopyWith(PlaceDto value, $Res Function(PlaceDto) then) =
      _$PlaceDtoCopyWithImpl<$Res, PlaceDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      double lat,
      double lng,
      String description,
      String placeType,
      List<String> urls});
}

/// @nodoc
class _$PlaceDtoCopyWithImpl<$Res, $Val extends PlaceDto>
    implements $PlaceDtoCopyWith<$Res> {
  _$PlaceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lat = null,
    Object? lng = null,
    Object? description = null,
    Object? placeType = null,
    Object? urls = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      placeType: null == placeType
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as String,
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlaceDtoCopyWith<$Res> implements $PlaceDtoCopyWith<$Res> {
  factory _$$_PlaceDtoCopyWith(
          _$_PlaceDto value, $Res Function(_$_PlaceDto) then) =
      __$$_PlaceDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      double lat,
      double lng,
      String description,
      String placeType,
      List<String> urls});
}

/// @nodoc
class __$$_PlaceDtoCopyWithImpl<$Res>
    extends _$PlaceDtoCopyWithImpl<$Res, _$_PlaceDto>
    implements _$$_PlaceDtoCopyWith<$Res> {
  __$$_PlaceDtoCopyWithImpl(
      _$_PlaceDto _value, $Res Function(_$_PlaceDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lat = null,
    Object? lng = null,
    Object? description = null,
    Object? placeType = null,
    Object? urls = null,
  }) {
    return _then(_$_PlaceDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      placeType: null == placeType
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as String,
      urls: null == urls
          ? _value._urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlaceDto extends _PlaceDto {
  const _$_PlaceDto(
      {required this.id,
      required this.name,
      required this.lat,
      required this.lng,
      required this.description,
      required this.placeType,
      required final List<String> urls})
      : _urls = urls,
        super._();

  factory _$_PlaceDto.fromJson(Map<String, dynamic> json) =>
      _$$_PlaceDtoFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double lat;
  @override
  final double lng;
  @override
  final String description;
  @override
  final String placeType;
  final List<String> _urls;
  @override
  List<String> get urls {
    if (_urls is EqualUnmodifiableListView) return _urls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_urls);
  }

  @override
  String toString() {
    return 'PlaceDto(id: $id, name: $name, lat: $lat, lng: $lng, description: $description, placeType: $placeType, urls: $urls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.placeType, placeType) ||
                other.placeType == placeType) &&
            const DeepCollectionEquality().equals(other._urls, _urls));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, lat, lng, description,
      placeType, const DeepCollectionEquality().hash(_urls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaceDtoCopyWith<_$_PlaceDto> get copyWith =>
      __$$_PlaceDtoCopyWithImpl<_$_PlaceDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaceDtoToJson(
      this,
    );
  }
}

abstract class _PlaceDto extends PlaceDto {
  const factory _PlaceDto(
      {required final int id,
      required final String name,
      required final double lat,
      required final double lng,
      required final String description,
      required final String placeType,
      required final List<String> urls}) = _$_PlaceDto;
  const _PlaceDto._() : super._();

  factory _PlaceDto.fromJson(Map<String, dynamic> json) = _$_PlaceDto.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double get lat;
  @override
  double get lng;
  @override
  String get description;
  @override
  String get placeType;
  @override
  List<String> get urls;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceDtoCopyWith<_$_PlaceDto> get copyWith =>
      throw _privateConstructorUsedError;
}
