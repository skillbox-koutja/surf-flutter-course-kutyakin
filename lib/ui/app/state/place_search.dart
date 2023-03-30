import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/use_case/search_places/use_case.dart';
import 'package:places/domain/places/search/filters/filters.dart';
import 'package:places/domain/places/search/history/use_case/add/use_case.dart';
import 'package:places/domain/places/search/history/use_case/clear/use_case.dart';
import 'package:places/domain/places/search/history/use_case/get_history/use_case.dart';
import 'package:places/domain/places/search/history/use_case/remove/use_case.dart';

class SearchResponse {
  final String query;
  final BuiltList<PlaceEntity> data;

  const SearchResponse({required this.query, required this.data});

  factory SearchResponse.create() {
    return SearchResponse(
      query: '',
      data: <PlaceEntity>[].toBuiltList(),
    );
  }

  factory SearchResponse.empty({required String query}) {
    return SearchResponse(
      query: query,
      data: <PlaceEntity>[].toBuiltList(),
    );
  }
}

enum PlaceSearchingStatus {
  none,
  waiting,
  searching,
  done,
  failure,
}

class PlaceSearchState extends ChangeNotifier {
  final AddSearchHistory addSearchHistory;
  final GetSearchHistory getSearchHistory;
  final ClearSearchHistory clearSearchHistory;
  final RemoveSearchHistory removeSearchHistory;
  final SearchPlaces searchPlaces;

  PlaceSearchingStatus status = PlaceSearchingStatus.none;
  SearchResponse response = SearchResponse.create();
  String query = '';
  bool error = false;
  bool loaded = false;
  BuiltList<String> history;

  PlaceSearchState({
    required this.addSearchHistory,
    required this.getSearchHistory,
    required this.clearSearchHistory,
    required this.removeSearchHistory,
    required this.searchPlaces,
    required this.history,
  });

  factory PlaceSearchState.create({
    required AddSearchHistory addSearchHistory,
    required GetSearchHistory getSearchHistory,
    required ClearSearchHistory clearSearchHistory,
    required RemoveSearchHistory removeSearchHistory,
    required SearchPlaces searchPlaces,
  }) {
    return PlaceSearchState(
      addSearchHistory: addSearchHistory,
      getSearchHistory: getSearchHistory,
      clearSearchHistory: clearSearchHistory,
      removeSearchHistory: removeSearchHistory,
      searchPlaces: searchPlaces,
      history: BuiltList(<String>[]),
    );
  }

  void editQuery(String query) {
    this.query = query;
    notifyListeners();
  }

  bool isSameQuery(String q) {
    return query == q;
  }

  void wait() {
    status = PlaceSearchingStatus.waiting;
    notifyListeners();
  }

  void search({
    required String query,
    required SearchFilters searchFilters,
  }) {
    addSearchHistory(query);
    response = SearchResponse.empty(
      query: query,
    );
    status = PlaceSearchingStatus.searching;

    searchPlaces(
      SearchPlaceFilters(
        nameFilter: query,
        geoFilter: searchFilters.geoFilter,
        categorySelector: searchFilters.categorySelector,
      ),
    ).then((searchedPlaces) {
      searchedPlaces.fold(
        (failure) {
          status = PlaceSearchingStatus.failure;
          response = SearchResponse.empty(
            query: query,
          );
          notifyListeners();
        },
        (places) {
          status = PlaceSearchingStatus.done;
          response = SearchResponse(
            query: query,
            data: places,
          );
          notifyListeners();
        },
      );
    });

    notifyListeners();
  }

  void clearHistory() {
    clearSearchHistory(NoArgs());

    notifyListeners();
  }

  void removeHistoryItem(String query) {
    removeSearchHistory(query);

    notifyListeners();
  }

  Future<void> load() async {
    final response = await getSearchHistory(NoArgs());

    response.fold(
      (failure) {
        error = true;
        loaded = true;
        history = BuiltList(<String>[]);
        notifyListeners();
      },
      (data) {
        error = false;
        loaded = true;
        history = data;
        notifyListeners();
      },
    );
  }
}
