import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/ui/app/bottom_navigation_bar.dart';
import 'package:places/ui/app/state/place_filters.dart';
import 'package:places/ui/app/state/place_search.dart';
import 'package:places/ui/components/field_icons/clear_icon.dart';
import 'package:places/ui/sight/search/widgets/filter_icon.dart';
import 'package:places/ui/sight/search/widgets/search_bar.dart';
import 'package:places/ui/sight/search/widgets/search_history.dart';
import 'package:places/ui/sight/search/widgets/search_result.dart';
import 'package:provider/provider.dart';

class SightSearchScreen extends StatefulWidget {
  const SightSearchScreen({Key? key}) : super(key: key);

  @override
  State<SightSearchScreen> createState() => _SightSearchScreenState();
}

const queryMinLength = 3;

class _SightSearchScreenState extends State<SightSearchScreen> {
  final TextEditingController textEditingController = TextEditingController();

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    textEditingController
      ..removeListener(_onSearchChanged)
      ..dispose();

    _debounce?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        centerTitle: true,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            AppMessages.searchSights.screenTitle,
            style: textTheme?.subtitle,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Consumer<PlaceSearchState>(
          builder: (_, __, ___) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _SearchBar(
                  controller: textEditingController,
                  onClose: () {
                    Navigator.of(context).pop();
                    _onSearchChanged();
                  },
                ),
                _Body(
                  onSelectHistoryItem: (item) {
                    textEditingController.value = TextEditingValue(text: item);
                  },
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _onSearchChanged() {
    final query = textEditingController.text.trim();
    if (query.isEmpty) {
      return;
    }

    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      final searchState = context.read<PlaceSearchState>();
      final filtersState = context.read<PlaceFiltersState>();
      if (searchState.isSameQuery(query)) {
        return;
      }

      searchState.editQuery(query);

      if (query.length < queryMinLength) {
        return;
      }

      searchState
        ..wait()
        ..search(
          query: query,
          searchFilters: filtersState.filters,
        );
    });
  }
}

class _Body extends StatelessWidget {
  final ValueChanged<String> onSelectHistoryItem;

  const _Body({
    required this.onSelectHistoryItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.select<PlaceSearchState, PlaceSearchingStatus>((s) => s.status);

    return Expanded(
      child: PlaceSearchingStatus.none == status
          ? SearchHistory(
              onSelectItem: onSelectHistoryItem,
            )
          : const SearchResult(),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onClose;

  const _SearchBar({
    required this.controller,
    required this.onClose,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = context.select<PlaceSearchState, String>((s) => s.query);

    return SearchBar(
      controller: controller,
      suffixIcons: [
        if (query.isNotEmpty)
          FieldClearIcon(
            controller: controller,
          ),
        if (query.isEmpty)
          SearchFilterIcon(
            onClose: onClose,
          ),
        // const SizedBox(width: 12),
      ],
    );
  }
}
