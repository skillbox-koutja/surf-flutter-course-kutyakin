import 'package:places/domain/sight/sight_type.dart';

class CategoryFilterValue {
  final SightType type;
  bool selected;

  CategoryFilterValue({
    required this.type,
    this.selected = false,
  });

  CategoryFilterValue select() {
    return CategoryFilterValue(type: type, selected: true);
  }

  CategoryFilterValue unselect() {
    return CategoryFilterValue(type: type);
  }

  CategoryFilterValue toggle() {
    return selected ? unselect() : select();
  }
}
