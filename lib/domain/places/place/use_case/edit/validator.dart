part of 'model.dart';

final _notEmptyString = Verify.that<String>(
      (s) => s.isNotEmpty,
  error: const EditablePlaceError(
    message: 'incorrect length',
  ),
);

final _notNullGeo = Verify.that<double?>(
      (value) => value != null,
  error: const EditablePlaceError(
    message: 'cannot be empty',
  ),
);

final _rangeGeo = Verify.that<double?>(
      (value) {
        if (value == null) return true;

        return -90 <= value && value <= 90;
      },
  error: const EditablePlaceError(
    message: 'should be between [-90, 90]',
  ),
);

final _notEmptyPlacePhotos = Verify.that<BuiltList<PlacePhoto>>(
      (value) => value.isNotEmpty,
  error: const EditablePlaceError(
    message: 'cannot be empty',
  ),
);

final _needChoicePlaceType = Verify.that<PlaceType>(
      (value) => !value.isNone(),
  error: const EditablePlaceError(
    message: 'need choice type',
  ),
);