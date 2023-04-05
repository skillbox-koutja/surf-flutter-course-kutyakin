import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/search/history/repository/repository.dart';

class GetSearchHistory implements UseCase<BuiltList<String>, NoArgs> {
  final SearchHistoryRepository _repository;

  const GetSearchHistory(this._repository);

  @override
  Future<Either<Failure, BuiltList<String>>> call(NoArgs params) {
    return _repository.getHistory();
  }
}
