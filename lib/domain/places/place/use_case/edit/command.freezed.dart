// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditPlaceCommand {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(String details) setDetails,
    required TResult Function(PlaceType type) setType,
    required TResult Function(double? lat) setLat,
    required TResult Function(double? lng) setLng,
    required TResult Function(double lat, double lng) pointOnMap,
    required TResult Function(PlacePhoto photo) addPhoto,
    required TResult Function(PlacePhoto photo) removePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(String details)? setDetails,
    TResult? Function(PlaceType type)? setType,
    TResult? Function(double? lat)? setLat,
    TResult? Function(double? lng)? setLng,
    TResult? Function(double lat, double lng)? pointOnMap,
    TResult? Function(PlacePhoto photo)? addPhoto,
    TResult? Function(PlacePhoto photo)? removePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(String details)? setDetails,
    TResult Function(PlaceType type)? setType,
    TResult Function(double? lat)? setLat,
    TResult Function(double? lng)? setLng,
    TResult Function(double lat, double lng)? pointOnMap,
    TResult Function(PlacePhoto photo)? addPhoto,
    TResult Function(PlacePhoto photo)? removePhoto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetDetails value) setDetails,
    required TResult Function(SetType value) setType,
    required TResult Function(SetLat value) setLat,
    required TResult Function(SetLng value) setLng,
    required TResult Function(PointOnMap value) pointOnMap,
    required TResult Function(AddPhoto value) addPhoto,
    required TResult Function(RemovePhoto value) removePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetDetails value)? setDetails,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetLat value)? setLat,
    TResult? Function(SetLng value)? setLng,
    TResult? Function(PointOnMap value)? pointOnMap,
    TResult? Function(AddPhoto value)? addPhoto,
    TResult? Function(RemovePhoto value)? removePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetDetails value)? setDetails,
    TResult Function(SetType value)? setType,
    TResult Function(SetLat value)? setLat,
    TResult Function(SetLng value)? setLng,
    TResult Function(PointOnMap value)? pointOnMap,
    TResult Function(AddPhoto value)? addPhoto,
    TResult Function(RemovePhoto value)? removePhoto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditPlaceCommandCopyWith<$Res> {
  factory $EditPlaceCommandCopyWith(
          EditPlaceCommand value, $Res Function(EditPlaceCommand) then) =
      _$EditPlaceCommandCopyWithImpl<$Res, EditPlaceCommand>;
}

