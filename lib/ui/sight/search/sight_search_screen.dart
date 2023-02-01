import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/ui/app/bottom_navigation_bar.dart';
import 'package:places/ui/sight/filters/filters_state.dart';
import 'package:places/ui/sight/search/search_state.dart';
import 'package:places/ui/sight/search/widgets/clear_icon.dart';
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
  final searchState = SearchState();

  List<Sight> _filteredSights = [];
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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    _updateFilters(context);

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
        child: ChangeNotifierProvider(
          create: (_) => searchState,
          builder: (_, __) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SearchBar(
                  controller: textEditingController,
                  suffixIcons: [
                    if (textEditingController.text.isNotEmpty)
                      SearchClearIcon(
                        controller: textEditingController,
                      ),
                    if (textEditingController.text.isNotEmpty) const SizedBox(width: 8),
                    SearchFilterIcon(
                      onClose: () {
                        Navigator.of(context).pop();
                        _updateFilters(context);
                        _onSearchChanged();
                      },
                    ),
                    const SizedBox(width: 12),
                  ],
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

  void _updateFilters(BuildContext context) {
    final filteredSights = context.read<SightFiltersState>().filteredSights;
    _filteredSights = filteredSights;
  }

  void _onSearchChanged() {
    final query = textEditingController.text;

    if (query.length < queryMinLength) {
      return;
    }

    searchState.wait();

    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchState.search(query, _filteredSights);
    });
  }
}

class _Body extends StatelessWidget {
  final void Function(String text) onSelectHistoryItem;

  const _Body({
    required this.onSelectHistoryItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.select<SearchState, SearchingStatus>((s) => s.status);

    return Expanded(
      child: SearchingStatus.none == status
          ? SearchHistory(
              onSelectItem: onSelectHistoryItem,
            )
          : const SearchResult(),
    );
  }
}