
import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/places/search/history/repository/repository.dart';

class SearchHistoryRepositoryImpl implements SearchHistoryRepository {
  BuiltList<String> history = BuiltList(<String>[]);

  @override
  Future<Either<Failure, void>> add(String query) {
    history = history.rebuild((b) {
      b
        ..remove(query)
        ..insert(0, query);
    });

    return Future.value(const Right(null));
  }

  @override
  Future<Either<Failure, void>> clear() {
    history = history.rebuild((b) => b.clear());

    return Future.value(const Right(null));
  }

  @override
  Future<Either<Failure, BuiltList<String>>> getHistory() {
    return Future.value(Right(history));
  }

  @override
  Future<Either<Failure, void>> remove(String query) {
    history = history.rebuild((b) => b.remove(query));

    return Future.value(const Right(null));
  }
}