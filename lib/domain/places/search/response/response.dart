import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/places/place/entity.dart';

class SearchResponse {
  final String query;
  final Either<Failure, PlaceEntities> response;

  const SearchResponse({
    required this.query,
    required this.response,
  });
}