/// @nodoc
class _$EditPlaceCommandCopyWithImpl<$Res, $Val extends EditPlaceCommand>
    implements $EditPlaceCommandCopyWith<$Res> {
  _$EditPlaceCommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SetNameCopyWith<$Res> {
  factory _$$SetNameCopyWith(_$SetName value, $Res Function(_$SetName) then) =
      __$$SetNameCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$SetNameCopyWithImpl<$Res>
    extends _$EditPlaceCommandCopyWithImpl<$Res, _$SetName>
    implements _$$SetNameCopyWith<$Res> {
  __$$SetNameCopyWithImpl(_$SetName _value, $Res Function(_$SetName) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$SetName(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetName implements SetName {
  const _$SetName(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'EditPlaceCommand.setName(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetName &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetNameCopyWith<_$SetName> get copyWith =>
      __$$SetNameCopyWithImpl<_$SetName>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(String details) setDetails,
    required TResult Function(PlaceType type) setType,
    required TResult Function(double? lat) setLat,
    required TResult Function(double? lng) setLng,
    required TResult Function(double lat, double lng) pointOnMap,
    required TResult Function(PlacePhoto photo) addPhoto,
    required TResult Function(PlacePhoto photo) removePhoto,
  }) {
    return setName(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(String details)? setDetails,
    TResult? Function(PlaceType type)? setType,
    TResult? Function(double? lat)? setLat,
    TResult? Function(double? lng)? setLng,
    TResult? Function(double lat, double lng)? pointOnMap,
    TResult? Function(PlacePhoto photo)? addPhoto,
    TResult? Function(PlacePhoto photo)? removePhoto,
  }) {
    return setName?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(String details)? setDetails,
    TResult Function(PlaceType type)? setType,
    TResult Function(double? lat)? setLat,
    TResult Function(double? lng)? setLng,
    TResult Function(double lat, double lng)? pointOnMap,
    TResult Function(PlacePhoto photo)? addPhoto,
    TResult Function(PlacePhoto photo)? removePhoto,
    required TResult orElse(),
  }) {
    if (setName != null) {
      return setName(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetDetails value) setDetails,
    required TResult Function(SetType value) setType,
    required TResult Function(SetLat value) setLat,
    required TResult Function(SetLng value) setLng,
    required TResult Function(PointOnMap value) pointOnMap,
    required TResult Function(AddPhoto value) addPhoto,
    required TResult Function(RemovePhoto value) removePhoto,
  }) {
    return setName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetDetails value)? setDetails,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetLat value)? setLat,
    TResult? Function(SetLng value)? setLng,
    TResult? Function(PointOnMap value)? pointOnMap,
    TResult? Function(AddPhoto value)? addPhoto,
    TResult? Function(RemovePhoto value)? removePhoto,
  }) {
    return setName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetDetails value)? setDetails,
    TResult Function(SetType value)? setType,
    TResult Function(SetLat value)? setLat,
    TResult Function(SetLng value)? setLng,
    TResult Function(PointOnMap value)? pointOnMap,
    TResult Function(AddPhoto value)? addPhoto,
    TResult Function(RemovePhoto value)? removePhoto,
    required TResult orElse(),
  }) {
    if (setName != null) {
      return setName(this);
    }
    return orElse();
  }
}

abstract class SetName implements EditPlaceCommand {
  const factory SetName(final String name) = _$SetName;

  String get name;
  @JsonKey(ignore: true)
  _$$SetNameCopyWith<_$SetName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetDetailsCopyWith<$Res> {
  factory _$$SetDetailsCopyWith(
          _$SetDetails value, $Res Function(_$SetDetails) then) =
      __$$SetDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({String details});
}

/// @nodoc
class __$$SetDetailsCopyWithImpl<$Res>
    extends _$EditPlaceCommandCopyWithImpl<$Res, _$SetDetails>
    implements _$$SetDetailsCopyWith<$Res> {
  __$$SetDetailsCopyWithImpl(
      _$SetDetails _value, $Res Function(_$SetDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
  }) {
    return _then(_$SetDetails(
      null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetDetails implements SetDetails {
  const _$SetDetails(this.details);

  @override
  final String details;

  @override
  String toString() {
    return 'EditPlaceCommand.setDetails(details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetDetails &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetDetailsCopyWith<_$SetDetails> get copyWith =>
      __$$SetDetailsCopyWithImpl<_$SetDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(String details) setDetails,
    required TResult Function(PlaceType type) setType,
    required TResult Function(double? lat) setLat,
    required TResult Function(double? lng) setLng,
    required TResult Function(double lat, double lng) pointOnMap,
    required TResult Function(PlacePhoto photo) addPhoto,
    required TResult Function(PlacePhoto photo) removePhoto,
  }) {
    return setDetails(details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(String details)? setDetails,
    TResult? Function(PlaceType type)? setType,
    TResult? Function(double? lat)? setLat,
    TResult? Function(double? lng)? setLng,
    TResult? Function(double lat, double lng)? pointOnMap,
    TResult? Function(PlacePhoto photo)? addPhoto,
    TResult? Function(PlacePhoto photo)? removePhoto,
  }) {
    return setDetails?.call(details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(String details)? setDetails,
    TResult Function(PlaceType type)? setType,
    TResult Function(double? lat)? setLat,
    TResult Function(double? lng)? setLng,
    TResult Function(double lat, double lng)? pointOnMap,
    TResult Function(PlacePhoto photo)? addPhoto,
    TResult Function(PlacePhoto photo)? removePhoto,
    required TResult orElse(),
  }) {
    if (setDetails != null) {
      return setDetails(details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetDetails value) setDetails,
    required TResult Function(SetType value) setType,
    required TResult Function(SetLat value) setLat,
    required TResult Function(SetLng value) setLng,
    required TResult Function(PointOnMap value) pointOnMap,
    required TResult Function(AddPhoto value) addPhoto,
    required TResult Function(RemovePhoto value) removePhoto,
  }) {
    return setDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetDetails value)? setDetails,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetLat value)? setLat,
    TResult? Function(SetLng value)? setLng,
    TResult? Function(PointOnMap value)? pointOnMap,
    TResult? Function(AddPhoto value)? addPhoto,
    TResult? Function(RemovePhoto value)? removePhoto,
  }) {
    return setDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetDetails value)? setDetails,
    TResult Function(SetType value)? setType,
    TResult Function(SetLat value)? setLat,
    TResult Function(SetLng value)? setLng,
    TResult Function(PointOnMap value)? pointOnMap,
    TResult Function(AddPhoto value)? addPhoto,
    TResult Function(RemovePhoto value)? removePhoto,
    required TResult orElse(),
  }) {
    if (setDetails != null) {
      return setDetails(this);
    }
    return orElse();
  }
}

