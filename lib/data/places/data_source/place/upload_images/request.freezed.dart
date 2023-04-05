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

/// @nodoc
mixin _$UploadPlaceImagesRequest {
  List<XFile> get images => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadPlaceImagesRequestCopyWith<UploadPlaceImagesRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadPlaceImagesRequestCopyWith<$Res> {
  factory $UploadPlaceImagesRequestCopyWith(UploadPlaceImagesRequest value,
          $Res Function(UploadPlaceImagesRequest) then) =
      _$UploadPlaceImagesRequestCopyWithImpl<$Res, UploadPlaceImagesRequest>;
  @useResult
  $Res call({List<XFile> images});
}

/// @nodoc
class _$UploadPlaceImagesRequestCopyWithImpl<$Res,
        $Val extends UploadPlaceImagesRequest>
    implements $UploadPlaceImagesRequestCopyWith<$Res> {
  _$UploadPlaceImagesRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UploadPlaceImagesRequestCopyWith<$Res>
    implements $UploadPlaceImagesRequestCopyWith<$Res> {
  factory _$$_UploadPlaceImagesRequestCopyWith(
          _$_UploadPlaceImagesRequest value,
          $Res Function(_$_UploadPlaceImagesRequest) then) =
      __$$_UploadPlaceImagesRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<XFile> images});
}

/// @nodoc
class __$$_UploadPlaceImagesRequestCopyWithImpl<$Res>
    extends _$UploadPlaceImagesRequestCopyWithImpl<$Res,
        _$_UploadPlaceImagesRequest>
    implements _$$_UploadPlaceImagesRequestCopyWith<$Res> {
  __$$_UploadPlaceImagesRequestCopyWithImpl(_$_UploadPlaceImagesRequest _value,
      $Res Function(_$_UploadPlaceImagesRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
  }) {
    return _then(_$_UploadPlaceImagesRequest(
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
    ));
  }
}

/// @nodoc

class _$_UploadPlaceImagesRequest extends _UploadPlaceImagesRequest {
  const _$_UploadPlaceImagesRequest({required final List<XFile> images})
      : _images = images,
        super._();

  final List<XFile> _images;
  @override
  List<XFile> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'UploadPlaceImagesRequest(images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadPlaceImagesRequest &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadPlaceImagesRequestCopyWith<_$_UploadPlaceImagesRequest>
      get copyWith => __$$_UploadPlaceImagesRequestCopyWithImpl<
          _$_UploadPlaceImagesRequest>(this, _$identity);
}

abstract class _UploadPlaceImagesRequest extends UploadPlaceImagesRequest {
  const factory _UploadPlaceImagesRequest({required final List<XFile> images}) =
      _$_UploadPlaceImagesRequest;
  const _UploadPlaceImagesRequest._() : super._();

  @override
  List<XFile> get images;
  @override
  @JsonKey(ignore: true)
  _$$_UploadPlaceImagesRequestCopyWith<_$_UploadPlaceImagesRequest>
      get copyWith => throw _privateConstructorUsedError;
}
