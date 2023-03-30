import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/places/search/history/repository/repository.dart';

class SearchHistoryRepositoryImpl implements SearchHistoryRepository {
  final Box<List<String>> box;

  List<String> get _history => box.get(
        'model',
        defaultValue: [],
      )!;

  const SearchHistoryRepositoryImpl({
    required this.box,
  });

  @override
  Future<Either<Failure, void>> add(String query) {
    _history
      ..remove(query)
      ..insert(0, query);
    box.put('model', _history);

    return Future.value(const Right(null));
  }

  @override
  Future<Either<Failure, void>> clear() {
    box.clear();

    return Future.value(const Right(null));
  }

  @override
  Future<Either<Failure, BuiltList<String>>> getHistory() {
    return Future.value(Right(_history.toBuiltList()));
  }

  @override
  Future<Either<Failure, void>> remove(String query) {
    _history.remove(query);
    box.put('model', _history);

    return Future.value(const Right(null));
  }

  static Future<SearchHistoryRepositoryImpl> init() async {
    final box = await Hive.openBox<List<String>>('search_history');

    final history = box.get('model');
    if (history == null) {
      await box.put('model', []);
    }

    return SearchHistoryRepositoryImpl(box: box);
  }
}