abstract class SetDetails implements EditPlaceCommand {
  const factory SetDetails(final String details) = _$SetDetails;

  String get details;
  @JsonKey(ignore: true)
  _$$SetDetailsCopyWith<_$SetDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetTypeCopyWith<$Res> {
  factory _$$SetTypeCopyWith(_$SetType value, $Res Function(_$SetType) then) =
      __$$SetTypeCopyWithImpl<$Res>;
  @useResult
  $Res call({PlaceType type});
}

/// @nodoc
class __$$SetTypeCopyWithImpl<$Res>
    extends _$EditPlaceCommandCopyWithImpl<$Res, _$SetType>
    implements _$$SetTypeCopyWith<$Res> {
  __$$SetTypeCopyWithImpl(_$SetType _value, $Res Function(_$SetType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$SetType(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PlaceType,
    ));
  }
}

/// @nodoc

class _$SetType implements SetType {
  const _$SetType(this.type);

  @override
  final PlaceType type;

  @override
  String toString() {
    return 'EditPlaceCommand.setType(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetType &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetTypeCopyWith<_$SetType> get copyWith =>
      __$$SetTypeCopyWithImpl<_$SetType>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(String details) setDetails,
    required TResult Function(PlaceType type) setType,
    required TResult Function(double? lat) setLat,
    required TResult Function(double? lng) setLng,
    required TResult Function(double lat, double lng) pointOnMap,
    required TResult Function(PlacePhoto photo) addPhoto,
    required TResult Function(PlacePhoto photo) removePhoto,
  }) {
    return setType(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(String details)? setDetails,
    TResult? Function(PlaceType type)? setType,
    TResult? Function(double? lat)? setLat,
    TResult? Function(double? lng)? setLng,
    TResult? Function(double lat, double lng)? pointOnMap,
    TResult? Function(PlacePhoto photo)? addPhoto,
    TResult? Function(PlacePhoto photo)? removePhoto,
  }) {
    return setType?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(String details)? setDetails,
    TResult Function(PlaceType type)? setType,
    TResult Function(double? lat)? setLat,
    TResult Function(double? lng)? setLng,
    TResult Function(double lat, double lng)? pointOnMap,
    TResult Function(PlacePhoto photo)? addPhoto,
    TResult Function(PlacePhoto photo)? removePhoto,
    required TResult orElse(),
  }) {
    if (setType != null) {
      return setType(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetDetails value) setDetails,
    required TResult Function(SetType value) setType,
    required TResult Function(SetLat value) setLat,
    required TResult Function(SetLng value) setLng,
    required TResult Function(PointOnMap value) pointOnMap,
    required TResult Function(AddPhoto value) addPhoto,
    required TResult Function(RemovePhoto value) removePhoto,
  }) {
    return setType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetDetails value)? setDetails,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetLat value)? setLat,
    TResult? Function(SetLng value)? setLng,
    TResult? Function(PointOnMap value)? pointOnMap,
    TResult? Function(AddPhoto value)? addPhoto,
    TResult? Function(RemovePhoto value)? removePhoto,
  }) {
    return setType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetDetails value)? setDetails,
    TResult Function(SetType value)? setType,
    TResult Function(SetLat value)? setLat,
    TResult Function(SetLng value)? setLng,
    TResult Function(PointOnMap value)? pointOnMap,
    TResult Function(AddPhoto value)? addPhoto,
    TResult Function(RemovePhoto value)? removePhoto,
    required TResult orElse(),
  }) {
    if (setType != null) {
      return setType(this);
    }
    return orElse();
  }
}

