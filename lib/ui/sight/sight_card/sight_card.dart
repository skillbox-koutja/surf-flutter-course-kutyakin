import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/domain/sight/sight_status.dart';
import 'package:places/ui/images/loading_progress_value.dart';
import 'package:places/ui/sight/image_overlay/image_overlay.dart';

class SightCard extends StatelessWidget {
  final SightCardHeader header;
  final SightCardBody body;

  const SightCard({
    required this.header,
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: AppColors.background,
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            header,
            body,
          ],
        ),
      ),
    );
  }
}

class SightCardHeader extends StatelessWidget {
  final SightImage image;
  final SightTypeText typeText;
  final Widget actions;
  final int flex;

  const SightCardHeader({
    required this.image,
    required this.typeText,
    required this.actions,
    this.flex = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Stack(
        children: [
          image,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                typeText,
                actions,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SightCardBody extends StatelessWidget {
  final List<Widget> children;
  final int flex;

  const SightCardBody({
    required this.children,
    this.flex = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}

class SightActions extends StatelessWidget {
  final List<Widget> children;

  const SightActions({required this.children, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, right: 2),
      child: Wrap(
        spacing: 16, // set spacing here
        children: children,
      ),
    );
  }
}

class SightNameText extends StatelessWidget {
  final Sight sight;

  const SightNameText({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      sight.name,
      style: const AppTextStyle(
        color: AppColors.secondary,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}

class SightTypeText extends StatelessWidget {
  final Sight sight;

  const SightTypeText({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      sight.type.title,
      style: const AppSmallBoldStyle(
        color: AppColors.white,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}

class SightDetailsText extends StatelessWidget {
  final Sight sight;

  const SightDetailsText({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      sight.details,
      style: const AppSmallStyle(
        color: AppColors.secondary2,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}

class SightStatusText extends StatelessWidget {
  final SightStatus status;
  final Color color;

  const SightStatusText({required this.status, required this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      status.toString(),
      style: AppSmallStyle(
        color: color,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}

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
