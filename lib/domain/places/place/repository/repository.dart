import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/geo/filter.dart';
import 'package:places/domain/places/category/selector.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/model.dart';
import 'package:places/domain/places/place/use_case/edit/model.dart';

abstract class PlaceRepository {
  Future<Either<Failure, PlaceEntities>> searchPlaces({
    String? nameFilter,
    GeoFilter? geoFilter,
    CategorySelector? categorySelector,
  });

  Future<Either<Failure, PlaceEntity>> getPlace(int id);

  Future<Either<Failure, PlaceEntity>> createPlace(Place place);

  Future<Either<Failure, PlaceEntity>> editPlace(int id, EditablePlace place);
}