abstract class SetType implements EditPlaceCommand {
  const factory SetType(final PlaceType type) = _$SetType;

  PlaceType get type;
  @JsonKey(ignore: true)
  _$$SetTypeCopyWith<_$SetType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetLatCopyWith<$Res> {
  factory _$$SetLatCopyWith(_$SetLat value, $Res Function(_$SetLat) then) =
      __$$SetLatCopyWithImpl<$Res>;
  @useResult
  $Res call({double? lat});
}

/// @nodoc
class __$$SetLatCopyWithImpl<$Res>
    extends _$EditPlaceCommandCopyWithImpl<$Res, _$SetLat>
    implements _$$SetLatCopyWith<$Res> {
  __$$SetLatCopyWithImpl(_$SetLat _value, $Res Function(_$SetLat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
  }) {
    return _then(_$SetLat(
      freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$SetLat implements SetLat {
  const _$SetLat(this.lat);

  @override
  final double? lat;

  @override
  String toString() {
    return 'EditPlaceCommand.setLat(lat: $lat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetLat &&
            (identical(other.lat, lat) || other.lat == lat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetLatCopyWith<_$SetLat> get copyWith =>
      __$$SetLatCopyWithImpl<_$SetLat>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(String details) setDetails,
    required TResult Function(PlaceType type) setType,
    required TResult Function(double? lat) setLat,
    required TResult Function(double? lng) setLng,
    required TResult Function(double lat, double lng) pointOnMap,
    required TResult Function(PlacePhoto photo) addPhoto,
    required TResult Function(PlacePhoto photo) removePhoto,
  }) {
    return setLat(lat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(String details)? setDetails,
    TResult? Function(PlaceType type)? setType,
    TResult? Function(double? lat)? setLat,
    TResult? Function(double? lng)? setLng,
    TResult? Function(double lat, double lng)? pointOnMap,
    TResult? Function(PlacePhoto photo)? addPhoto,
    TResult? Function(PlacePhoto photo)? removePhoto,
  }) {
    return setLat?.call(lat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(String details)? setDetails,
    TResult Function(PlaceType type)? setType,
    TResult Function(double? lat)? setLat,
    TResult Function(double? lng)? setLng,
    TResult Function(double lat, double lng)? pointOnMap,
    TResult Function(PlacePhoto photo)? addPhoto,
    TResult Function(PlacePhoto photo)? removePhoto,
    required TResult orElse(),
  }) {
    if (setLat != null) {
      return setLat(lat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetDetails value) setDetails,
    required TResult Function(SetType value) setType,
    required TResult Function(SetLat value) setLat,
    required TResult Function(SetLng value) setLng,
    required TResult Function(PointOnMap value) pointOnMap,
    required TResult Function(AddPhoto value) addPhoto,
    required TResult Function(RemovePhoto value) removePhoto,
  }) {
    return setLat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetDetails value)? setDetails,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetLat value)? setLat,
    TResult? Function(SetLng value)? setLng,
    TResult? Function(PointOnMap value)? pointOnMap,
    TResult? Function(AddPhoto value)? addPhoto,
    TResult? Function(RemovePhoto value)? removePhoto,
  }) {
    return setLat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetDetails value)? setDetails,
    TResult Function(SetType value)? setType,
    TResult Function(SetLat value)? setLat,
    TResult Function(SetLng value)? setLng,
    TResult Function(PointOnMap value)? pointOnMap,
    TResult Function(AddPhoto value)? addPhoto,
    TResult Function(RemovePhoto value)? removePhoto,
    required TResult orElse(),
  }) {
    if (setLat != null) {
      return setLat(this);
    }
    return orElse();
  }
}

