import 'package:flutter/material.dart';

class ImageOverlay extends StatelessWidget {
  final Image image;

  const ImageOverlay({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: image,
        ),
        Opacity(
          opacity: 0.4,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(0.0, -1.3125),
                end: const Alignment(0.0, 1.6354),
                colors: [
                  const Color(0xFF252849),
                  const Color(0xFF3B3E5B).withOpacity(0.08),
                ],
              ),
            ),
            child: const SizedBox.expand(),
          ),
        ),
      ],
    );
  }
}
