enum SightType {
  restaurant('ресторан'),
  park('парк'),
  temple('храм'),
  square('площадь'),
  other('другое');

  final String title;
  const SightType(this.title);

  @override
  String toString() => 'SightType($name)';
}
