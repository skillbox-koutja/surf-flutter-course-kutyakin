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
  })  : _wished = wished,
        _visited = visited;

  void removeWished(FavoriteSight favoriteSight) {
    _wished = [..._wished]..remove(favoriteSight);

    notifyListeners();
  }

  void removeVisited(FavoriteSight favoriteSight) {
    _visited = [..._visited]..remove(favoriteSight);

    notifyListeners();
  }

  void reorderWished({
    required int index,
    required FavoriteSight favoriteSight,
  }) {
    _wished = _reorderSights(_wished, index, favoriteSight);

    notifyListeners();
  }

  void reorderVisited({
    required int index,
    required FavoriteSight favoriteSight,
  }) {
    _visited = _reorderSights(_visited, index, favoriteSight);

    notifyListeners();
  }

  List<FavoriteSight> _reorderSights(List<FavoriteSight> sights, int index, FavoriteSight favoriteSight) {
    return [...sights]
      ..remove(favoriteSight)
      ..insert(index, favoriteSight);
  }
}
