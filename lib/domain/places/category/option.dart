import 'package:places/domain/places/place/type.dart';

class CategoryOption {
  final PlaceType type;
  bool selected;

  CategoryOption({
    required this.type,
    this.selected = false,
  });

  CategoryOption select() {
    return CategoryOption(type: type, selected: true);
  }

  CategoryOption unselect() {
    return CategoryOption(type: type);
  }

  CategoryOption toggle() {
    return selected ? unselect() : select();
  }
}
