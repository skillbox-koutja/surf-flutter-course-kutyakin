import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/repository/repository.dart';

class GetPlaceDetails implements UseCase<PlaceEntity, int> {
  final PlaceRepository _repository;

  const GetPlaceDetails(this._repository);

  @override
  Future<Either<Failure, PlaceEntity>> call(int id) async {
    return _repository.getPlace(id);
  }
}
