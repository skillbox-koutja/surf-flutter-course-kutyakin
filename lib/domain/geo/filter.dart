import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain/geo/geo.dart';

part 'filter.freezed.dart';

@freezed
class GeoFilter with _$GeoFilter {
  const factory GeoFilter({
    required bool enabled,
    required Geo geo,
    required double radius,
  }) = _GeoFilter;

  const GeoFilter._();

  GeoFilter enable() {
    return copyWith(
      enabled: true,
    );
  }

  GeoFilter disable() {
    return copyWith(
      enabled: false,
    );
  }

  GeoFilter editRadius(double radius) {
    return copyWith(
      radius: radius,
    );
  }

  GeoFilter changeGeoLocation(Geo geo) {
    return copyWith(
      geo: geo,
    );
  }
}
