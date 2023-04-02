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
  Future<Either<Failure, void>> add(String query) async {
    _history
      ..remove(query)
      ..insert(0, query);

    await box.put('model', _history);
    await box.flush();

    return Future.value(const Right(null));
  }

  @override
  Future<Either<Failure, void>> clear() async {
    await box.clear();
    await box.flush();

    return Future.value(const Right(null));
  }

  @override
  Future<Either<Failure, BuiltList<String>>> getHistory() {
    return Future.value(Right(_history.toBuiltList()));
  }

  @override
  Future<Either<Failure, void>> remove(String query) async {
    _history.remove(query);

    await box.put('model', _history);
    await box.flush();

    return Future.value(const Right(null));
  }

  static Future<SearchHistoryRepositoryImpl> init() async {
    final box = await Hive.openBox<List<String>>('search_history');

    final history = box.get('model');
    if (history == null) {
      await box.put('model', []);
      await box.flush();
    }

    return SearchHistoryRepositoryImpl(box: box);
  }
}
