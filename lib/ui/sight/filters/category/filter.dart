import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/core/utils/extensions/build_context_ext.dart';
import 'package:places/domain/places/category/option.dart';
import 'package:places/domain/places/category/selector.dart';
import 'package:places/ui/app/state/place_filters.dart';
import 'package:places/ui/app/state/places.dart';
import 'package:places/ui/sight/filters/category/item.dart';
import 'package:places/ui/sight/filters/category/selectable_item.dart';
import 'package:provider/provider.dart';
import 'package:recase/recase.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = context.themeTextStyles;
    final categorySelector = context.select<PlaceFiltersState, CategorySelector>((s) => s.filters.categorySelector);
    final onChanged = context.select<PlaceFiltersState, ValueChanged<CategoryOption>>((s) => s.toggleCategory);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppMessages.sightFilters.categoriesTitle,
          style: textTheme.superSmall?.copyWith(
            color: theme.disabledColor,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 224,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisCount: 2,
            mainAxisSpacing: 40,
            crossAxisSpacing: 40,
            shrinkWrap: true, // You won't see infinite size error
            children: categorySelector.list.map((category) {
              return _CategoryFilterItem(
                category: category,
                onChanged: onChanged,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _CategoryFilterItem extends StatelessWidget {
  final ValueChanged<CategoryOption> onChanged;
  final CategoryOption category;

  const _CategoryFilterItem({
    required this.category,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final type = category.type;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SelectableCategoryFilterItem(
          selected: category.selected,
          item: CategoryFilterItem(
            category: category,
            onChanged: () {
              onChanged(category);
            },
          ),
        ),
        const SizedBox(height: 12),
        Text(
          type.title.sentenceCase,
          style: textTheme?.superSmall,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
