import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/ui/images/loading_progress_value.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  const SightCard({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 188, maxWidth: 328),
      child: Card(
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
              Flexible(
                flex: 3,
                child: _SightCardHeader(sight: sight),
              ),
              Flexible(
                flex: 2,
                child: _SightCardBody(sight: sight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SightCardHeader extends StatelessWidget {
  final Sight sight;

  const _SightCardHeader({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: _SightImage(imageUrl: sight.imageUrl),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sight.type.title,
                style: const AppSmallBoldStyle(
                  color: AppColors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 3, right: 2),
                child: ColoredBox(
                  color: AppColors.white,
                  child: SizedBox.square(
                    dimension: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SightCardBody extends StatelessWidget {
  final Sight sight;

  const _SightCardBody({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            sight.name,
            style: const AppTextStyle(
              color: AppColors.secondary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            sight.details,
            style: const AppSmallStyle(
              color: AppColors.secondary2,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _SightImage extends StatelessWidget {
  final String imageUrl;

  const _SightImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.fitWidth,
      loadingBuilder: (context, child, loadingProgress) {
        return loadingProgress == null
            ? ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: child,
              )
            : Center(
                child: CircularProgressIndicator(
                  value: LoadingProgressValue.fromImageChunkEvent(loadingProgress).value,
                ),
              );
      },
    );
  }
}
