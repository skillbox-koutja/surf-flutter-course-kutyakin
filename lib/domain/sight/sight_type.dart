enum SightType {
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
}
