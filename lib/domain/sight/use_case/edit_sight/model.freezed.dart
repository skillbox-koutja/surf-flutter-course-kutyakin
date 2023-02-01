// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SightModel {
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get long => throw _privateConstructorUsedError;
  SightType get type => throw _privateConstructorUsedError;
  Map<SightModelField, List<EditSightModelError>> get errors =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SightModelCopyWith<SightModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SightModelCopyWith<$Res> {
  factory $SightModelCopyWith(
          SightModel value, $Res Function(SightModel) then) =
      _$SightModelCopyWithImpl<$Res, SightModel>;
  @useResult
  $Res call(
      {String name,
      String imageUrl,
      String details,
      double? lat,
      double? long,
      SightType type,
      Map<SightModelField, List<EditSightModelError>> errors});
}

/// @nodoc
class _$SightModelCopyWithImpl<$Res, $Val extends SightModel>
    implements $SightModelCopyWith<$Res> {
  _$SightModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? details = null,
    Object? lat = freezed,
    Object? long = freezed,
    Object? type = null,
    Object? errors = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SightType,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<SightModelField, List<EditSightModelError>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SightModelCopyWith<$Res>
    implements $SightModelCopyWith<$Res> {
  factory _$$_SightModelCopyWith(
          _$_SightModel value, $Res Function(_$_SightModel) then) =
      __$$_SightModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String imageUrl,
      String details,
      double? lat,
      double? long,
      SightType type,
      Map<SightModelField, List<EditSightModelError>> errors});
}

/// @nodoc
class __$$_SightModelCopyWithImpl<$Res>
    extends _$SightModelCopyWithImpl<$Res, _$_SightModel>
    implements _$$_SightModelCopyWith<$Res> {
  __$$_SightModelCopyWithImpl(
      _$_SightModel _value, $Res Function(_$_SightModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? details = null,
    Object? lat = freezed,
    Object? long = freezed,
    Object? type = null,
    Object? errors = null,
  }) {
    return _then(_$_SightModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SightType,
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<SightModelField, List<EditSightModelError>>,
    ));
  }
}

/// @nodoc

class _$_SightModel extends _SightModel {
  const _$_SightModel(
      {this.name = '',
      this.imageUrl = 'https://picsum.photos/300/400',
      this.details = '',
      this.lat,
      this.long,
      this.type = SightType.none,
      required final Map<SightModelField, List<EditSightModelError>> errors})
      : _errors = errors,
        super._();

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final String details;
  @override
  final double? lat;
  @override
  final double? long;
  @override
  @JsonKey()
  final SightType type;
  final Map<SightModelField, List<EditSightModelError>> _errors;
  @override
  Map<SightModelField, List<EditSightModelError>> get errors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_errors);
  }

  @override
  String toString() {
    return 'SightModel(name: $name, imageUrl: $imageUrl, details: $details, lat: $lat, long: $long, type: $type, errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SightModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, imageUrl, details, lat,
      long, type, const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SightModelCopyWith<_$_SightModel> get copyWith =>
      __$$_SightModelCopyWithImpl<_$_SightModel>(this, _$identity);
}

abstract class _SightModel extends SightModel {
  const factory _SightModel(
      {final String name,
      final String imageUrl,
      final String details,
      final double? lat,
      final double? long,
      final SightType type,
      required final Map<SightModelField, List<EditSightModelError>>
          errors}) = _$_SightModel;
  const _SightModel._() : super._();

  @override
  String get name;
  @override
  String get imageUrl;
  @override
  String get details;
  @override
  double? get lat;
  @override
  double? get long;
  @override
  SightType get type;
  @override
  Map<SightModelField, List<EditSightModelError>> get errors;
  @override
  @JsonKey(ignore: true)
  _$$_SightModelCopyWith<_$_SightModel> get copyWith =>
      throw _privateConstructorUsedError;
}
