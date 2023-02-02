import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/domain/sight/sight.dart';

typedef SearchResponse = List<Sight>;
typedef Search = void Function(String query, List<Sight> sights);
typedef ClearHistory = void Function();
typedef RemoveHistoryItem = void Function(String item);

enum SearchingStatus {
  none,
  waiting,
  searching,
  done,
}

final List<String> _historyArchive = [];

class SearchState extends ChangeNotifier {
  SearchingStatus status = SearchingStatus.none;
  SearchResponse response = [];
  Timer? request;
  String query = '';
  List<String> history;

  SearchState() : history = [..._historyArchive];

  @override
  void dispose() {
    request?.cancel();
    super.dispose();
  }

  void editQuery(String query) {
    this.query = query;
    notifyListeners();
  }

  bool isSameQuery(String q) {
    return query == q;
  }

  void wait() {
    status = SearchingStatus.waiting;
    abortRequest();
    notifyListeners();
  }

  void abortRequest() {
    request?.cancel();
  }

  void search(String q, List<Sight> sights) {
    query = q;
    status = SearchingStatus.searching;

    abortRequest();

    request = Timer(const Duration(seconds: 1), () {
      final q = RegExp(
        query,
        caseSensitive: false,
        unicode: true,
      );
      response = sights.where((element) => element.name.contains(q)).toList();
      status = SearchingStatus.done;

      _historyArchive
        ..removeWhere((element) => element == query)
        ..insert(0, query);
      history = [..._historyArchive];

      request = null;

      notifyListeners();
    });

    notifyListeners();
  }

  void clearHistory() {
    _historyArchive.clear();
    history = [..._historyArchive];

    notifyListeners();
  }

  void removeHistoryItem(String item) {
    _historyArchive.remove(item);
    history = [..._historyArchive];

    notifyListeners();
  }
}
