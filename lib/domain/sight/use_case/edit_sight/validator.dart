import 'package:places/domain/sight/sight_type.dart';
import 'package:places/domain/sight/use_case/edit_sight/error.dart';
import 'package:places/domain/sight/use_case/edit_sight/model.dart';
import 'package:verify/verify.dart';

final Validator<SightModel> sightModelValidator = Verify.all<SightModel>([
  Verify.subject<SightModel>().checkField(
    (state) => state.name,
    Verify.that<String>(
      (s) => s.isNotEmpty,
      error: const EditSightModelError(
        field: SightModelField.name,
        message: 'incorrect length',
      ),
    ),
  ),
  Verify.subject<SightModel>().checkField(
    (state) => state.details,
    Verify.that<String>(
      (value) => value.isNotEmpty,
      error: const EditSightModelError(
        field: SightModelField.details,
        message: 'incorrect length',
      ),
    ),
  ),
  Verify.subject<SightModel>().checkField(
    (state) => state.lat,
    Verify.that<double?>(
      (value) => value != null,
      error: const EditSightModelError(
        field: SightModelField.lat,
        message: 'cannot be empty',
      ),
    ),
  ),
  Verify.subject<SightModel>().checkField(
    (state) => state.long,
    Verify.that<double?>(
      (value) => value != null,
      error: const EditSightModelError(
        field: SightModelField.long,
        message: 'cannot be empty',
      ),
    ),
  ),
  Verify.subject<SightModel>().checkField(
    (state) => state.type,
    Verify.that<SightType>(
      (value) => !value.isNone(),
      error: const EditSightModelError(
        field: SightModelField.type,
        message: 'need choice type',
      ),
    ),
  ),
]);
