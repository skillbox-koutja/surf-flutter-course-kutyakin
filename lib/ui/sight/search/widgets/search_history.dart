import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/ui/icons/svg_icons.dart';
import 'package:places/ui/sight/search/search_state.dart';
import 'package:provider/provider.dart';

const historyItemsLimit = 4;

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
    final history = context.select<SearchState, List<String>>((s) => s.history);

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
            items: history.take(historyItemsLimit).toList(),
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
    final clearHistory = context.select<SearchState, ClearHistory>((s) => s.clearHistory);
    final removeHistoryItem = context.select<SearchState, RemoveHistoryItem>((s) => s.removeHistoryItem);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: items.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
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
          onTap: clearHistory,
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
  final RemoveHistoryItem removeHistoryItem;
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
