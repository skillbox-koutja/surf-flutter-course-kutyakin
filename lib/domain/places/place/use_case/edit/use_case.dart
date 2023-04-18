import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/repository/repository.dart';
import 'package:places/domain/places/place/use_case/edit/model.dart';

class EditPlaceArgs extends Equatable {
  final int id;
  final EditablePlace place;

  @override
  List<Object> get props => [
    id,
    place,
  ];

  const EditPlaceArgs({
    required this.id,
    required this.place,
  });
}

class EditPlaceEntity implements UseCase<PlaceEntity, EditPlaceArgs>{
  final PlaceRepository _repository;

  const EditPlaceEntity(this._repository);

  @override
  Future<Either<Failure, PlaceEntity>> call(EditPlaceArgs args) {
    if (!args.place.isValid) {
      return Future.value(Left(InvalidModel()));
    }

    return _repository.editPlace(args.id, args.place);
  }
}