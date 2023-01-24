import 'package:places/domain/sight/sight_type.dart';

class CategoryFilterValue {
  final SightType type;
  bool selected;

  CategoryFilterValue({
    required this.type,
    this.selected = false,
  });

  void select() {
    selected = true;
  }

  void unselect() {
    selected = false;
  }

  void toggle() {
    if (selected) {
      unselect();
    } else {
      select();
    }
  }
}
