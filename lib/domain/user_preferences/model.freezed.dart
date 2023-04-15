// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserPreferencesModel {
  AppThemeMode get themeMode => throw _privateConstructorUsedError;
  double get radius => throw _privateConstructorUsedError;
  BuiltList<CategoryOption> get selectedCategories =>
      throw _privateConstructorUsedError;
  bool get seenOnboarding => throw _privateConstructorUsedError;
  Geo get location => throw _privateConstructorUsedError;
  bool get allowedUseLocation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserPreferencesModelCopyWith<UserPreferencesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesModelCopyWith<$Res> {
  factory $UserPreferencesModelCopyWith(UserPreferencesModel value,
          $Res Function(UserPreferencesModel) then) =
      _$UserPreferencesModelCopyWithImpl<$Res, UserPreferencesModel>;
  @useResult
  $Res call(
      {AppThemeMode themeMode,
      double radius,
      BuiltList<CategoryOption> selectedCategories,
      bool seenOnboarding,
      Geo location,
      bool allowedUseLocation});
}

/// @nodoc
class _$UserPreferencesModelCopyWithImpl<$Res,
        $Val extends UserPreferencesModel>
    implements $UserPreferencesModelCopyWith<$Res> {
  _$UserPreferencesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? radius = null,
    Object? selectedCategories = null,
    Object? seenOnboarding = null,
    Object? location = null,
    Object? allowedUseLocation = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as AppThemeMode,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
      selectedCategories: null == selectedCategories
          ? _value.selectedCategories
          : selectedCategories // ignore: cast_nullable_to_non_nullable
              as BuiltList<CategoryOption>,
      seenOnboarding: null == seenOnboarding
          ? _value.seenOnboarding
          : seenOnboarding // ignore: cast_nullable_to_non_nullable
              as bool,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Geo,
      allowedUseLocation: null == allowedUseLocation
          ? _value.allowedUseLocation
          : allowedUseLocation // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserPreferencesModelCopyWith<$Res>
    implements $UserPreferencesModelCopyWith<$Res> {
  factory _$$_UserPreferencesModelCopyWith(_$_UserPreferencesModel value,
          $Res Function(_$_UserPreferencesModel) then) =
      __$$_UserPreferencesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AppThemeMode themeMode,
      double radius,
      BuiltList<CategoryOption> selectedCategories,
      bool seenOnboarding,
      Geo location,
      bool allowedUseLocation});
}

/// @nodoc
class __$$_UserPreferencesModelCopyWithImpl<$Res>
    extends _$UserPreferencesModelCopyWithImpl<$Res, _$_UserPreferencesModel>
    implements _$$_UserPreferencesModelCopyWith<$Res> {
  __$$_UserPreferencesModelCopyWithImpl(_$_UserPreferencesModel _value,
      $Res Function(_$_UserPreferencesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? radius = null,
    Object? selectedCategories = null,
    Object? seenOnboarding = null,
    Object? location = null,
    Object? allowedUseLocation = null,
  }) {
    return _then(_$_UserPreferencesModel(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as AppThemeMode,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
      selectedCategories: null == selectedCategories
          ? _value.selectedCategories
          : selectedCategories // ignore: cast_nullable_to_non_nullable
              as BuiltList<CategoryOption>,
      seenOnboarding: null == seenOnboarding
          ? _value.seenOnboarding
          : seenOnboarding // ignore: cast_nullable_to_non_nullable
              as bool,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Geo,
      allowedUseLocation: null == allowedUseLocation
          ? _value.allowedUseLocation
          : allowedUseLocation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UserPreferencesModel extends _UserPreferencesModel {
  const _$_UserPreferencesModel(
      {required this.themeMode,
      required this.radius,
      required this.selectedCategories,
      required this.seenOnboarding,
      required this.location,
      this.allowedUseLocation = false})
      : super._();

  @override
  final AppThemeMode themeMode;
  @override
  final double radius;
  @override
  final BuiltList<CategoryOption> selectedCategories;
  @override
  final bool seenOnboarding;
  @override
  final Geo location;
  @override
  @JsonKey()
  final bool allowedUseLocation;

  @override
  String toString() {
    return 'UserPreferencesModel(themeMode: $themeMode, radius: $radius, selectedCategories: $selectedCategories, seenOnboarding: $seenOnboarding, location: $location, allowedUseLocation: $allowedUseLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserPreferencesModel &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            const DeepCollectionEquality()
                .equals(other.selectedCategories, selectedCategories) &&
            (identical(other.seenOnboarding, seenOnboarding) ||
                other.seenOnboarding == seenOnboarding) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.allowedUseLocation, allowedUseLocation) ||
                other.allowedUseLocation == allowedUseLocation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      themeMode,
      radius,
      const DeepCollectionEquality().hash(selectedCategories),
      seenOnboarding,
      location,
      allowedUseLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserPreferencesModelCopyWith<_$_UserPreferencesModel> get copyWith =>
      __$$_UserPreferencesModelCopyWithImpl<_$_UserPreferencesModel>(
          this, _$identity);
}

abstract class _UserPreferencesModel extends UserPreferencesModel {
  const factory _UserPreferencesModel(
      {required final AppThemeMode themeMode,
      required final double radius,
      required final BuiltList<CategoryOption> selectedCategories,
      required final bool seenOnboarding,
      required final Geo location,
      final bool allowedUseLocation}) = _$_UserPreferencesModel;
  const _UserPreferencesModel._() : super._();

  @override
  AppThemeMode get themeMode;
  @override
  double get radius;
  @override
  BuiltList<CategoryOption> get selectedCategories;
  @override
  bool get seenOnboarding;
  @override
  Geo get location;
  @override
  bool get allowedUseLocation;
  @override
  @JsonKey(ignore: true)
  _$$_UserPreferencesModelCopyWith<_$_UserPreferencesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
