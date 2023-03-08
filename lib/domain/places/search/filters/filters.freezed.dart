// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchFilters {
  GeoFilter get geoFilter => throw _privateConstructorUsedError;
  CategorySelector get categorySelector => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchFiltersCopyWith<SearchFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchFiltersCopyWith<$Res> {
  factory $SearchFiltersCopyWith(
          SearchFilters value, $Res Function(SearchFilters) then) =
      _$SearchFiltersCopyWithImpl<$Res, SearchFilters>;
  @useResult
  $Res call({GeoFilter geoFilter, CategorySelector categorySelector});

  $GeoFilterCopyWith<$Res> get geoFilter;
  $CategorySelectorCopyWith<$Res> get categorySelector;
}

/// @nodoc
class _$SearchFiltersCopyWithImpl<$Res, $Val extends SearchFilters>
    implements $SearchFiltersCopyWith<$Res> {
  _$SearchFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoFilter = null,
    Object? categorySelector = null,
  }) {
    return _then(_value.copyWith(
      geoFilter: null == geoFilter
          ? _value.geoFilter
          : geoFilter // ignore: cast_nullable_to_non_nullable
              as GeoFilter,
      categorySelector: null == categorySelector
          ? _value.categorySelector
          : categorySelector // ignore: cast_nullable_to_non_nullable
              as CategorySelector,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoFilterCopyWith<$Res> get geoFilter {
    return $GeoFilterCopyWith<$Res>(_value.geoFilter, (value) {
      return _then(_value.copyWith(geoFilter: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CategorySelectorCopyWith<$Res> get categorySelector {
    return $CategorySelectorCopyWith<$Res>(_value.categorySelector, (value) {
      return _then(_value.copyWith(categorySelector: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SearchFiltersCopyWith<$Res>
    implements $SearchFiltersCopyWith<$Res> {
  factory _$$_SearchFiltersCopyWith(
          _$_SearchFilters value, $Res Function(_$_SearchFilters) then) =
      __$$_SearchFiltersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GeoFilter geoFilter, CategorySelector categorySelector});

  @override
  $GeoFilterCopyWith<$Res> get geoFilter;
  @override
  $CategorySelectorCopyWith<$Res> get categorySelector;
}

/// @nodoc
class __$$_SearchFiltersCopyWithImpl<$Res>
    extends _$SearchFiltersCopyWithImpl<$Res, _$_SearchFilters>
    implements _$$_SearchFiltersCopyWith<$Res> {
  __$$_SearchFiltersCopyWithImpl(
      _$_SearchFilters _value, $Res Function(_$_SearchFilters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoFilter = null,
    Object? categorySelector = null,
  }) {
    return _then(_$_SearchFilters(
      geoFilter: null == geoFilter
          ? _value.geoFilter
          : geoFilter // ignore: cast_nullable_to_non_nullable
              as GeoFilter,
      categorySelector: null == categorySelector
          ? _value.categorySelector
          : categorySelector // ignore: cast_nullable_to_non_nullable
              as CategorySelector,
    ));
  }
}

/// @nodoc

class _$_SearchFilters extends _SearchFilters {
  const _$_SearchFilters(
      {required this.geoFilter, required this.categorySelector})
      : super._();

  @override
  final GeoFilter geoFilter;
  @override
  final CategorySelector categorySelector;

  @override
  String toString() {
    return 'SearchFilters(geoFilter: $geoFilter, categorySelector: $categorySelector)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchFilters &&
            (identical(other.geoFilter, geoFilter) ||
                other.geoFilter == geoFilter) &&
            (identical(other.categorySelector, categorySelector) ||
                other.categorySelector == categorySelector));
  }

  @override
  int get hashCode => Object.hash(runtimeType, geoFilter, categorySelector);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchFiltersCopyWith<_$_SearchFilters> get copyWith =>
      __$$_SearchFiltersCopyWithImpl<_$_SearchFilters>(this, _$identity);
}

abstract class _SearchFilters extends SearchFilters {
  const factory _SearchFilters(
      {required final GeoFilter geoFilter,
      required final CategorySelector categorySelector}) = _$_SearchFilters;
  const _SearchFilters._() : super._();

  @override
  GeoFilter get geoFilter;
  @override
  CategorySelector get categorySelector;
  @override
  @JsonKey(ignore: true)
  _$$_SearchFiltersCopyWith<_$_SearchFilters> get copyWith =>
      throw _privateConstructorUsedError;
}
