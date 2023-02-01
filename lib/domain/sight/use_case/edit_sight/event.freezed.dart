// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditSightModelEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(String details) setDetails,
    required TResult Function(SightType type) setType,
    required TResult Function(double? lat) setLat,
    required TResult Function(double? long) setLong,
    required TResult Function(double lat, double long) pointOnMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(String details)? setDetails,
    TResult? Function(SightType type)? setType,
    TResult? Function(double? lat)? setLat,
    TResult? Function(double? long)? setLong,
    TResult? Function(double lat, double long)? pointOnMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(String details)? setDetails,
    TResult Function(SightType type)? setType,
    TResult Function(double? lat)? setLat,
    TResult Function(double? long)? setLong,
    TResult Function(double lat, double long)? pointOnMap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditSightModelSetName value) setName,
    required TResult Function(EditSightModelSetDetails value) setDetails,
    required TResult Function(EditSightModelSetType value) setType,
    required TResult Function(EditSightModelSetLat value) setLat,
    required TResult Function(EditSightModelSetLong value) setLong,
    required TResult Function(EditSightModelPointOnMap value) pointOnMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditSightModelSetName value)? setName,
    TResult? Function(EditSightModelSetDetails value)? setDetails,
    TResult? Function(EditSightModelSetType value)? setType,
    TResult? Function(EditSightModelSetLat value)? setLat,
    TResult? Function(EditSightModelSetLong value)? setLong,
    TResult? Function(EditSightModelPointOnMap value)? pointOnMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditSightModelSetName value)? setName,
    TResult Function(EditSightModelSetDetails value)? setDetails,
    TResult Function(EditSightModelSetType value)? setType,
    TResult Function(EditSightModelSetLat value)? setLat,
    TResult Function(EditSightModelSetLong value)? setLong,
    TResult Function(EditSightModelPointOnMap value)? pointOnMap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditSightModelEventCopyWith<$Res> {
  factory $EditSightModelEventCopyWith(
          EditSightModelEvent value, $Res Function(EditSightModelEvent) then) =
      _$EditSightModelEventCopyWithImpl<$Res, EditSightModelEvent>;
}

/// @nodoc
class _$EditSightModelEventCopyWithImpl<$Res, $Val extends EditSightModelEvent>
    implements $EditSightModelEventCopyWith<$Res> {
  _$EditSightModelEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EditSightModelSetNameCopyWith<$Res> {
  factory _$$EditSightModelSetNameCopyWith(_$EditSightModelSetName value,
          $Res Function(_$EditSightModelSetName) then) =
      __$$EditSightModelSetNameCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$EditSightModelSetNameCopyWithImpl<$Res>
    extends _$EditSightModelEventCopyWithImpl<$Res, _$EditSightModelSetName>
    implements _$$EditSightModelSetNameCopyWith<$Res> {
  __$$EditSightModelSetNameCopyWithImpl(_$EditSightModelSetName _value,
      $Res Function(_$EditSightModelSetName) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$EditSightModelSetName(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditSightModelSetName implements EditSightModelSetName {
  const _$EditSightModelSetName(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'EditSightModelEvent.setName(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditSightModelSetName &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditSightModelSetNameCopyWith<_$EditSightModelSetName> get copyWith =>
      __$$EditSightModelSetNameCopyWithImpl<_$EditSightModelSetName>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(String details) setDetails,
    required TResult Function(SightType type) setType,
    required TResult Function(double? lat) setLat,
    required TResult Function(double? long) setLong,
    required TResult Function(double lat, double long) pointOnMap,
  }) {
    return setName(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(String details)? setDetails,
    TResult? Function(SightType type)? setType,
    TResult? Function(double? lat)? setLat,
    TResult? Function(double? long)? setLong,
    TResult? Function(double lat, double long)? pointOnMap,
  }) {
    return setName?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(String details)? setDetails,
    TResult Function(SightType type)? setType,
    TResult Function(double? lat)? setLat,
    TResult Function(double? long)? setLong,
    TResult Function(double lat, double long)? pointOnMap,
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
    required TResult Function(EditSightModelSetName value) setName,
    required TResult Function(EditSightModelSetDetails value) setDetails,
    required TResult Function(EditSightModelSetType value) setType,
    required TResult Function(EditSightModelSetLat value) setLat,
    required TResult Function(EditSightModelSetLong value) setLong,
    required TResult Function(EditSightModelPointOnMap value) pointOnMap,
  }) {
    return setName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditSightModelSetName value)? setName,
    TResult? Function(EditSightModelSetDetails value)? setDetails,
    TResult? Function(EditSightModelSetType value)? setType,
    TResult? Function(EditSightModelSetLat value)? setLat,
    TResult? Function(EditSightModelSetLong value)? setLong,
    TResult? Function(EditSightModelPointOnMap value)? pointOnMap,
  }) {
    return setName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditSightModelSetName value)? setName,
    TResult Function(EditSightModelSetDetails value)? setDetails,
    TResult Function(EditSightModelSetType value)? setType,
    TResult Function(EditSightModelSetLat value)? setLat,
    TResult Function(EditSightModelSetLong value)? setLong,
    TResult Function(EditSightModelPointOnMap value)? pointOnMap,
    required TResult orElse(),
  }) {
    if (setName != null) {
      return setName(this);
    }
    return orElse();
  }
}

