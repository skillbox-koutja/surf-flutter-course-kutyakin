import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/ui/sight/sight_details/widgets/gallery.dart';

class SightDetailsHeader extends StatelessWidget {
  final Sight sight;

  const SightDetailsHeader({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.placeholder,
      ),
      child: SightPhotosGallery(
        photos: sight.photos,
      ),
    );
  }
}
