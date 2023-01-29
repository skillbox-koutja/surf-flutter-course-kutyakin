import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/favorite_sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/sight/favorite_sights/favorite_sight_card.dart';
import 'package:places/ui/sight/favorite_sights/favorite_sight_list.dart';


class SightSearchScreen extends StatefulWidget {
  const SightSearchScreen({Key? key}) : super(key: key);

  @override
  State<SightSearchScreen> createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          centerTitle: true,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              AppMessages.searchSights.screenTitle,
              style: textTheme?.subtitle,
            ),
          ),
        ),
        body: const Placeholder(),
      ),
    );
  }
}
