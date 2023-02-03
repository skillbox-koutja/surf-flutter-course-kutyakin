import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:places/domain/sight/favorite_sight.dart';

typedef FavoriteSights = UnmodifiableListView<FavoriteSight>;

class FavoriteSightsState extends ChangeNotifier {
  FavoriteSights get visited => UnmodifiableListView(_visited);
  FavoriteSights get wished => UnmodifiableListView(_wished);

  List<FavoriteSight> _wished;
  List<FavoriteSight> _visited;

  FavoriteSightsState({
    required List<FavoriteSight> wished,
    required List<FavoriteSight> visited,
  }): _wished = wished, _visited = visited;

  void removeWished(FavoriteSight favoriteSight) {
    final newList = [..._wished]..remove(favoriteSight);
    _wished = newList;

    notifyListeners();
  }

  void removeVisited(FavoriteSight favoriteSight) {
    final newList = [..._visited]..remove(favoriteSight);
    _visited = newList;

    notifyListeners();
  }
}
