import 'package:flutter/material.dart';

class TouchDetector extends StatefulWidget {
  final void Function(FocusNode focusNode) onFocusChange;
  final Widget Function({
    required FocusNode focusNode,
    required void Function() onFocusChange,
  }) builder;

  const TouchDetector({
    required this.onFocusChange,
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  State<TouchDetector> createState() => _TouchDetectorState();
}

class _TouchDetectorState extends State<TouchDetector> {
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    focusNode
      ..removeListener(onFocusChange)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      focusNode: focusNode,
      onFocusChange: onFocusChange,
    );
  }

  void onFocusChange() {
    widget.onFocusChange(focusNode);
  }
}