abstract class SetLat implements EditPlaceCommand {
  const factory SetLat(final double? lat) = _$SetLat;

  double? get lat;
  @JsonKey(ignore: true)
  _$$SetLatCopyWith<_$SetLat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetLngCopyWith<$Res> {
  factory _$$SetLngCopyWith(_$SetLng value, $Res Function(_$SetLng) then) =
      __$$SetLngCopyWithImpl<$Res>;
  @useResult
  $Res call({double? lng});
}

/// @nodoc
class __$$SetLngCopyWithImpl<$Res>
    extends _$EditPlaceCommandCopyWithImpl<$Res, _$SetLng>
    implements _$$SetLngCopyWith<$Res> {
  __$$SetLngCopyWithImpl(_$SetLng _value, $Res Function(_$SetLng) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lng = freezed,
  }) {
    return _then(_$SetLng(
      freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$SetLng implements SetLng {
  const _$SetLng(this.lng);

  @override
  final double? lng;

  @override
  String toString() {
    return 'EditPlaceCommand.setLng(lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetLng &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetLngCopyWith<_$SetLng> get copyWith =>
      __$$SetLngCopyWithImpl<_$SetLng>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(String details) setDetails,
    required TResult Function(PlaceType type) setType,
    required TResult Function(double? lat) setLat,
    required TResult Function(double? lng) setLng,
    required TResult Function(double lat, double lng) pointOnMap,
    required TResult Function(PlacePhoto photo) addPhoto,
    required TResult Function(PlacePhoto photo) removePhoto,
  }) {
    return setLng(lng);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(String details)? setDetails,
    TResult? Function(PlaceType type)? setType,
    TResult? Function(double? lat)? setLat,
    TResult? Function(double? lng)? setLng,
    TResult? Function(double lat, double lng)? pointOnMap,
    TResult? Function(PlacePhoto photo)? addPhoto,
    TResult? Function(PlacePhoto photo)? removePhoto,
  }) {
    return setLng?.call(lng);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(String details)? setDetails,
    TResult Function(PlaceType type)? setType,
    TResult Function(double? lat)? setLat,
    TResult Function(double? lng)? setLng,
    TResult Function(double lat, double lng)? pointOnMap,
    TResult Function(PlacePhoto photo)? addPhoto,
    TResult Function(PlacePhoto photo)? removePhoto,
    required TResult orElse(),
  }) {
    if (setLng != null) {
      return setLng(lng);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetDetails value) setDetails,
    required TResult Function(SetType value) setType,
    required TResult Function(SetLat value) setLat,
    required TResult Function(SetLng value) setLng,
    required TResult Function(PointOnMap value) pointOnMap,
    required TResult Function(AddPhoto value) addPhoto,
    required TResult Function(RemovePhoto value) removePhoto,
  }) {
    return setLng(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetDetails value)? setDetails,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetLat value)? setLat,
    TResult? Function(SetLng value)? setLng,
    TResult? Function(PointOnMap value)? pointOnMap,
    TResult? Function(AddPhoto value)? addPhoto,
    TResult? Function(RemovePhoto value)? removePhoto,
  }) {
    return setLng?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetDetails value)? setDetails,
    TResult Function(SetType value)? setType,
    TResult Function(SetLat value)? setLat,
    TResult Function(SetLng value)? setLng,
    TResult Function(PointOnMap value)? pointOnMap,
    TResult Function(AddPhoto value)? addPhoto,
    TResult Function(RemovePhoto value)? removePhoto,
    required TResult orElse(),
  }) {
    if (setLng != null) {
      return setLng(this);
    }
    return orElse();
  }
}

