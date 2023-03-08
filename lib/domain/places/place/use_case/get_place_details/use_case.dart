import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/repository/repository.dart';

class GetPlaceDetails implements UseCase<PlaceEntity, int> {
  final PlaceRepository placeRepository;

  const GetPlaceDetails({
    required this.placeRepository,
  });

  @override
  Future<Either<Failure, PlaceEntity>> call(int id) async {
    return placeRepository.getPlace(id);
  }
}