abstract class EditSightModelSetName implements EditSightModelEvent {
  const factory EditSightModelSetName(final String name) =
      _$EditSightModelSetName;

  String get name;
  @JsonKey(ignore: true)
  _$$EditSightModelSetNameCopyWith<_$EditSightModelSetName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditSightModelSetDetailsCopyWith<$Res> {
  factory _$$EditSightModelSetDetailsCopyWith(_$EditSightModelSetDetails value,
          $Res Function(_$EditSightModelSetDetails) then) =
      __$$EditSightModelSetDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({String details});
}

/// @nodoc
class __$$EditSightModelSetDetailsCopyWithImpl<$Res>
    extends _$EditSightModelEventCopyWithImpl<$Res, _$EditSightModelSetDetails>
    implements _$$EditSightModelSetDetailsCopyWith<$Res> {
  __$$EditSightModelSetDetailsCopyWithImpl(_$EditSightModelSetDetails _value,
      $Res Function(_$EditSightModelSetDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
  }) {
    return _then(_$EditSightModelSetDetails(
      null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditSightModelSetDetails implements EditSightModelSetDetails {
  const _$EditSightModelSetDetails(this.details);

  @override
  final String details;

  @override
  String toString() {
    return 'EditSightModelEvent.setDetails(details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditSightModelSetDetails &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditSightModelSetDetailsCopyWith<_$EditSightModelSetDetails>
      get copyWith =>
          __$$EditSightModelSetDetailsCopyWithImpl<_$EditSightModelSetDetails>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(String details) setDetails,
    required TResult Function(SightType type) setType,
    required TResult Function(double? lat) setLat,
    required TResult Function(double? long) setLong,
    required TResult Function(double lat, double long) pointOnMap,
  }) {
    return setDetails(details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(String details)? setDetails,
    TResult? Function(SightType type)? setType,
    TResult? Function(double? lat)? setLat,
    TResult? Function(double? long)? setLong,
    TResult? Function(double lat, double long)? pointOnMap,
  }) {
    return setDetails?.call(details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(String details)? setDetails,
    TResult Function(SightType type)? setType,
    TResult Function(double? lat)? setLat,
    TResult Function(double? long)? setLong,
    TResult Function(double lat, double long)? pointOnMap,
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
    required TResult Function(EditSightModelSetName value) setName,
    required TResult Function(EditSightModelSetDetails value) setDetails,
    required TResult Function(EditSightModelSetType value) setType,
    required TResult Function(EditSightModelSetLat value) setLat,
    required TResult Function(EditSightModelSetLong value) setLong,
    required TResult Function(EditSightModelPointOnMap value) pointOnMap,
  }) {
    return setDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditSightModelSetName value)? setName,
    TResult? Function(EditSightModelSetDetails value)? setDetails,
    TResult? Function(EditSightModelSetType value)? setType,
    TResult? Function(EditSightModelSetLat value)? setLat,
    TResult? Function(EditSightModelSetLong value)? setLong,
    TResult? Function(EditSightModelPointOnMap value)? pointOnMap,
  }) {
    return setDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditSightModelSetName value)? setName,
    TResult Function(EditSightModelSetDetails value)? setDetails,
    TResult Function(EditSightModelSetType value)? setType,
    TResult Function(EditSightModelSetLat value)? setLat,
    TResult Function(EditSightModelSetLong value)? setLong,
    TResult Function(EditSightModelPointOnMap value)? pointOnMap,
    required TResult orElse(),
  }) {
    if (setDetails != null) {
      return setDetails(this);
    }
    return orElse();
  }
}

