class AppMessages {
  static const sightsList = _SightsListMessages();
  static const sightDetails = _SightDetailsMessages();
  static const sightStatus = _SightStatusMessages();
  static const favoriteSights = _FavoriteSightsMessages();
  static const sightFilters = _SightFilters();
  static const settings = _SettingsMessages();
  static const editingSight = _EditingSightMessages();
  static const searchSights = _SearchSightsMessages();
  static const placeholder = _PlaceholderMessages();
  static const onboarding = _OnboardingMessages();
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
  String get screenTitle => 'Список\nинтересных мест';
  String get newButtonLabel => 'НОВОЕ МЕСТО';
  String get successAddedSight => 'Новое место добавлено';

  const _SightsListMessages();
}

class _FavoriteSightsMessages {
  String get screenTitle => 'Избранное';
  String get wishListTabTitle => 'Хочу посетить';
  String get visitedTabTitle => 'Посетил';
  String get emptyListTitle => 'Пусто';
  String get emptyWishedListDescription => 'Отмечайте понравившиеся места и они появятся здесь.';
  String get emptyVisitedListDescription => 'Завершите маршрут, чтобы место попало сюда.';
  String get removeSightButtonLabel => 'Удалить';

  const _FavoriteSightsMessages();
}

class _SightDetailsMessages {
  String get makeRouteButtonLabel => 'ПОСТРОИТЬ МАРШРУТ';
  String get planButtonLabel => 'Запланировать';
  String get favoriteButtonLabel => 'В Избранное';

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

class _SettingsMessages {
  String get screenTitle => 'Настройки';
  String get darkModeSwitcherLabel => 'Темная тема';
  String get watchTutorialLabel => 'Смотреть туториал';

  const _SettingsMessages();
}

class _SightFilters {
  String get categoriesTitle => 'КАТЕГОРИИ';
  String get clearTitle => 'Очистить';
  String get distanceTitle => 'Расстояние';

  const _SightFilters();

  String showSightsCountText(int value) {
    return 'ПОКАЗАТЬ ($value)';
  }

  String distanceRangeSliderTitle({required double start, required double end}) {
    if (start < 1000 && end < 1000) {
      return 'от ${_MetersFormatter(start)} до ${end.toStringAsFixed(0)} м';
    }

    if (start < 1000 && end >= 1000) {
      return 'от ${_MetersFormatter(start)} м до ${_KilometersFormatter(end)} км';
    }

    return 'от ${_KilometersFormatter(start)} до ${_KilometersFormatter(end)} км';
  }

  String distanceSliderTitle(double distance) {
    if (distance < 1000) {
      return '${_MetersFormatter(distance)} м';
    }

    return '${_KilometersFormatter(distance)} км';
  }
}

class _MetersFormatter {
  final double meters;

  const _MetersFormatter(this.meters);

  @override
  String toString() {
    return meters.toStringAsFixed(0);
  }
}

class _KilometersFormatter {
  final double meters;

  const _KilometersFormatter(this.meters);

  @override
  String toString() {
    return (meters / 1000).toStringAsFixed(1);
  }
}

class _EditingSightMessages {
  String get newScreenTitle => 'Новое место';
  String get cancelTitle => 'Отмена';
  String get categorySelectScreenTitle => 'Категория';
  String get selectCategoryFieldLabel => 'КАТЕГОРИЯ';
  String get nameFieldLabel => 'НАЗВАНИЕ';
  String get longitudeFieldLabel => 'ДОЛГОТА';
  String get latitudeFieldLabel => 'ШИРОТА';
  String get detailsFieldLabel => 'ОПИСАНИЕ';
  String get createButtonLabel => 'СОЗДАТЬ';
  String get saveButtonLabel => 'СОХРАНИТЬ';
  String get pointOnMapTitle => 'Указать на карте';

  const _EditingSightMessages();
}

class _SearchSightsMessages {
  String get screenTitle => 'Список интересных мест';
  String get searchFieldLabel => 'Поиск';
  String get historyTitle => 'ВЫ ИСКАЛИ';
  String get clearHistoryTitle => 'Очистить историю';
  String get emptyListTitle => 'Ничего не найдено.';
  String get emptyListDescription => 'Попробуйте изменить параметры поиска';

  const _SearchSightsMessages();
}

class _TutorialFrame {
  final String title;
  final String description;

  _TutorialFrame({required this.title, required this.description});
}

class _OnboardingMessages {
  String get skipTitle => 'Пропустить';
  String get startButtonLabel => 'НА СТАРТ';
  String get tutorialFrames => 'НА СТАРТ';
  _TutorialFrame get tutorialFrame1 => _TutorialFrame(
        title: 'Добро пожаловать в Путеводитель',
        description: 'Ищи новые локации и сохраняй самые любимые.',
      );
  _TutorialFrame get tutorialFrame2 => _TutorialFrame(
        title: 'Построй маршрут и отправляйся в путь',
        description: 'Достигай цели максимально быстро и комфортно.',
      );
  _TutorialFrame get tutorialFrame3 => _TutorialFrame(
        title: 'Добавляй места, которые нашёл сам',
        description: 'Делись самыми интересными и помоги нам стать лучше!',
      );

  const _OnboardingMessages();
}

class _PlaceholderMessages {
  String get enterText => 'введите текст';
  String get enterValue => 'введите значение';

  const _PlaceholderMessages();
}
