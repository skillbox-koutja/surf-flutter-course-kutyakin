import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain/map/map_coordinates.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/domain/sight/sight_type.dart';
import 'package:places/domain/sight/use_case/edit_sight/error.dart';

part 'model.freezed.dart';

enum SightModelField {
  name,
  imageUrl,
  details,
  type,
  lat,
  long,
}

@freezed
class SightModel with _$SightModel {
  bool get isValid => errors.isEmpty;

  EditSightModelError? get nameError => fieldError(SightModelField.name);
  EditSightModelError? get detailsError => fieldError(SightModelField.details);
  EditSightModelError? get latError => fieldError(SightModelField.lat);
  EditSightModelError? get longError => fieldError(SightModelField.long);

  const factory SightModel({
    @Default('') String name,
    @Default('https://picsum.photos/300/400') String imageUrl,
    @Default('') String details,
    double? lat,
    double? long,
    @Default(SightType.none) SightType type,
    required Map<SightModelField, List<EditSightModelError>> errors,
  }) = _SightModel;

  const SightModel._();

  factory SightModel.initial() {
    return const SightModel(
      errors: {},
    );
  }

  factory SightModel.initialFilled() {
    const lat = 55.73495792679506;
    const long = 37.58815325199811;

    return const SightModel(
      name: 'test',
      details: 'test',
      lat: lat,
      long: long,
      type: SightType.hotel,
      errors: {},
    );
  }

  EditSightModelError? fieldError(SightModelField field) {
    final fieldErrors = errors[field] ?? [];

    return fieldErrors.isEmpty ? null : fieldErrors.first;
  }

  Sight toSight() {
    assert(isValid);

    return Sight(
      name: name,
      coordinates: MapCoordinates(lat: lat!, long: long!),
      imageUrl: imageUrl,
      details: details,
      type: type,
    );
  }
}
