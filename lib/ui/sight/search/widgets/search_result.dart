import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:places/assets/highlight_text.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/ui/app/state/place_search.dart';
import 'package:places/ui/components/empty_state.dart';
import 'package:places/ui/components/icons/empty/svg_icons.dart';
import 'package:places/ui/place/photo/image.dart';
import 'package:places/ui/sight/sight_details/sight_details_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:recase/recase.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.select<PlaceSearchState, PlaceSearchingStatus>((s) => s.status);

    if (PlaceSearchingStatus.none == status) {
      return const SizedBox();
    }

    if (PlaceSearchingStatus.waiting == status || PlaceSearchingStatus.searching == status) {
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
    final result = context.select<PlaceSearchState, SearchResponse>((s) => s.response);

    if (result.data.isEmpty) {
      return const _EmptyState();
    }

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: result.data.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, index) {
        final placeEntity = result.data[index];

        return _Row(
          placeEntity: placeEntity,
          query: result.query,
        );
      },
    );
  }
}

class _Row extends StatelessWidget {
  final PlaceEntity placeEntity;
  final String query;

  const _Row({
    required this.placeEntity,
    required this.query,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final place = placeEntity.place;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (_) => SightDetailsBottomSheet(
            placeEntity: placeEntity,
          ),
        );
      },
      child: Row(
        children: [
          SizedBox.fromSize(
            size: const Size.square(56),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: (place.photos.isEmpty)
                  ? null
                  : Image(
                      image: PlacePhotoImage(place.photo).image,
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
                    name: place.name,
                    query: query,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  place.type.title.sentenceCase,
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
    final highlightRegex = RegExp(
      query,
      caseSensitive: false,
      unicode: true,
    );

    return Markdown(
      padding: EdgeInsets.zero,
      styleSheet: MarkdownStyleSheet(
        strong: textTheme?.text?.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
        p: textTheme?.text?.copyWith(overflow: TextOverflow.ellipsis),
      ),
      data: HighlightText(text: name, highlightRegex: highlightRegex).value,
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return EmptyState(
      icon: SearchSvgIcon(
        color: theme.disabledColor,
      ),
      title: AppMessages.searchSights.emptyListTitle,
      description: AppMessages.searchSights.emptyListDescription,
    );
  }
}
