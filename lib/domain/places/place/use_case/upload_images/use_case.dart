import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/place/photo.dart';
import 'package:places/domain/places/place/repository/repository.dart';

class UploadPlaceImages implements UseCase<BuiltList<PlacePhoto>, List<XFile>> {
  final PlaceRepository _repository;

  const UploadPlaceImages(this._repository);

  @override
  Future<Either<Failure, BuiltList<PlacePhoto>>> call(List<XFile> images) {
    return _repository.uploadPlaceImages(images);
  }
}
