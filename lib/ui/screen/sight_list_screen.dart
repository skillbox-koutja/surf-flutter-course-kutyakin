import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        toolbarHeight: 72 + 64,
        title: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
            child: SizedBox(
              height: 72,
              child: Text(
                'Список\nинтересных мест',
                style: TextStyle(
                  color: Color(0xFF3B3E5B),
                  fontSize: 32.0,
                  height: 1.12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
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