abstract class EditSightModelSetDetails implements EditSightModelEvent {
  const factory EditSightModelSetDetails(final String details) =
      _$EditSightModelSetDetails;

  String get details;
  @JsonKey(ignore: true)
  _$$EditSightModelSetDetailsCopyWith<_$EditSightModelSetDetails>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditSightModelSetTypeCopyWith<$Res> {
  factory _$$EditSightModelSetTypeCopyWith(_$EditSightModelSetType value,
          $Res Function(_$EditSightModelSetType) then) =
      __$$EditSightModelSetTypeCopyWithImpl<$Res>;
  @useResult
  $Res call({SightType type});
}

/// @nodoc
class __$$EditSightModelSetTypeCopyWithImpl<$Res>
    extends _$EditSightModelEventCopyWithImpl<$Res, _$EditSightModelSetType>
    implements _$$EditSightModelSetTypeCopyWith<$Res> {
  __$$EditSightModelSetTypeCopyWithImpl(_$EditSightModelSetType _value,
      $Res Function(_$EditSightModelSetType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$EditSightModelSetType(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SightType,
    ));
  }
}

/// @nodoc

class _$EditSightModelSetType implements EditSightModelSetType {
  const _$EditSightModelSetType(this.type);

  @override
  final SightType type;

  @override
  String toString() {
    return 'EditSightModelEvent.setType(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditSightModelSetType &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditSightModelSetTypeCopyWith<_$EditSightModelSetType> get copyWith =>
      __$$EditSightModelSetTypeCopyWithImpl<_$EditSightModelSetType>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(String details) setDetails,
    required TResult Function(SightType type) setType,
    required TResult Function(double? lat) setLat,
    required TResult Function(double? long) setLong,
    required TResult Function(double lat, double long) pointOnMap,
  }) {
    return setType(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(String details)? setDetails,
    TResult? Function(SightType type)? setType,
    TResult? Function(double? lat)? setLat,
    TResult? Function(double? long)? setLong,
    TResult? Function(double lat, double long)? pointOnMap,
  }) {
    return setType?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(String details)? setDetails,
    TResult Function(SightType type)? setType,
    TResult Function(double? lat)? setLat,
    TResult Function(double? long)? setLong,
    TResult Function(double lat, double long)? pointOnMap,
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
    required TResult Function(EditSightModelSetName value) setName,
    required TResult Function(EditSightModelSetDetails value) setDetails,
    required TResult Function(EditSightModelSetType value) setType,
    required TResult Function(EditSightModelSetLat value) setLat,
    required TResult Function(EditSightModelSetLong value) setLong,
    required TResult Function(EditSightModelPointOnMap value) pointOnMap,
  }) {
    return setType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditSightModelSetName value)? setName,
    TResult? Function(EditSightModelSetDetails value)? setDetails,
    TResult? Function(EditSightModelSetType value)? setType,
    TResult? Function(EditSightModelSetLat value)? setLat,
    TResult? Function(EditSightModelSetLong value)? setLong,
    TResult? Function(EditSightModelPointOnMap value)? pointOnMap,
  }) {
    return setType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditSightModelSetName value)? setName,
    TResult Function(EditSightModelSetDetails value)? setDetails,
    TResult Function(EditSightModelSetType value)? setType,
    TResult Function(EditSightModelSetLat value)? setLat,
    TResult Function(EditSightModelSetLong value)? setLong,
    TResult Function(EditSightModelPointOnMap value)? pointOnMap,
    required TResult orElse(),
  }) {
    if (setType != null) {
      return setType(this);
    }
    return orElse();
  }
}