abstract class SetLng implements EditPlaceCommand {
  const factory SetLng(final double? lng) = _$SetLng;

  double? get lng;
  @JsonKey(ignore: true)
  _$$SetLngCopyWith<_$SetLng> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PointOnMapCopyWith<$Res> {
  factory _$$PointOnMapCopyWith(
          _$PointOnMap value, $Res Function(_$PointOnMap) then) =
      __$$PointOnMapCopyWithImpl<$Res>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$PointOnMapCopyWithImpl<$Res>
    extends _$EditPlaceCommandCopyWithImpl<$Res, _$PointOnMap>
    implements _$$PointOnMapCopyWith<$Res> {
  __$$PointOnMapCopyWithImpl(
      _$PointOnMap _value, $Res Function(_$PointOnMap) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$PointOnMap(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PointOnMap implements PointOnMap {
  const _$PointOnMap({required this.lat, required this.lng});

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'EditPlaceCommand.pointOnMap(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointOnMap &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PointOnMapCopyWith<_$PointOnMap> get copyWith =>
      __$$PointOnMapCopyWithImpl<_$PointOnMap>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(String details) setDetails,
    required TResult Function(PlaceType type) setType,
    required TResult Function(double? lat) setLat,
    required TResult Function(double? lng) setLng,
    required TResult Function(double lat, double lng) pointOnMap,
    required TResult Function(PlacePhoto photo) addPhoto,
    required TResult Function(PlacePhoto photo) removePhoto,
  }) {
    return pointOnMap(lat, lng);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(String details)? setDetails,
    TResult? Function(PlaceType type)? setType,
    TResult? Function(double? lat)? setLat,
    TResult? Function(double? lng)? setLng,
    TResult? Function(double lat, double lng)? pointOnMap,
    TResult? Function(PlacePhoto photo)? addPhoto,
    TResult? Function(PlacePhoto photo)? removePhoto,
  }) {
    return pointOnMap?.call(lat, lng);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(String details)? setDetails,
    TResult Function(PlaceType type)? setType,
    TResult Function(double? lat)? setLat,
    TResult Function(double? lng)? setLng,
    TResult Function(double lat, double lng)? pointOnMap,
    TResult Function(PlacePhoto photo)? addPhoto,
    TResult Function(PlacePhoto photo)? removePhoto,
    required TResult orElse(),
  }) {
    if (pointOnMap != null) {
      return pointOnMap(lat, lng);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetDetails value) setDetails,
    required TResult Function(SetType value) setType,
    required TResult Function(SetLat value) setLat,
    required TResult Function(SetLng value) setLng,
    required TResult Function(PointOnMap value) pointOnMap,
    required TResult Function(AddPhoto value) addPhoto,
    required TResult Function(RemovePhoto value) removePhoto,
  }) {
    return pointOnMap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetDetails value)? setDetails,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetLat value)? setLat,
    TResult? Function(SetLng value)? setLng,
    TResult? Function(PointOnMap value)? pointOnMap,
    TResult? Function(AddPhoto value)? addPhoto,
    TResult? Function(RemovePhoto value)? removePhoto,
  }) {
    return pointOnMap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetDetails value)? setDetails,
    TResult Function(SetType value)? setType,
    TResult Function(SetLat value)? setLat,
    TResult Function(SetLng value)? setLng,
    TResult Function(PointOnMap value)? pointOnMap,
    TResult Function(AddPhoto value)? addPhoto,
    TResult Function(RemovePhoto value)? removePhoto,
    required TResult orElse(),
  }) {
    if (pointOnMap != null) {
      return pointOnMap(this);
    }
    return orElse();
  }
}

abstract class PointOnMap implements EditPlaceCommand {
  const factory PointOnMap(
      {required final double lat, required final double lng}) = _$PointOnMap;

