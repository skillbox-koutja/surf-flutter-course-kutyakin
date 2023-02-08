import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/ui/icons/svg_icons.dart';
import 'package:places/ui/images/loading_progress_value.dart';
import 'package:places/ui/sight/image_overlay/image_overlay.dart';
import 'package:places/ui/sight/sight_details/widgets/gallery.dart';

class SightDetailsHeader extends StatelessWidget {
  final Sight sight;

  const SightDetailsHeader({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsTheme = theme.extension<CustomColors>();

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.placeholder,
      ),
      child: SizedBox.expand(
        child: Stack(
          children: [
            SightPhotosGallery(
              photos: sight.photos,
            ),
            Positioned(
              top: 36 + MediaQuery.of(context).padding.top,
              left: 16,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SizedBox(
                  height: 32,
                  width: 32,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: colorsTheme?.iconBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ChevronLeftSvgIcon(
                      color: colorsTheme?.icon,
                    ),
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
