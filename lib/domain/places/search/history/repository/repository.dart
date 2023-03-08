import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';

abstract class SearchHistoryRepository {
  Future<Either<Failure, BuiltList<String>>> getHistory();

  Future<Either<Failure, void>> clear();

  Future<Either<Failure, void>> add(String query);

  Future<Either<Failure, void>> remove(String query);
}