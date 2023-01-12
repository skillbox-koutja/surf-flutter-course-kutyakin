import 'package:places/assets/messages/locale/ru.dart';

abstract class SightStatus {
  final SightStatusType type;

  bool get isPlanned => type == SightStatusType.planned;
  bool get isDone => type == SightStatusType.done;

  const SightStatus({required this.type});
}

enum SightStatusType {
  planned,
  done,
}

class CertainPlannedSightStatus extends SightStatus {
  final DateTime date;

  const CertainPlannedSightStatus({
    required this.date,
  }) : super(
          type: SightStatusType.planned,
        );

  @override
  String toString() {
    return AppMessages.sightStatus.certainPlanned(date);
  }
}

class CertainDoneSightStatus extends SightStatus {
  final DateTime date;

  const CertainDoneSightStatus({
    required this.date,
  }) : super(
          type: SightStatusType.done,
        );

  @override
  String toString() {
    return AppMessages.sightStatus.certainDone(date);
  }
}
