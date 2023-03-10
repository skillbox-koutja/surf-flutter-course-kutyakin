import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/search/history/repository/repository.dart';

class RemoveSearchHistory implements UseCase<void, String> {
  final SearchHistoryRepository searchHistoryRepository;

  const RemoveSearchHistory({
    required this.searchHistoryRepository,
  });

  @override
  Future<Either<Failure, void>> call(String query) {
    return searchHistoryRepository.remove(query);
  }
}
