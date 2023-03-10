import 'package:verify/verify.dart';

class EditablePlaceError implements ValidationError {
  final String message;

  @override
  String get errorDescription => message;

  const EditablePlaceError({required this.message});
}
