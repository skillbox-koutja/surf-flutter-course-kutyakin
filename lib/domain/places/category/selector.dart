import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain/places/category/option.dart';
import 'package:places/domain/places/place/type.dart';

part 'selector.freezed.dart';

@freezed
class CategorySelector with _$CategorySelector {
  BuiltList<CategoryOption> get selected => _selected.toBuiltList();
  BuiltList<PlaceType> get selectedTypes => _selectedTypes.toBuiltList();
  BuiltList<String> get selectedTypeNames => _selectedTypeNames.toBuiltList();

  Iterable<CategoryOption> get _selected => list.where((element) => element.selected);
  Iterable<PlaceType> get _selectedTypes => _selected.map((element) => element.type);
  Iterable<String> get _selectedTypeNames => _selectedTypes.map((element) => element.name);

  factory CategorySelector({
    required BuiltList<CategoryOption> list,
  }) = _CategorySelector;

  const CategorySelector._();

  factory CategorySelector.fromAvailableForSelection() {
    final list = PlaceType.availableForSelection()
        .map(
          (type) => CategoryOption(type: type),
        )
        .toBuiltList();

    return CategorySelector(list: list);
  }

  CategorySelector toggle(CategoryOption category) {
    final index = list.indexOf(category);
    final updatedCategory = category.toggle();

    return copyWith(
      list: list.rebuild((b) => b.replaceRange(index, index + 1, [updatedCategory])),
    );
  }

  CategorySelector selectCategories(BuiltList<CategoryOption> categories) {
    return copyWith(
      list: list.rebuild(
        (b) => b.map((category) {
          if (categories.contains(category)) {
            return category.select();
          }

          return category;
        }),
      ),
    );
  }

  CategorySelector unselectCategories(BuiltList<CategoryOption> categories) {
    return copyWith(
      list: list.rebuild(
            (b) => b.map((category) {
          if (categories.contains(category)) {
            return category.unselect();
          }

          return category;
        }),
      ),
    );
  }
}