abstract class EditSightModelSetType implements EditSightModelEvent {
  const factory EditSightModelSetType(final SightType type) =
      _$EditSightModelSetType;

  SightType get type;
  @JsonKey(ignore: true)
  _$$EditSightModelSetTypeCopyWith<_$EditSightModelSetType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditSightModelSetLatCopyWith<$Res> {
  factory _$$EditSightModelSetLatCopyWith(_$EditSightModelSetLat value,
          $Res Function(_$EditSightModelSetLat) then) =
      __$$EditSightModelSetLatCopyWithImpl<$Res>;
  @useResult
  $Res call({double? lat});
}

/// @nodoc
class __$$EditSightModelSetLatCopyWithImpl<$Res>
    extends _$EditSightModelEventCopyWithImpl<$Res, _$EditSightModelSetLat>
    implements _$$EditSightModelSetLatCopyWith<$Res> {
  __$$EditSightModelSetLatCopyWithImpl(_$EditSightModelSetLat _value,
      $Res Function(_$EditSightModelSetLat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
  }) {
    return _then(_$EditSightModelSetLat(
      freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$EditSightModelSetLat implements EditSightModelSetLat {
  const _$EditSightModelSetLat(this.lat);

  @override
  final double? lat;

  @override
  String toString() {
    return 'EditSightModelEvent.setLat(lat: $lat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditSightModelSetLat &&
            (identical(other.lat, lat) || other.lat == lat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditSightModelSetLatCopyWith<_$EditSightModelSetLat> get copyWith =>
      __$$EditSightModelSetLatCopyWithImpl<_$EditSightModelSetLat>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(String details) setDetails,
    required TResult Function(SightType type) setType,
    required TResult Function(double? lat) setLat,
    required TResult Function(double? long) setLong,
    required TResult Function(double lat, double long) pointOnMap,
  }) {
    return setLat(lat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(String details)? setDetails,
    TResult? Function(SightType type)? setType,
    TResult? Function(double? lat)? setLat,
    TResult? Function(double? long)? setLong,
    TResult? Function(double lat, double long)? pointOnMap,
  }) {
    return setLat?.call(lat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(String details)? setDetails,
    TResult Function(SightType type)? setType,
    TResult Function(double? lat)? setLat,
    TResult Function(double? long)? setLong,
    TResult Function(double lat, double long)? pointOnMap,
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
    required TResult Function(EditSightModelSetName value) setName,
    required TResult Function(EditSightModelSetDetails value) setDetails,
    required TResult Function(EditSightModelSetType value) setType,
    required TResult Function(EditSightModelSetLat value) setLat,
    required TResult Function(EditSightModelSetLong value) setLong,
    required TResult Function(EditSightModelPointOnMap value) pointOnMap,
  }) {
    return setLat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditSightModelSetName value)? setName,
    TResult? Function(EditSightModelSetDetails value)? setDetails,
    TResult? Function(EditSightModelSetType value)? setType,
    TResult? Function(EditSightModelSetLat value)? setLat,
    TResult? Function(EditSightModelSetLong value)? setLong,
    TResult? Function(EditSightModelPointOnMap value)? pointOnMap,
  }) {
    return setLat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditSightModelSetName value)? setName,
    TResult Function(EditSightModelSetDetails value)? setDetails,
    TResult Function(EditSightModelSetType value)? setType,
    TResult Function(EditSightModelSetLat value)? setLat,
    TResult Function(EditSightModelSetLong value)? setLong,
    TResult Function(EditSightModelPointOnMap value)? pointOnMap,
    required TResult orElse(),
  }) {
    if (setLat != null) {
      return setLat(this);
    }
    return orElse();
  }
}

abstract class EditSightModelSetLat implements EditSightModelEvent {
  const factory EditSightModelSetLat(final double? lat) =
      _$EditSightModelSetLat;

