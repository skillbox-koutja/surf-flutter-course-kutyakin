import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

const _mainTextStyle = TextStyle(
  color: Color(0xFF252849),
  fontSize: 32.0,
  height: 1.12,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
);

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        toolbarHeight: 72 + 64,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
          child: SizedBox(
            height: 72,
            child: RichText(
              text: TextSpan(
                style: _mainTextStyle,
                children: [
                  TextSpan(
                    children: [
                      TextSpan(text: 'C', style: _mainTextStyle.copyWith(color: const Color(0xFF4CAF50))),
                      const TextSpan(text: 'писок\n'),
                    ],
                  ),
                  TextSpan(
                    children: [
                      TextSpan(text: 'и', style: _mainTextStyle.copyWith(color: const Color(0xFFFCDD3D))),
                      const TextSpan(text: 'нтересных мест'),
                    ],
                  ),
                ],
              ),
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
