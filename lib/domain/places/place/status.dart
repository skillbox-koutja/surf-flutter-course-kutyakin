import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:places/assets/messages/locale/ru.dart';

part 'status.g.dart';

@JsonSerializable()
class PlaceStatus extends Equatable {
  final DateTime date;
  final PlaceStatusType type;

  @override
  List<Object?> get props => [
    date,
    type,
  ];

  bool get isPlanned => type == PlaceStatusType.planned;
  bool get isDone => type == PlaceStatusType.done;

  const PlaceStatus({
    required this.type,
    required this.date,
  });

  factory PlaceStatus.fromJson(Map<String, dynamic> json) => _$PlaceStatusFromJson(json);

  @override
  String toString() {
    if (isDone) {
      return AppMessages.placeStatus.certainDone(date);
    }

    return AppMessages.placeStatus.certainPlanned(date);
  }

  Map<String, dynamic> toJson() => _$PlaceStatusToJson(this);
}

enum PlaceStatusType {
  planned,
  done,
}

class CertainPlannedPlaceStatus extends PlaceStatus {
  const CertainPlannedPlaceStatus({
    required super.date,
  }) : super(
          type: PlaceStatusType.planned,
        );
}

class CertainDonePlaceStatus extends PlaceStatus {
  const CertainDonePlaceStatus({
    required super.date,
  }) : super(
          type: PlaceStatusType.done,
        );
}
