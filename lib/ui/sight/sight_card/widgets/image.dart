import 'package:flutter/material.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/ui/images/loading_progress_value.dart';
import 'package:places/ui/sight/image_overlay/image_overlay.dart';

class SightImage extends StatelessWidget {
  final Sight sight;
  final BoxFit fit;

  const SightImage({
    required this.sight,
    required this.fit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      child: ImageOverlay(
        image: Image.network(
          sight.imageUrl,
          fit: fit,
          colorBlendMode: BlendMode.multiply,
          loadingBuilder: (context, child, loadingProgress) {
            return loadingProgress == null
                ? child
                : Center(
                    child: CircularProgressIndicator(
                      value: LoadingProgressValue.fromImageChunkEvent(loadingProgress).value,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
