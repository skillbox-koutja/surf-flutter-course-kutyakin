import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/search/history/repository/repository.dart';

class ClearSearchHistory implements UseCase<void, NoArgs> {
  final SearchHistoryRepository searchHistoryRepository;

  const ClearSearchHistory({
    required this.searchHistoryRepository,
  });

  @override
  Future<Either<Failure, void>> call(NoArgs params) {
    return searchHistoryRepository.clear();
  }
}