  double? get lat;
  @JsonKey(ignore: true)
  _$$EditSightModelSetLatCopyWith<_$EditSightModelSetLat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditSightModelSetLongCopyWith<$Res> {
  factory _$$EditSightModelSetLongCopyWith(_$EditSightModelSetLong value,
          $Res Function(_$EditSightModelSetLong) then) =
      __$$EditSightModelSetLongCopyWithImpl<$Res>;
  @useResult
  $Res call({double? long});
}

/// @nodoc
class __$$EditSightModelSetLongCopyWithImpl<$Res>
    extends _$EditSightModelEventCopyWithImpl<$Res, _$EditSightModelSetLong>
    implements _$$EditSightModelSetLongCopyWith<$Res> {
  __$$EditSightModelSetLongCopyWithImpl(_$EditSightModelSetLong _value,
      $Res Function(_$EditSightModelSetLong) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? long = freezed,
  }) {
    return _then(_$EditSightModelSetLong(
      freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$EditSightModelSetLong implements EditSightModelSetLong {
  const _$EditSightModelSetLong(this.long);

  @override
  final double? long;

  @override
  String toString() {
    return 'EditSightModelEvent.setLong(long: $long)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditSightModelSetLong &&
            (identical(other.long, long) || other.long == long));
  }

  @override
  int get hashCode => Object.hash(runtimeType, long);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditSightModelSetLongCopyWith<_$EditSightModelSetLong> get copyWith =>
      __$$EditSightModelSetLongCopyWithImpl<_$EditSightModelSetLong>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(String details) setDetails,
    required TResult Function(SightType type) setType,
    required TResult Function(double? lat) setLat,
    required TResult Function(double? long) setLong,
    required TResult Function(double lat, double long) pointOnMap,
  }) {
    return setLong(long);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(String details)? setDetails,
    TResult? Function(SightType type)? setType,
    TResult? Function(double? lat)? setLat,
    TResult? Function(double? long)? setLong,
    TResult? Function(double lat, double long)? pointOnMap,
  }) {
    return setLong?.call(long);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(String details)? setDetails,
    TResult Function(SightType type)? setType,
    TResult Function(double? lat)? setLat,
    TResult Function(double? long)? setLong,
    TResult Function(double lat, double long)? pointOnMap,
    required TResult orElse(),
  }) {
    if (setLong != null) {
      return setLong(long);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditSightModelSetName value) setName,
    required TResult Function(EditSightModelSetDetails value) setDetails,
    required TResult Function(EditSightModelSetType value) setType,
    required TResult Function(EditSightModelSetLat value) setLat,
    required TResult Function(EditSightModelSetLong value) setLong,
    required TResult Function(EditSightModelPointOnMap value) pointOnMap,
  }) {
    return setLong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditSightModelSetName value)? setName,
    TResult? Function(EditSightModelSetDetails value)? setDetails,
    TResult? Function(EditSightModelSetType value)? setType,
    TResult? Function(EditSightModelSetLat value)? setLat,
    TResult? Function(EditSightModelSetLong value)? setLong,
    TResult? Function(EditSightModelPointOnMap value)? pointOnMap,
  }) {
    return setLong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditSightModelSetName value)? setName,
    TResult Function(EditSightModelSetDetails value)? setDetails,
    TResult Function(EditSightModelSetType value)? setType,
    TResult Function(EditSightModelSetLat value)? setLat,
    TResult Function(EditSightModelSetLong value)? setLong,
    TResult Function(EditSightModelPointOnMap value)? pointOnMap,
    required TResult orElse(),
  }) {
    if (setLong != null) {
      return setLong(this);
    }
    return orElse();
  }
}

abstract class EditSightModelSetLong implements EditSightModelEvent {
  const factory EditSightModelSetLong(final double? long) =
      _$EditSightModelSetLong;

