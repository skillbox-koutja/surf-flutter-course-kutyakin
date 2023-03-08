import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/repository/repository.dart';
import 'package:places/domain/places/place/use_case/edit/model.dart';

class CreatePlaceEntity implements UseCase<PlaceEntity, EditablePlace> {
  final PlaceRepository placeRepository;

  const CreatePlaceEntity({
    required this.placeRepository,
  });

  @override
  Future<Either<Failure, PlaceEntity>> call(EditablePlace editablePlace) {
    if (!editablePlace.isValid) {
      return Future.value(Left(InvalidModel()));
    }

    final place = editablePlace.toPlace();

    return placeRepository.createPlace(place);
  }
}
