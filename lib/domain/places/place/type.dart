enum PlaceType {
  none('не выбрано'),
  hotel('отель'),
  restaurant('ресторан'),
  park('парк'),
  museum('музей'),
  cafe('кафе'),
  temple('храм'),
  monument('памятник'),
  theatre('театр'),
  other('особое место');

  final String title;
  const PlaceType(this.title);

  @override
  String toString() => 'SightType($title)';

  factory PlaceType.fromString(String str) {
    return values.firstWhere(
      (e) => e.toString() == 'SightType.$str',
      orElse: () => PlaceType.other,
    );
  }

  bool isNone() => this == PlaceType.none;

  static List<PlaceType> availableForSelection() {
    return PlaceType.values.where((element) => !element.isNone()).toList();
  }
}