  double? get long;
  @JsonKey(ignore: true)
  _$$EditSightModelSetLongCopyWith<_$EditSightModelSetLong> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditSightModelPointOnMapCopyWith<$Res> {
  factory _$$EditSightModelPointOnMapCopyWith(_$EditSightModelPointOnMap value,
          $Res Function(_$EditSightModelPointOnMap) then) =
      __$$EditSightModelPointOnMapCopyWithImpl<$Res>;
  @useResult
  $Res call({double lat, double long});
}

/// @nodoc
class __$$EditSightModelPointOnMapCopyWithImpl<$Res>
    extends _$EditSightModelEventCopyWithImpl<$Res, _$EditSightModelPointOnMap>
    implements _$$EditSightModelPointOnMapCopyWith<$Res> {
  __$$EditSightModelPointOnMapCopyWithImpl(_$EditSightModelPointOnMap _value,
      $Res Function(_$EditSightModelPointOnMap) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? long = null,
  }) {
    return _then(_$EditSightModelPointOnMap(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$EditSightModelPointOnMap implements EditSightModelPointOnMap {
  const _$EditSightModelPointOnMap({required this.lat, required this.long});

  @override
  final double lat;
  @override
  final double long;

  @override
  String toString() {
    return 'EditSightModelEvent.pointOnMap(lat: $lat, long: $long)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditSightModelPointOnMap &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, long);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditSightModelPointOnMapCopyWith<_$EditSightModelPointOnMap>
      get copyWith =>
          __$$EditSightModelPointOnMapCopyWithImpl<_$EditSightModelPointOnMap>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) setName,
    required TResult Function(String details) setDetails,
    required TResult Function(SightType type) setType,
    required TResult Function(double? lat) setLat,
    required TResult Function(double? long) setLong,
    required TResult Function(double lat, double long) pointOnMap,
  }) {
    return pointOnMap(lat, long);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? setName,
    TResult? Function(String details)? setDetails,
    TResult? Function(SightType type)? setType,
    TResult? Function(double? lat)? setLat,
    TResult? Function(double? long)? setLong,
    TResult? Function(double lat, double long)? pointOnMap,
  }) {
    return pointOnMap?.call(lat, long);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? setName,
    TResult Function(String details)? setDetails,
    TResult Function(SightType type)? setType,
    TResult Function(double? lat)? setLat,
    TResult Function(double? long)? setLong,
    TResult Function(double lat, double long)? pointOnMap,
    required TResult orElse(),
  }) {
    if (pointOnMap != null) {
      return pointOnMap(lat, long);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditSightModelSetName value) setName,
    required TResult Function(EditSightModelSetDetails value) setDetails,
    required TResult Function(EditSightModelSetType value) setType,
    required TResult Function(EditSightModelSetLat value) setLat,
    required TResult Function(EditSightModelSetLong value) setLong,
    required TResult Function(EditSightModelPointOnMap value) pointOnMap,
  }) {
    return pointOnMap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditSightModelSetName value)? setName,
    TResult? Function(EditSightModelSetDetails value)? setDetails,
    TResult? Function(EditSightModelSetType value)? setType,
    TResult? Function(EditSightModelSetLat value)? setLat,
    TResult? Function(EditSightModelSetLong value)? setLong,
    TResult? Function(EditSightModelPointOnMap value)? pointOnMap,
  }) {
    return pointOnMap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditSightModelSetName value)? setName,
    TResult Function(EditSightModelSetDetails value)? setDetails,
    TResult Function(EditSightModelSetType value)? setType,
    TResult Function(EditSightModelSetLat value)? setLat,
    TResult Function(EditSightModelSetLong value)? setLong,
    TResult Function(EditSightModelPointOnMap value)? pointOnMap,
    required TResult orElse(),
  }) {
    if (pointOnMap != null) {
      return pointOnMap(this);
    }
    return orElse();
  }
}

abstract class EditSightModelPointOnMap implements EditSightModelEvent {
  const factory EditSightModelPointOnMap(
      {required final double lat,
      required final double long}) = _$EditSightModelPointOnMap;

  double get lat;
  double get long;
  @JsonKey(ignore: true)
  _$$EditSightModelPointOnMapCopyWith<_$EditSightModelPointOnMap>
      get copyWith => throw _privateConstructorUsedError;
}
