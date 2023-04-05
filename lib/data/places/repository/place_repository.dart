import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:places/data/places/data_source/place/edit/request.dart';
import 'package:places/data/places/data_source/place/new/request.dart';
import 'package:places/data/places/data_source/place/response.dart';
import 'package:places/data/places/data_source/place/search/request.dart';
import 'package:places/data/places/data_source/place/search/response.dart';
import 'package:places/data/places/data_source/place/upload_images/request.dart';
import 'package:places/data/places/data_source/remote.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/geo/filter.dart';
import 'package:places/domain/geo/geo.dart';
import 'package:places/domain/places/category/selector.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/model.dart';
import 'package:places/domain/places/place/photo.dart';
import 'package:places/domain/places/place/repository/repository.dart';
import 'package:places/domain/places/place/type.dart';
import 'package:places/domain/places/place/use_case/edit/model.dart';

class PlaceRepositoryImpl implements PlaceRepository {
  final PlaceRemoteDataSource remoteDataSource;

  const PlaceRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, PlaceEntity>> createPlace(Place place) async {
    try {
      final request = NewPlaceRequest.fromPlace(place);
      final response = await remoteDataSource.createPlace(request);

      return Right(PlaceEntity(
        id: response.id,
        place: place,
      ));
    } on DioError {
      return Left(FailedCreateEntity());
    }
  }

  @override
  Future<Either<Failure, PlaceEntity>> editPlace(
      int id, EditablePlace place) async {
    try {
      final request = EditPlaceRequest.fromPlace(place);
      final dto = await remoteDataSource.editPlace(id.toString(), request);

      return Right(_placeDtoToPlaceEntity(dto));
    } on DioError {
      return Left(FailedEditEntity());
    }
  }

  @override
  Future<Either<Failure, PlaceEntity>> getPlace(int id) async {
    try {
      final dto = await remoteDataSource.getPlace(id.toString());

      return Right(_placeDtoToPlaceEntity(dto));
    } on DioError {
      return Left(NotFoundEntity());
    }
  }

  @override
  Future<Either<Failure, PlaceEntities>> searchPlaces({
    String? nameFilter,
    GeoFilter? geoFilter,
    CategorySelector? categorySelector,
  }) async {
    try {
      var typeFilter = categorySelector?.selectedTypeNames.toList();
      if (typeFilter != null && typeFilter.isEmpty) {
        typeFilter = null;
      }
      final geo = geoFilter?.geo;

      final placeDtoList = await remoteDataSource.searchPlaces(
        SearchPlaceRequest(
          nameFilter: nameFilter,
          lat: geo?.lat,
          lng: geo?.lng,
          radius: geoFilter?.radius,
          typeFilter: typeFilter,
        ),
      );
      final places = placeDtoList.map(_searchDtoToPlaceEntity).toBuiltList();

      return Right(places);
    } on DioError {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, BuiltList<PlacePhoto>>> uploadPlaceImages(
    List<XFile> images,
  ) async {
    try {
      final request = UploadPlaceImagesRequest(images: images);
      final files = await request.multipartFiles();
      final urls = await remoteDataSource.uploadFiles(files: files);
      final photos = urls.map(_toPlacePhoto).toBuiltList();

      return Right(photos);
    } on DioError {
      return Left(ServerFailure());
    }
  }

  PlaceEntity _placeDtoToPlaceEntity(PlaceDto dto) {
    return PlaceEntity(
      id: dto.id,
      place: Place(
        name: dto.name,
        geo: Geo(lat: dto.lat, lng: dto.lng),
        details: dto.description,
        type: PlaceType.fromString(dto.placeType),
        photos: dto.urls.map(_toPlacePhoto).toBuiltList(),
      ),
    );
  }

  PlaceEntity _searchDtoToPlaceEntity(SearchPlaceDto dto) {
    return PlaceEntity(
      id: dto.id,
      place: Place(
        name: dto.name,
        geo: Geo(lat: dto.lat, lng: dto.lng),
        details: dto.description,
        type: PlaceType.fromString(dto.placeType),
        photos: dto.urls.map(_toPlacePhoto).toBuiltList(),
      ),
    );
  }

  PlacePhoto _toPlacePhoto(String url) {
    return PlacePhoto(
      imageProvider: PlacePhotoProvider.network(url),
    );
  }
}
