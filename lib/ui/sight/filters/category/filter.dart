import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/category/value.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/sight/filters/category/item.dart';
import 'package:places/ui/sight/filters/category/selected_item.dart';
import 'package:recase/recase.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({Key? key}) : super(key: key);

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
              return _CategoryFilterItem(category: category);
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _CategoryFilterItem extends StatelessWidget {
  final CategoryFilterValue category;

  const _CategoryFilterItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final type = category.type;

    final item = category.selected
        ? SelectedCategoryFilterItem(item: CategoryFilterItem(type: type))
        : CategoryFilterItem(type: type);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        item,
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
