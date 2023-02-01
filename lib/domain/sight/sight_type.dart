enum SightType {
  none('не выбрано'),
  hotel('отель'),
  restaurant('ресторан'),
  park('парк'),
  museum('музей'),
  cafe('кафе'),
  other('особое место');

  final String title;
  const SightType(this.title);

  @override
  String toString() => 'SightType($title)';

  bool isNone() => this == SightType.none;

  static List<SightType> availableForSelection() {
    return SightType.values.where((element) => !element.isNone()).toList();
  }
}
