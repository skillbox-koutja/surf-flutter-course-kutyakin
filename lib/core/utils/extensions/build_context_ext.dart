import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/images.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

extension BuildContextExt on BuildContext {
  CustomColors get themeColors => Theme.of(this).extension<CustomColors>()!;

  CustomTextStyles get themeTextStyles => Theme.of(this).extension<CustomTextStyles>()!;

  BitmapDescriptor get mapPlaceImage {
    if (Theme.of(this).brightness == Brightness.light) {
      return AppImages.lightMapPlaceImage;
    }

    return AppImages.darkMapPlaceImage;
  }

  PlacemarkIcon get userLocationImage {
    if (Theme.of(this).brightness == Brightness.light) {
      return PlacemarkIcon.composite([
        _placemarkIconItem('center', AppImages.lightMapUserLocationCenter),
        _placemarkIconItem('r1', AppImages.lightMapUserLocationR1),
        _placemarkIconItem('r2', AppImages.lightMapUserLocationR2),
      ]);
    }

    return PlacemarkIcon.composite([
      _placemarkIconItem('center', AppImages.darkMapUserLocationCenter),
      _placemarkIconItem('r1', AppImages.darkMapUserLocationR1),
      _placemarkIconItem('r2', AppImages.darkMapUserLocationR2),
    ]);
  }
}

PlacemarkCompositeIconItem _placemarkIconItem(
  String name,
  BitmapDescriptor image,
) {
  return PlacemarkCompositeIconItem(
    style: PlacemarkIconStyle(
      scale: 3,
      image: image,
    ),
    name: name,
  );
}
