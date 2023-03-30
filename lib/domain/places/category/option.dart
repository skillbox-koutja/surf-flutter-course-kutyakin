import 'package:equatable/equatable.dart';
import 'package:places/domain/places/place/type.dart';

class CategoryOption extends Equatable {
  final PlaceType type;
  bool selected;

  @override
  List<Object?> get props => [
    type,
    selected,
  ];

  CategoryOption({
    required this.type,
    this.selected = false,
  });

  factory CategoryOption.selected({
    required PlaceType type,
  }) {
    return CategoryOption(type: type, selected: true);
  }

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
