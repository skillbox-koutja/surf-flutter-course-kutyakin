import 'package:flutter/material.dart';

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
        title: const Padding(
          padding: EdgeInsets.fromLTRB(16, 64, 16, 0),
          child: SizedBox(
            height: 72,
            child: Text(
              'Список\nинтересных мест',
              style: TextStyle(
                color: Color(0xFF252849),
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
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Type something',
            ),
            autofocus: true,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
