// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlacePhotoProvider {
  String get url => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlacePhotoNetworkImage value) network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlacePhotoNetworkImage value)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlacePhotoNetworkImage value)? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlacePhotoProviderCopyWith<PlacePhotoProvider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacePhotoProviderCopyWith<$Res> {
  factory $PlacePhotoProviderCopyWith(
          PlacePhotoProvider value, $Res Function(PlacePhotoProvider) then) =
      _$PlacePhotoProviderCopyWithImpl<$Res, PlacePhotoProvider>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$PlacePhotoProviderCopyWithImpl<$Res, $Val extends PlacePhotoProvider>
    implements $PlacePhotoProviderCopyWith<$Res> {
  _$PlacePhotoProviderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlacePhotoNetworkImageCopyWith<$Res>
    implements $PlacePhotoProviderCopyWith<$Res> {
  factory _$$PlacePhotoNetworkImageCopyWith(_$PlacePhotoNetworkImage value,
          $Res Function(_$PlacePhotoNetworkImage) then) =
      __$$PlacePhotoNetworkImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$PlacePhotoNetworkImageCopyWithImpl<$Res>
    extends _$PlacePhotoProviderCopyWithImpl<$Res, _$PlacePhotoNetworkImage>
    implements _$$PlacePhotoNetworkImageCopyWith<$Res> {
  __$$PlacePhotoNetworkImageCopyWithImpl(_$PlacePhotoNetworkImage _value,
      $Res Function(_$PlacePhotoNetworkImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$PlacePhotoNetworkImage(
      null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlacePhotoNetworkImage implements PlacePhotoNetworkImage {
  const _$PlacePhotoNetworkImage(this.url);

  @override
  final String url;

  @override
  String toString() {
    return 'PlacePhotoProvider.network(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacePhotoNetworkImage &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlacePhotoNetworkImageCopyWith<_$PlacePhotoNetworkImage> get copyWith =>
      __$$PlacePhotoNetworkImageCopyWithImpl<_$PlacePhotoNetworkImage>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) network,
  }) {
    return network(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url)? network,
  }) {
    return network?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlacePhotoNetworkImage value) network,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlacePhotoNetworkImage value)? network,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlacePhotoNetworkImage value)? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class PlacePhotoNetworkImage implements PlacePhotoProvider {
  const factory PlacePhotoNetworkImage(final String url) =
      _$PlacePhotoNetworkImage;

  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$PlacePhotoNetworkImageCopyWith<_$PlacePhotoNetworkImage> get copyWith =>
      throw _privateConstructorUsedError;
}
