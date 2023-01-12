import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/icons/svg_icons.dart';
import 'package:places/ui/sight/sight_card/sight_card.dart';

class SightListPage extends StatefulWidget {
  const SightListPage({Key? key}) : super(key: key);

  @override
  State<SightListPage> createState() => _SightListPageState();
}

class _SightListPageState extends State<SightListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
    );
  }
}

class _SightCard extends StatelessWidget {
  final Sight sight;

  const _SightCard({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 188, maxWidth: 328),
      child: SightCard(
        header: SightCardHeader(
          image: SightImage(sight: sight, fit: BoxFit.fitWidth),
          typeText: SightTypeText(sight: sight),
          actions: const SightActions(
            children: [
              HeartSvgIcon(
                color: AppColors.white,
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
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(72 + 64 + 16);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
          child: SizedBox(
            height: 72,
            child: Text(
              AppMessages.sightsList.pageTitle,
              style: const AppLargeTitleStyle(
                color: AppColors.whiteMain,
              ),
              maxLines: 2,
            ),
          ),
        ),
      ),
    );
  }
}
