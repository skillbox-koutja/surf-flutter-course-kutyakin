part of 'model.dart';

enum EditablePlaceFieldKeys {
  name,
  details,
  type,
  lat,
  lng,
  photos,
}

typedef EditablePlaceNameField = Field<String, EditablePlaceError>;
typedef EditablePlaceDetailsField = Field<String, EditablePlaceError>;
typedef EditablePlaceGeoField = Field<double?, EditablePlaceError>;
typedef EditablePlaceTypeField = Field<PlaceType, EditablePlaceError>;
typedef EditablePlacePhotosField = Field<BuiltList<PlacePhoto>, EditablePlaceError>;

typedef EditablePlaceErrors = Map<EditablePlaceFieldKeys, List<EditablePlaceError>>;

final _nameField = Field<String, EditablePlaceError>.create(
  value: '',
  validator: _notEmptyString,
);

final _detailsField = Field<String, EditablePlaceError>.create(
  value: '',
  validator: _notEmptyString,
);

final _latField = Field<double?, EditablePlaceError>.create(
  value: null,
  validator: Verify.all([_notNullGeo, _rangeGeo]),
);

final _lngField = Field<double?, EditablePlaceError>.create(
  value: null,
  validator: Verify.all([_notNullGeo, _rangeGeo]),
);

final _typeField = Field<PlaceType, EditablePlaceError>.create(
  value: PlaceType.none,
  validator: _needChoicePlaceType,
);

final _photosField = Field<BuiltList<PlacePhoto>, EditablePlaceError>.create(
  value: <PlacePhoto>[].toBuiltList(),
  validator: _notEmptyPlacePhotos,
);