import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyFirstStatefulWidget(),
      home: Column(
        children: [
          MyFirstStatelessWidget(),
          MyFirstStatefulWidget(),
        ],
      ),
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

  MyFirstStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    buildCounter
      ..increment()
      ..log('MyFirstStatelessWidget');

    return const Center(
      child: Text('Hello!'),
    );
  }
}

class MyFirstStatefulWidget extends StatefulWidget {
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

    return const Center(
      child: Text('Hello!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
