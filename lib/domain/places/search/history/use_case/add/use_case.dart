import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/search/history/repository/repository.dart';

class AddSearchHistory implements UseCase<void, String> {
  final SearchHistoryRepository _repository;

  const AddSearchHistory(this._repository);

  @override
  Future<Either<Failure, void>> call(String query) {
    return _repository.add(query);
  }
}
