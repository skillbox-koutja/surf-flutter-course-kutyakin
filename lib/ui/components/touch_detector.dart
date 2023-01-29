import 'package:flutter/material.dart';

class TouchDetector extends StatefulWidget {
  final FocusNode focusNode;
  final void Function(FocusNode focusNode) onFocusChange;
  final Widget Function({
    required FocusNode focusNode,
    required void Function() onFocusChange,
  }) builder;

  const TouchDetector({
    required this.focusNode,
    required this.onFocusChange,
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  State<TouchDetector> createState() => _TouchDetectorState();
}

class _TouchDetectorState extends State<TouchDetector> {
  @override
  void initState() {
    super.initState();

    widget.focusNode.addListener(onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();

    widget.focusNode.removeListener(onFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      focusNode: widget.focusNode,
      onFocusChange: onFocusChange,
    );
  }

  void onFocusChange() {
    widget.onFocusChange(widget.focusNode);
  }
}
