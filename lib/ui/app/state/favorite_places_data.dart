import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/places/favorite/model.dart';

part 'favorite_places_data.freezed.dart';

@freezed
class FavoritePlacesData with _$FavoritePlacesData{
  const factory FavoritePlacesData({
    required bool loaded,
    required bool loading,
    required Either<Failure, BuiltList<FavoritePlace>> data,
  }) = _FavoritePlacesData;

  const FavoritePlacesData._();

  factory FavoritePlacesData.init() {
    return FavoritePlacesData(
      data: Right(emptyFavoritePlaces),
      loading: false,
      loaded: false,
    );
  }

  FavoritePlacesData finishLoading(Either<Failure, BuiltList<FavoritePlace>> data) {
    return copyWith(
      data: data,
      loading: false,
      loaded: true,
    );
  }

  FavoritePlacesData startLoading() {
    return copyWith(
      loading: true,
      loaded: false,
    );
  }

  FavoritePlacesData update(Either<Failure, FavoritePlaces> data) {
    return copyWith(
      data: data,
    );
  }
}
