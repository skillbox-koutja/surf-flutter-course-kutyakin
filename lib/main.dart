import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/sight/sight_details/sight_details_page.dart';
import 'package:places/ui/sight/sight_list/sight_list_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places',
      home: PageView(
        children: [
          const SightListPage(),
          SightDetailsPage(sight: sights.last),
        ],
      ),
      // home:
    );
  }
}
