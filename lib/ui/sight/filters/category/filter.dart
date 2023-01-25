import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/category/value.dart';
import 'package:places/ui/sight/filters/category/item.dart';
import 'package:places/ui/sight/filters/category/selectable_item.dart';
import 'package:recase/recase.dart';

class CategoryFilter extends StatelessWidget {
  final List<CategoryFilterValue> sightFilterCategories;
  final ValueChanged<CategoryFilterValue> onChanged;

  const CategoryFilter({
    required this.onChanged,
    required this.sightFilterCategories,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppMessages.sightFilters.categoriesTitle,
          style: textTheme?.superSmall?.copyWith(
            color: theme.disabledColor,
          ),
        ),
        const SizedBox(height: 24),
        Center(
          child: Wrap(
            spacing: 40,
            runSpacing: 40,
            children: sightFilterCategories.map((category) {
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
  final ValueChanged<CategoryFilterValue> onChanged;
  final CategoryFilterValue category;

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
