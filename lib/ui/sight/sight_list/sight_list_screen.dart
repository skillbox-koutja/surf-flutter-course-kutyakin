import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/icons/menu/svg_icons.dart';
import 'package:places/ui/icons/svg_icons.dart';
import 'package:places/ui/sight/filters/filters_screen.dart';
import 'package:places/ui/sight/sight_card/sight_card.dart';
import 'package:places/ui/sight/sight_card/widgets/actions.dart';
import 'package:places/ui/sight/sight_card/widgets/body.dart';
import 'package:places/ui/sight/sight_card/widgets/details_text.dart';
import 'package:places/ui/sight/sight_card/widgets/header.dart';
import 'package:places/ui/sight/sight_card/widgets/image.dart';
import 'package:places/ui/sight/sight_card/widgets/name_text.dart';
import 'package:places/ui/sight/sight_card/widgets/type_text.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: sights
                  .map(
                    (sight) => Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: _SightCard(sight: sight),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _SightCard extends StatelessWidget {
  final Sight sight;

  const _SightCard({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SightCard(
      header: SightCardHeader(
        image: SightImage(sight: sight, fit: BoxFit.fitWidth),
        typeText: SightTypeText(sight: sight),
        actions: SightActions(
          children: [
            GestureDetector(
              onTap: () {
                print('HeartSvgIcon: ${sight.name}'); // ignore: avoid_print
              },
              child: const HeartSvgIcon(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
      body: SightCardBody(
        children: [
          SightNameText(sight: sight),
          const SizedBox(height: 2),
          SightDetailsText(sight: sight),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(72 + 64 + 16);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final colorsTheme = theme.extension<CustomColors>();

    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
              child: SizedBox(
                height: 72,
                child: Text(
                  AppMessages.sightsList.screenTitle,
                  style: textTheme?.largeTitle,
                  maxLines: 2,
                ),
              ),
            ),
          ),
        ),
        TextButton.icon(
          icon: FilterSvgIcon(color: colorsTheme?.green),
          label: const SizedBox(),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const SightFiltersScreen();
              },
            );
          },
        ),
      ],
    );
  }
}
