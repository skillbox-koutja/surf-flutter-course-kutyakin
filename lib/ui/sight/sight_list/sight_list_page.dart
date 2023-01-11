import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/sight/sight_list/widgets/sight_card.dart';
import 'package:places/ui/theme/typography.dart';

class SightListPage extends StatefulWidget {
  const SightListPage({Key? key}) : super(key: key);

  @override
  State<SightListPage> createState() => _SightListPageState();
}

class _SightListPageState extends State<SightListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        toolbarHeight: 72 + 64,
        title: const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 64, 16, 16),
            child: SizedBox(
              height: 72,
              child: Text(
                'Список\nинтересных мест',
                style: AppLargeTitleStyle(
                  color: Color(0xFF3B3E5B),
                ),
                maxLines: 2,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              for (var sight in sights)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: SizedBox(
                    height: 188,
                    width: double.infinity,
                    child: SightCard(sight: sight),
                  ),
                ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
