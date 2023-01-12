class AppMessages {
  static const sightsList = _SightsListMessages();
  static const sightDetails = _SightDetailsMessages();
  static const sightStatus = _SightStatusMessages();
  static const favoriteSights = _FavoriteSightsMessages();
}

const _shortMonths = {
  1: 'янв.',
  2: 'фев.',
  3: 'мар.',
  4: 'апр.',
  5: 'май',
  6: 'июн.',
  7: 'июл.',
  8: 'авг.',
  9: 'сен.',
  10: 'окт.',
  11: 'ноя.',
  12: 'дек.',
};

class _AppDateFormat {
  final DateTime date;

  const _AppDateFormat(this.date);

  @override
  String toString() {
    return '${date.day.toString().padLeft(2, '0')} ${_shortMonths[date.month]} ${date.year.toString()}';
  }
}

class _SightsListMessages {
  String get pageTitle => 'Список\nинтересных мест';

  const _SightsListMessages();
}

class _FavoriteSightsMessages {
  String get pageTitle => 'Избранное';
  String get wishListTabTitle => 'Хочу посетить';
  String get visitedTabTitle => 'Посетил';
  String get emptyListTitle => 'Пусто';
  String get emptyWishListTip => 'Отмечайте понравившиеся места и они появятся здесь.';
  String get emptyVisitedListTip => 'Завершите маршрут, чтобы место попало сюда.';

  const _FavoriteSightsMessages();
}

class _SightDetailsMessages {
  String get makeRouteButtonTitle => 'ПОСТРОИТЬ МАРШРУТ';
  String get planButtonTitle => 'Запланировать';
  String get favoriteButtonTitle => 'В Избранное';

  const _SightDetailsMessages();
}

class _SightStatusMessages {
  const _SightStatusMessages();

  String certainPlanned(DateTime date) {
    return 'Запланировано на ${_AppDateFormat(date)}';
  }

  String certainDone(DateTime date) {
    return 'Цель достигнута ${_AppDateFormat(date)}';
  }
}
