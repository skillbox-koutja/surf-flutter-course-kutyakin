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

EditPlaceRequest _$EditPlaceRequestFromJson(Map<String, dynamic> json) {
  return _EditPlaceRequest.fromJson(json);
}

/// @nodoc
mixin _$EditPlaceRequest {
  String? get name => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lng => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get placeType => throw _privateConstructorUsedError;
  List<String>? get urls => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditPlaceRequestCopyWith<EditPlaceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditPlaceRequestCopyWith<$Res> {
  factory $EditPlaceRequestCopyWith(
          EditPlaceRequest value, $Res Function(EditPlaceRequest) then) =
      _$EditPlaceRequestCopyWithImpl<$Res, EditPlaceRequest>;
  @useResult
  $Res call(
      {String? name,
      double? lat,
      double? lng,
      String? description,
      String? placeType,
      List<String>? urls});
}

/// @nodoc
class _$EditPlaceRequestCopyWithImpl<$Res, $Val extends EditPlaceRequest>
    implements $EditPlaceRequestCopyWith<$Res> {
  _$EditPlaceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? description = freezed,
    Object? placeType = freezed,
    Object? urls = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      placeType: freezed == placeType
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as String?,
      urls: freezed == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditPlaceRequestCopyWith<$Res>
    implements $EditPlaceRequestCopyWith<$Res> {
  factory _$$_EditPlaceRequestCopyWith(
          _$_EditPlaceRequest value, $Res Function(_$_EditPlaceRequest) then) =
      __$$_EditPlaceRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      double? lat,
      double? lng,
      String? description,
      String? placeType,
      List<String>? urls});
}

/// @nodoc
class __$$_EditPlaceRequestCopyWithImpl<$Res>
    extends _$EditPlaceRequestCopyWithImpl<$Res, _$_EditPlaceRequest>
    implements _$$_EditPlaceRequestCopyWith<$Res> {
  __$$_EditPlaceRequestCopyWithImpl(
      _$_EditPlaceRequest _value, $Res Function(_$_EditPlaceRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? description = freezed,
    Object? placeType = freezed,
    Object? urls = freezed,
  }) {
    return _then(_$_EditPlaceRequest(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      placeType: freezed == placeType
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as String?,
      urls: freezed == urls
          ? _value._urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EditPlaceRequest implements _EditPlaceRequest {
  const _$_EditPlaceRequest(
      {this.name,
      this.lat,
      this.lng,
      this.description,
      this.placeType,
      final List<String>? urls})
      : _urls = urls;

  factory _$_EditPlaceRequest.fromJson(Map<String, dynamic> json) =>
      _$$_EditPlaceRequestFromJson(json);

  @override
  final String? name;
  @override
  final double? lat;
  @override
  final double? lng;
  @override
  final String? description;
  @override
  final String? placeType;
  final List<String>? _urls;
  @override
  List<String>? get urls {
    final value = _urls;
    if (value == null) return null;
    if (_urls is EqualUnmodifiableListView) return _urls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EditPlaceRequest(name: $name, lat: $lat, lng: $lng, description: $description, placeType: $placeType, urls: $urls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditPlaceRequest &&
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
  int get hashCode => Object.hash(runtimeType, name, lat, lng, description,
      placeType, const DeepCollectionEquality().hash(_urls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditPlaceRequestCopyWith<_$_EditPlaceRequest> get copyWith =>
      __$$_EditPlaceRequestCopyWithImpl<_$_EditPlaceRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EditPlaceRequestToJson(
      this,
    );
  }
}

abstract class _EditPlaceRequest implements EditPlaceRequest {
  const factory _EditPlaceRequest(
      {final String? name,
      final double? lat,
      final double? lng,
      final String? description,
      final String? placeType,
      final List<String>? urls}) = _$_EditPlaceRequest;

  factory _EditPlaceRequest.fromJson(Map<String, dynamic> json) =
      _$_EditPlaceRequest.fromJson;

  @override
  String? get name;
  @override
  double? get lat;
  @override
  double? get lng;
  @override
  String? get description;
  @override
  String? get placeType;
  @override
  List<String>? get urls;
  @override
  @JsonKey(ignore: true)
  _$$_EditPlaceRequestCopyWith<_$_EditPlaceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
