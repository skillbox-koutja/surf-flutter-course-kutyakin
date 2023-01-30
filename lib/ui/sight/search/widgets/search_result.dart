import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/ui/icons/empty/svg_icons.dart';
import 'package:places/ui/sight/search/search_state.dart';
import 'package:places/ui/sight/sight_details/sight_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:recase/recase.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.select<SearchState, SearchingStatus>((s) => s.status);

    if (SearchingStatus.none == status) {
      return const SizedBox();
    }

    if (SearchingStatus.waiting == status || SearchingStatus.searching == status) {
      return Column(children: const [
        SizedBox(height: 35),
        CircularProgressIndicator(),
      ]);
    }

    return Column(
      children: const [
        SizedBox(height: 35),
        Expanded(
          child: _DoneResult(),
        ),
      ],
    );
  }
}

class _DoneResult extends StatelessWidget {
  const _DoneResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = context.select<SearchState, String>((s) => s.query);
    final result = context.select<SearchState, Result>((s) => s.result);

    if (result.isEmpty) {
      return const _EmptyState();
    }

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: result.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final sight = result[index];

        return _Row(
          sight: sight,
          query: query,
        );
      },
    );
  }
}

class _Row extends StatelessWidget {
  final Sight sight;
  final String query;

  const _Row({
    required this.sight,
    required this.query,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<SightDetailsScreen>(
            builder: (context) => SightDetailsScreen(
              sight: sight,
            ),
          ),
        );
      },
      child: Row(
        children: [
          SizedBox.fromSize(
            size: const Size.square(56),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image.network(
                sight.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                  child: _NameSight(
                    name: sight.name,
                    query: query,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  sight.type.title.sentenceCase,
                  style: textTheme?.smallSecondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NameSight extends StatelessWidget {
  final String name;
  final String query;
  const _NameSight({
    Key? key,
    required this.name,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return Markdown(
      padding: EdgeInsets.zero,
      styleSheet: MarkdownStyleSheet(
        strong: textTheme?.text?.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
        p: textTheme?.text?.copyWith(overflow: TextOverflow.ellipsis),
      ),
      data: name.replaceAll(query, '**$query**'),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SearchSvgIcon(
          color: theme.disabledColor,
        ),
        const SizedBox(height: 24),
        Text(
          AppMessages.searchSights.emptyListTitle,
          style: textTheme?.subtitle?.copyWith(
            color: theme.disabledColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppMessages.searchSights.emptyListDescription,
          style: textTheme?.small?.copyWith(
            color: theme.disabledColor,
          ),
        ),
      ],
    );
  }
}
