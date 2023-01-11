import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/sight/sight_list/widgets/sight_card.dart';

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
                    child: SizedBox(
                      height: 188,
                      width: double.infinity,
                      child: SightCard(sight: sight),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
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
                color: Color(0xFF3B3E5B),
              ),
              maxLines: 2,
            ),
          ),
        ),
      ),
    );
  }
}
