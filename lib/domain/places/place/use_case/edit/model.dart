import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain/core/error/exception.dart';
import 'package:places/domain/core/field/field.dart';
import 'package:places/domain/geo/geo.dart';
import 'package:places/domain/places/place/model.dart';
import 'package:places/domain/places/place/photo.dart';
import 'package:places/domain/places/place/type.dart';
import 'package:places/domain/places/place/use_case/edit/command.dart';
import 'package:places/domain/places/place/use_case/edit/error.dart';
import 'package:verify/verify.dart';

part 'fields.dart';
part 'validator.dart';
part 'model.freezed.dart';

typedef EditablePlaceFields = BuiltMap<EditablePlaceFieldKeys, Field<dynamic, EditablePlaceError>>;

@freezed
class EditablePlace with _$EditablePlace {
  bool get isValid => fields.values.every((field) => field.isValid);
  bool get isTouched => fields.values.any((field) => field.isDirty);
  bool get canSave => isValid && isTouched;

  EditablePlaceNameField get name => fields[EditablePlaceFieldKeys.name] as EditablePlaceNameField;
  EditablePlaceDetailsField get details => fields[EditablePlaceFieldKeys.details] as EditablePlaceDetailsField;
  EditablePlaceGeoField get lat => fields[EditablePlaceFieldKeys.lat] as EditablePlaceGeoField;
  EditablePlaceGeoField get lng => fields[EditablePlaceFieldKeys.lng] as EditablePlaceGeoField;
  EditablePlaceTypeField get type => fields[EditablePlaceFieldKeys.type] as EditablePlaceTypeField;
  EditablePlacePhotosField get photos => fields[EditablePlaceFieldKeys.photos] as EditablePlacePhotosField;

  const factory EditablePlace({
    required EditablePlaceFields fields,
  }) = _EditablePlace;

  const EditablePlace._();

  factory EditablePlace.newPlace() {
    final fields = {
      EditablePlaceFieldKeys.name: _nameField.validate(),
      EditablePlaceFieldKeys.details: _detailsField.validate(),
      EditablePlaceFieldKeys.lat: _latField.validate(),
      EditablePlaceFieldKeys.lng: _lngField.validate(),
      EditablePlaceFieldKeys.type: _typeField.validate(),
      EditablePlaceFieldKeys.photos: _photosField.validate(),
    };

    return EditablePlace(
      fields: BuiltMap(fields),
    );
  }

  factory EditablePlace.editPlace(Place place) {
    final fields = {
      EditablePlaceFieldKeys.name: _nameField.untouchedEdit(place.name),
      EditablePlaceFieldKeys.details: _detailsField.untouchedEdit(place.details),
      EditablePlaceFieldKeys.lat: _latField.untouchedEdit(place.geo.lat),
      EditablePlaceFieldKeys.lng: _lngField.untouchedEdit(place.geo.lng),
      EditablePlaceFieldKeys.type: _typeField.untouchedEdit(place.type),
      EditablePlaceFieldKeys.photos: _photosField.untouchedEdit(place.photos),
    };

    return EditablePlace(
      fields: BuiltMap(fields),
    );
  }

  factory EditablePlace.initialFilled() {
    final fields = {
      EditablePlaceFieldKeys.name: _nameField.untouchedEdit('mtest'),
      EditablePlaceFieldKeys.details: _detailsField.untouchedEdit('mtest'),
      EditablePlaceFieldKeys.lat: _latField.untouchedEdit(55.73495792679506),
      EditablePlaceFieldKeys.lng: _lngField.untouchedEdit(37.58815325199811),
      EditablePlaceFieldKeys.type: _typeField.untouchedEdit(PlaceType.hotel),
      EditablePlaceFieldKeys.photos: _photosField.untouchedEdit([
        PlacePhoto(
          imageProvider: const PlacePhotoProvider.network('https://picsum.photos/300/400?_c=1'),
        ),
        PlacePhoto(
          imageProvider: const PlacePhotoProvider.network('https://picsum.photos/300/400?_c=2'),
        ),
        PlacePhoto(
          imageProvider: const PlacePhotoProvider.network('https://picsum.photos/300/400?_c=3'),
        ),
      ].toBuiltList()),
    };

    return EditablePlace(
      fields: BuiltMap(fields),
    );
  }

  EditablePlace edit(EditPlaceCommand command) {
    final newFields = _edit(command);

    return EditablePlace(
      fields: newFields,
    );
  }

  EditablePlace touchField(EditablePlaceFieldKeys key) {
    final field = fields[key];

    if (field == null) {
      throw DomainException({
        'message': 'Unexpected field',
        'field': field,
      });
    }
    if (field.isDirty) {
      throw DomainException('Field "${key.name}" is already touched');
    }

    final newFields = fields.rebuild((b) => b[key] = field.touch());

    return EditablePlace(
      fields: newFields,
    );
  }

  EditablePlace save() {
    if (!canSave) {
      throw DomainException('Place can not be save');
    }

    final newFields = fields.rebuild((b) {
      for (final entry in fields.entries) {
        b[entry.key] = entry.value.save();
      }
    });

    return EditablePlace(
      fields: newFields,
    );
  }

  Place toPlace() {
    assert(isValid);

    return Place(
      name: name.value,
      geo: Geo(lat: lat.value!, lng: lng.value!),
      details: details.value,
      type: type.value,
      photos: photos.value,
    );
  }

  EditablePlaceFields _edit(EditPlaceCommand command) {
    return command.when(
      setName: (value) => fields.rebuild((b) => b[EditablePlaceFieldKeys.name] = name.edit(value)),
      setDetails: (value) => fields.rebuild((b) => b[EditablePlaceFieldKeys.details] = details.edit(value)),
      setType: (value) => fields.rebuild((b) => b[EditablePlaceFieldKeys.type] = type.edit(value)),
      setLat: (value) => fields.rebuild((b) => b[EditablePlaceFieldKeys.lat] = lat.edit(value)),
      setLng: (value) => fields.rebuild((b) => b[EditablePlaceFieldKeys.lng] = lng.edit(value)),
      pointOnMap: (latValue, lngValue) => fields.rebuild((b) {
        b[EditablePlaceFieldKeys.lat] = lat.edit(latValue);
        b[EditablePlaceFieldKeys.lng] = lng.edit(lngValue);
      }),
      addPhoto: (photo) => fields.rebuild((b) {
        b[EditablePlaceFieldKeys.photos] = photos.edit(photos.value.rebuild((pb) => pb.add(photo)));
      }),
      removePhoto: (photo) => fields.rebuild((b) {
        b[EditablePlaceFieldKeys.photos] = photos.edit(photos.value.rebuild((pb) => pb.remove(photo)));
      }),
    );
  }
}
