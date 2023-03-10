import 'package:places/assets/messages/locale/ru.dart';

abstract class PlaceStatus {
  final PlaceStatusType type;

  bool get isPlanned => type == PlaceStatusType.planned;
  bool get isDone => type == PlaceStatusType.done;

  const PlaceStatus({required this.type});
}

enum PlaceStatusType {
  planned,
  done,
}

class CertainPlannedPlaceStatus extends PlaceStatus {
  final DateTime date;

  const CertainPlannedPlaceStatus({
    required this.date,
  }) : super(
          type: PlaceStatusType.planned,
        );

  @override
  String toString() {
    return AppMessages.placeStatus.certainPlanned(date);
  }
}

class CertainDonePlaceStatus extends PlaceStatus {
  final DateTime date;

  const CertainDonePlaceStatus({
    required this.date,
  }) : super(
          type: PlaceStatusType.done,
        );

  @override
  String toString() {
    return AppMessages.placeStatus.certainDone(date);
  }
}