  double get lat;
  double get lng;
  @JsonKey(ignore: true)
  _$$PointOnMapCopyWith<_$PointOnMap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPhotoCopyWith<$Res> {
  factory _$$AddPhotoCopyWith(
          _$AddPhoto value, $Res Function(_$AddPhoto) then) =
      __$$AddPhotoCopyWithImpl<$Res>;
  @useResult
  $Res call({PlacePhoto photo});
}

/// @nodoc
class __$$AddPhotoCopyWithImpl<$Res>
    extends _$EditPlaceCommandCopyWithImpl<$Res, _$AddPhoto>
    implements _$$AddPhotoCopyWith<$Res> {
  __$$AddPhotoCopyWithImpl(_$AddPhoto _value, $Res Function(_$AddPhoto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photo = null,
  }) {
    return _then(_$AddPhoto(
      null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as PlacePhoto,
    ));
  }
}

/// @nodoc

class _$AddPhoto implements AddPhoto {
  const _$AddPhoto(this.photo);

  @override
  final PlacePhoto photo;

  @override
  String toString() {
    return 'EditPlaceCommand.addPhoto(photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPhoto &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPhotoCopyWith<_$AddPhoto> get copyWith =>
      __$$AddPhotoCopyWithImpl<_$AddPhoto>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(String details) setDetails,
    required TResult Function(PlaceType type) setType,
    required TResult Function(double? lat) setLat,
    required TResult Function(double? lng) setLng,
    required TResult Function(double lat, double lng) pointOnMap,
    required TResult Function(PlacePhoto photo) addPhoto,
    required TResult Function(PlacePhoto photo) removePhoto,
  }) {
    return addPhoto(photo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(String details)? setDetails,
    TResult? Function(PlaceType type)? setType,
    TResult? Function(double? lat)? setLat,
    TResult? Function(double? lng)? setLng,
    TResult? Function(double lat, double lng)? pointOnMap,
    TResult? Function(PlacePhoto photo)? addPhoto,
    TResult? Function(PlacePhoto photo)? removePhoto,
  }) {
    return addPhoto?.call(photo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(String details)? setDetails,
    TResult Function(PlaceType type)? setType,
    TResult Function(double? lat)? setLat,
    TResult Function(double? lng)? setLng,
    TResult Function(double lat, double lng)? pointOnMap,
    TResult Function(PlacePhoto photo)? addPhoto,
    TResult Function(PlacePhoto photo)? removePhoto,
    required TResult orElse(),
  }) {
    if (addPhoto != null) {
      return addPhoto(photo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetDetails value) setDetails,
    required TResult Function(SetType value) setType,
    required TResult Function(SetLat value) setLat,
    required TResult Function(SetLng value) setLng,
    required TResult Function(PointOnMap value) pointOnMap,
    required TResult Function(AddPhoto value) addPhoto,
    required TResult Function(RemovePhoto value) removePhoto,
  }) {
    return addPhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetDetails value)? setDetails,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetLat value)? setLat,
    TResult? Function(SetLng value)? setLng,
    TResult? Function(PointOnMap value)? pointOnMap,
    TResult? Function(AddPhoto value)? addPhoto,
    TResult? Function(RemovePhoto value)? removePhoto,
  }) {
    return addPhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetDetails value)? setDetails,
    TResult Function(SetType value)? setType,
    TResult Function(SetLat value)? setLat,
    TResult Function(SetLng value)? setLng,
    TResult Function(PointOnMap value)? pointOnMap,
    TResult Function(AddPhoto value)? addPhoto,
    TResult Function(RemovePhoto value)? removePhoto,
    required TResult orElse(),
  }) {
    if (addPhoto != null) {
      return addPhoto(this);
    }
    return orElse();
  }
}

abstract class AddPhoto implements EditPlaceCommand {
  const factory AddPhoto(final PlacePhoto photo) = _$AddPhoto;

