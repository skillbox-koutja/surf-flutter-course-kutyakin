import 'package:places/domain/sight/use_case/edit_sight/model.dart';
import 'package:verify/verify.dart';

class EditSightModelError implements ValidationError {
  final SightModelField field;

  final String message;

  @override
  String get errorDescription => message;

  const EditSightModelError({required this.field, required this.message});
}
