import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/ui/images/loading_progress_value.dart';

class SightDetailsHeader extends StatelessWidget {
  final Sight sight;

  const SightDetailsHeader({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.placeholder,
      ),
      child: SizedBox.expand(
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                sight.imageUrl,
                fit: BoxFit.cover,
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
            Positioned(
              top: 36,
              left: 16,
              child: SizedBox(
                height: 32,
                width: 32,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