  PlacePhoto get photo;
  @JsonKey(ignore: true)
  _$$AddPhotoCopyWith<_$AddPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemovePhotoCopyWith<$Res> {
  factory _$$RemovePhotoCopyWith(
          _$RemovePhoto value, $Res Function(_$RemovePhoto) then) =
      __$$RemovePhotoCopyWithImpl<$Res>;
  @useResult
  $Res call({PlacePhoto photo});
}

/// @nodoc
class __$$RemovePhotoCopyWithImpl<$Res>
    extends _$EditPlaceCommandCopyWithImpl<$Res, _$RemovePhoto>
    implements _$$RemovePhotoCopyWith<$Res> {
  __$$RemovePhotoCopyWithImpl(
      _$RemovePhoto _value, $Res Function(_$RemovePhoto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photo = null,
  }) {
    return _then(_$RemovePhoto(
      null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as PlacePhoto,
    ));
  }
}

/// @nodoc

class _$RemovePhoto implements RemovePhoto {
  const _$RemovePhoto(this.photo);

  @override
  final PlacePhoto photo;

  @override
  String toString() {
    return 'EditPlaceCommand.removePhoto(photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemovePhoto &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemovePhotoCopyWith<_$RemovePhoto> get copyWith =>
      __$$RemovePhotoCopyWithImpl<_$RemovePhoto>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(String details) setDetails,
    required TResult Function(PlaceType type) setType,
    required TResult Function(double? lat) setLat,
    required TResult Function(double? lng) setLng,
    required TResult Function(double lat, double lng) pointOnMap,
    required TResult Function(PlacePhoto photo) addPhoto,
    required TResult Function(PlacePhoto photo) removePhoto,
  }) {
    return removePhoto(photo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(String details)? setDetails,
    TResult? Function(PlaceType type)? setType,
    TResult? Function(double? lat)? setLat,
    TResult? Function(double? lng)? setLng,
    TResult? Function(double lat, double lng)? pointOnMap,
    TResult? Function(PlacePhoto photo)? addPhoto,
    TResult? Function(PlacePhoto photo)? removePhoto,
  }) {
    return removePhoto?.call(photo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(String details)? setDetails,
    TResult Function(PlaceType type)? setType,
    TResult Function(double? lat)? setLat,
    TResult Function(double? lng)? setLng,
    TResult Function(double lat, double lng)? pointOnMap,
    TResult Function(PlacePhoto photo)? addPhoto,
    TResult Function(PlacePhoto photo)? removePhoto,
    required TResult orElse(),
  }) {
    if (removePhoto != null) {
      return removePhoto(photo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetName value) setName,
    required TResult Function(SetDetails value) setDetails,
    required TResult Function(SetType value) setType,
    required TResult Function(SetLat value) setLat,
    required TResult Function(SetLng value) setLng,
    required TResult Function(PointOnMap value) pointOnMap,
    required TResult Function(AddPhoto value) addPhoto,
    required TResult Function(RemovePhoto value) removePhoto,
  }) {
    return removePhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetName value)? setName,
    TResult? Function(SetDetails value)? setDetails,
    TResult? Function(SetType value)? setType,
    TResult? Function(SetLat value)? setLat,
    TResult? Function(SetLng value)? setLng,
    TResult? Function(PointOnMap value)? pointOnMap,
    TResult? Function(AddPhoto value)? addPhoto,
    TResult? Function(RemovePhoto value)? removePhoto,
  }) {
    return removePhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetName value)? setName,
    TResult Function(SetDetails value)? setDetails,
    TResult Function(SetType value)? setType,
    TResult Function(SetLat value)? setLat,
    TResult Function(SetLng value)? setLng,
    TResult Function(PointOnMap value)? pointOnMap,
    TResult Function(AddPhoto value)? addPhoto,
    TResult Function(RemovePhoto value)? removePhoto,
    required TResult orElse(),
  }) {
    if (removePhoto != null) {
      return removePhoto(this);
    }
    return orElse();
  }
}

abstract class RemovePhoto implements EditPlaceCommand {
  const factory RemovePhoto(final PlacePhoto photo) = _$RemovePhoto;

  PlacePhoto get photo;
  @JsonKey(ignore: true)
  _$$RemovePhotoCopyWith<_$RemovePhoto> get copyWith =>
      throw _privateConstructorUsedError;
}
