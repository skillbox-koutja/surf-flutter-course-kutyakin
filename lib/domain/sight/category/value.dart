import 'package:places/domain/sight/sight_type.dart';

class CategoryFilterValue {
  final SightType type;
  final bool selected;

  CategoryFilterValue({
    required this.type,
    this.selected = false,
  });
}
