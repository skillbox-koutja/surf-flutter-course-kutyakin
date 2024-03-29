import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/places/place/photo.dart';
import 'package:places/ui/components/images/loading_progress_value.dart';
import 'package:places/ui/place/photo/image.dart';
import 'package:places/ui/place/photo/image_widget.dart';
import 'package:places/ui/sight/image_overlay/image_overlay.dart';

class SightPhotosGallery extends StatefulWidget {
  final BuiltList<PlacePhoto> photos;

  const SightPhotosGallery({
    required this.photos,
    Key? key,
  }) : super(key: key);

  @override
  SightPhotosGalleryState createState() => SightPhotosGalleryState();
}

class SightPhotosGalleryState extends State<SightPhotosGallery> {
  late final PageController controller;

  int get pageCount => widget.photos.length;
  int get page => controller.hasClients ? controller.page?.round() ?? 0 : 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(viewportFraction: widget.photos.length > 1 ? 0.9 : 1);
    controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          padEnds: false,
          controller: controller,
          itemCount: widget.photos.length,
          itemBuilder: (context, index) => ImageOverlay(
            image: PlacePhotoImageWidget(
              photo: widget.photos[index],
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (pageCount > 1)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 8,
            child: _PageSlider(
              page: page,
              pageCount: pageCount,
            ),
          ),
      ],
    );
  }
}

class _PageSlider extends StatelessWidget {
  final int page;
  final int pageCount;
  const _PageSlider({
    required this.pageCount,
    required this.page,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < pageCount; i++)
          (i == page)
              ? _PageSliderIndicator(
                  isVisibleLeftBorder: page > 0,
                  isVisibleRightBorder: page < pageCount - 1,
                )
              : const Spacer(),
      ],
    );
  }
}

class _PageSliderIndicator extends StatelessWidget {
  static const double indicatorHeight = 8;
  static const indicatorRadius = Radius.circular(indicatorHeight / 2);
  final bool isVisibleLeftBorder;
  final bool isVisibleRightBorder;
  const _PageSliderIndicator({
    required this.isVisibleLeftBorder,
    required this.isVisibleRightBorder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsTheme = theme.extension<CustomColors>();

    return Expanded(
      child: SizedBox(
        height: indicatorHeight,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colorsTheme?.icon,
            borderRadius: BorderRadius.horizontal(
              left: isVisibleLeftBorder ? indicatorRadius : Radius.zero,
              right: isVisibleRightBorder ? indicatorRadius : Radius.zero,
            ),
          ),
        ),
      ),
    );
  }
}
