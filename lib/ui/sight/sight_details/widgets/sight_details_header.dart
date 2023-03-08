import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/places/place/model.dart';
import 'package:places/ui/sight/sight_details/widgets/gallery.dart';

class SightDetailsHeader extends StatelessWidget {
  final Place place;

  const SightDetailsHeader({required this.place, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.placeholder,
      ),
      child: SightPhotosGallery(
        photos: place.photos,
      ),
    );
  }
}
