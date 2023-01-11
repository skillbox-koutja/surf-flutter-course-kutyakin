class AppMessages {
  static const sightsList = _SightsListMessages();
  static const sightDetails = _SightDetailsMessages();
}

class _SightsListMessages {
  String get pageTitle => 'Список\nинтересных мест';

  const _SightsListMessages();
}

class _SightDetailsMessages {
  String get makeRouteButtonTitle => 'ПОСТРОИТЬ МАРШРУТ';
  String get planButtonTitle => 'Запланировать';
  String get favoriteButtonTitle => 'В Избранное';

  const _SightDetailsMessages();
}
