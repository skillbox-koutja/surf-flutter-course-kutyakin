import 'package:places/domain/sight/sight.dart';
import 'package:places/domain/sight/sight_status.dart';

class FavoriteSight {
  final Sight sight;
  final SightStatus status;

  const FavoriteSight._({
    required this.sight,
    required this.status,
  });

  factory FavoriteSight.certainPlanned({
    required Sight sight,
    required DateTime date,
  }) {
    return FavoriteSight._(
      sight: sight,
      status: CertainPlannedSightStatus(date: date),
    );
  }

  factory FavoriteSight.certainDone({
    required Sight sight,
    required DateTime date,
  }) {
    return FavoriteSight._(
      sight: sight,
      status: CertainDoneSightStatus(date: date),
    );
  }

  FavoriteSight done(DateTime date) {
    return FavoriteSight.certainDone(
      sight: sight,
      date: date,
    );
  }
}
