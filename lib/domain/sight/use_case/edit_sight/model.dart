import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain/map/map_coordinates.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/domain/sight/sight_photo.dart';
import 'package:places/domain/sight/sight_type.dart';
import 'package:places/domain/sight/use_case/edit_sight/error.dart';
import 'package:places/domain/sight/use_case/edit_sight/validator.dart';
import 'package:verify/verify.dart';

part 'model.freezed.dart';

enum SightModelField {
  name,
  details,
  type,
  lat,
  long,
  photos,
}

typedef SightModelErrors = Map<SightModelField, List<EditSightModelError>>;

@freezed
class SightModel with _$SightModel {
  bool get isValid => errors.isEmpty;
  bool get isLockedPhotoRemoving => photos.length <= 1;

  EditSightModelError? get nameError => fieldError(SightModelField.name);
  EditSightModelError? get detailsError => fieldError(SightModelField.details);
  EditSightModelError? get latError => fieldError(SightModelField.lat);
  EditSightModelError? get longError => fieldError(SightModelField.long);

  const factory SightModel({
    @Default('') String name,
    @Default('') String details,
    double? lat,
    double? long,
    @Default(SightType.none) SightType type,
    @Default(<SightPhoto>[]) List<SightPhoto> photos,
    @Default(<SightModelField, List<EditSightModelError>> {}) SightModelErrors errors,
  }) = _SightModel;

  const SightModel._();

  factory SightModel.initial() {
    const model = SightModel();

    return model.validate();
  }

  factory SightModel.initialFilled() {
    const lat = 55.73495792679506;
    const long = 37.58815325199811;
    final model = SightModel(
      name: 'test',
      details: 'test',
      lat: lat,
      long: long,
      type: SightType.hotel,
      photos: [
        SightPhoto(imageUrl: 'https://picsum.photos/300/400?_c=1'),
        SightPhoto(imageUrl: 'https://picsum.photos/300/400?_c=2'),
        SightPhoto(imageUrl: 'https://picsum.photos/300/400?_c=3'),
      ],
      errors: {},
    );

    return model.validate();
  }

  EditSightModelError? fieldError(SightModelField field) {
    final fieldErrors = errors[field] ?? [];

    return fieldErrors.isEmpty ? null : fieldErrors.first;
  }

  SightModel validate() {
    final errors = sightModelValidator.verify<EditSightModelError>(this).errorsGroupedBy((error) => error.field);

    return copyWith(errors:errors);
  }

  SightModel addPhoto(SightPhoto photo) {
    return copyWith(photos: [photo, ...photos]);
  }

  SightModel removePhoto(SightPhoto photo) {
    final newPhotos = photos.where((element) => element != photo).toList();

    return copyWith(photos: newPhotos);
  }

  Sight toSight() {
    assert(isValid);

    return Sight(
      name: name,
      coordinates: MapCoordinates(lat: lat!, long: long!),
      details: details,
      type: type,
      photos: photos,
    );
  }
}
