import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/search/history/use_case/clear/use_case.dart';
import 'package:places/domain/places/search/history/use_case/remove/use_case.dart';
import 'package:places/ui/app/state/place_search.dart';
import 'package:places/ui/components/icons/svg_icons.dart';
import 'package:provider/provider.dart';

const _historyItemsLimit = 4;

class SearchHistory extends StatelessWidget {
  final ValueChanged<String> onSelectItem;

  const SearchHistory({
    required this.onSelectItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final history = context.select<PlaceSearchState, BuiltList<String>>((s) => s.history);

    if (history.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          AppMessages.searchSights.historyTitle,
          style: textTheme?.superSmall?.copyWith(
            color: theme.disabledColor,
          ),
        ),
        const SizedBox(height: 4),
        Expanded(
          child: _HistoryList(
            items: history.take(_historyItemsLimit).toList(),
            onSelectItem: onSelectItem,
          ),
        ),
      ],
    );
  }
}

class _HistoryList extends StatelessWidget {
  final List<String> items;
  final ValueChanged<String> onSelectItem;

  const _HistoryList({
    required this.items,
    required this.onSelectItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final colorsTheme = theme.extension<CustomColors>();
    final clearHistory = context.select<PlaceSearchState, ClearSearchHistory>((s) => s.clearSearchHistory);
    final removeHistoryItem = context.select<PlaceSearchState, RemoveSearchHistory>((s) => s.removeSearchHistory);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: items.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (_, index) {
            final query = items[index];

            return _Row(
              query: query,
              onSelectItem: onSelectItem,
              removeHistoryItem: removeHistoryItem,
            );
          },
        ),
        const SizedBox(height: 28),
        GestureDetector(
          onTap: () => clearHistory(NoArgs()),
          child: Text(
            AppMessages.searchSights.clearHistoryTitle,
            style: textTheme?.text?.copyWith(
              color: colorsTheme?.green,
            ),
          ),
        ),
      ],
    );
  }
}

class _Row extends StatelessWidget {
  final String query;
  final RemoveSearchHistory removeHistoryItem;
  final ValueChanged<String> onSelectItem;

  const _Row({
    required this.query,
    required this.removeHistoryItem,
    required this.onSelectItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return GestureDetector(
      onTap: () {
        onSelectItem(query);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              query,
              style: textTheme?.textSecondary,
            ),
            GestureDetector(
              onTap: () {
                removeHistoryItem(query);
              },
              child: const _DeleteIcon(),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeleteIcon extends StatelessWidget {
  const _DeleteIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: DeleteSvgIcon(
        color: theme.disabledColor,
      ),
    );
  }
}
