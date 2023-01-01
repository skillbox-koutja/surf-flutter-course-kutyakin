import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // final widget = MyFirstStatelessWidget();
    const widget = MyFirstStatefulWidget();

    if (kDebugMode) {
      print('[App] context.runtimeType: ${widget.getRuntimeType}');
    }

    return MaterialApp(
      title: 'App',
      home: widget,
    );
  }
}

class BuildCounter {
  int _value = 0;

  void increment() {
    _value += 1;
  }

  void log(String widgetName) {
    if (kDebugMode) {
      print('Счетчик[$widgetName]: $_value');
    }
  }
}

class MyFirstStatelessWidget extends StatelessWidget {
  final buildCounter = BuildCounter();

  Type get getRuntimeType => runtimeType;

  MyFirstStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    buildCounter
      ..increment()
      ..log('MyFirstStatelessWidget');

    if (kDebugMode) {
      print('context.runtimeType: ${context.runtimeType}');
    }

    return const Center(
      child: Text('Hello!'),
    );
  }
}

class MyFirstStatefulWidget extends StatefulWidget {
  Type get getRuntimeType => runtimeType;

  const MyFirstStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyFirstStatefulWidget> createState() => _MyFirstStatefulWidgetState();
}

class _MyFirstStatefulWidgetState extends State<MyFirstStatefulWidget> {
  final buildCounter = BuildCounter();

  @override
  Widget build(BuildContext context) {
    buildCounter
      ..increment()
      ..log('MyFirstStatefulWidget');

    if (kDebugMode) {
      print('context.runtimeType: ${context.runtimeType}');
    }

    return const Center(
      child: Text('Hello!'),
    );
  }
}
