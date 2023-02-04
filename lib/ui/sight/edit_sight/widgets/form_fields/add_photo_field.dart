import 'dart:math';

import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/sight/sight_photo.dart';
import 'package:places/ui/components/icon_action.dart';
import 'package:places/ui/icons/svg_icons.dart';
import 'package:places/ui/sight/edit_sight/edit_sight_state.dart';
import 'package:places/ui/sight/image_overlay/image_overlay.dart';
import 'package:provider/provider.dart';

class AddPhotoField extends StatelessWidget {
  const AddPhotoField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final photos = context.select<EditSightState, List<SightPhoto>>((s) => s.model.photos);
    final isLockedPhotoRemoving = context.select<EditSightState, bool>((s) => s.model.isLockedPhotoRemoving);
    final itemBuilder = isLockedPhotoRemoving ? normalItemBuilder : removableItemBuilder;

    return Row(
      children: [
        ColoredBox(
          color: theme.scaffoldBackgroundColor,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: _AddPhotoButton(),
          ),
        ),
        SizedBox(
          height: 72,
          width: MediaQuery.of(context).size.width - 72 - 2 * 16,
          child: ListView.separated(
            separatorBuilder: (_, __) {
              return const SizedBox(width: 16);
            },
            padding: const EdgeInsets.only(right: 8),
            scrollDirection: Axis.horizontal,
            itemCount: photos.length,
            itemBuilder: (_, index) => itemBuilder(photos[index]),
          ),
        ),
      ],
    );
  }

  Widget normalItemBuilder(SightPhoto sightPhoto) {
    return _ListItem(
      sightPhoto: sightPhoto,
    );
  }

  Widget removableItemBuilder(SightPhoto sightPhoto) {
    return _RemovableListItem(
      sightPhoto: sightPhoto,
    );
  }
}

class _AddPhotoButton extends StatelessWidget {
  const _AddPhotoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsTheme = theme.extension<CustomColors>();
    final state = context.read<EditSightState>();

    return GestureDetector(
      // behavior: HitTestBehavior.translucent,
      onTap: () {
        final rng = Random();
        state.addPhoto(SightPhoto(imageUrl: 'https://picsum.photos/300/400?_c=${rng.nextDouble()}'));
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorsTheme?.green?.withOpacity(0.48) ?? Colors.green),
        ),
        child: SizedBox.square(
          dimension: 72,
          child: Center(
            child: SizedBox.square(
              dimension: 50,
              child: PlusSvgIcon(
                color: colorsTheme?.green,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final SightPhoto sightPhoto;

  const _ListItem({required this.sightPhoto, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Image(sightPhoto: sightPhoto);
  }
}

class _RemovableListItem extends StatelessWidget {
  final SightPhoto sightPhoto;

  const _RemovableListItem({required this.sightPhoto, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<EditSightState>();

    return Dismissible(
      key: ObjectKey(sightPhoto),
      direction: DismissDirection.up,
      onDismissed: (_) {
        state.removePhoto(sightPhoto);
      },
      child: Stack(
        children: [
          Material(child: _ListItem(sightPhoto: sightPhoto)),
          Positioned(
            top: 6,
            right: 6,
            child: IconActionWidget(
              onPressed: () {
                state.removePhoto(sightPhoto);
              },
              icon: const ClearSvgIcon(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _Image extends StatelessWidget {
  final SightPhoto sightPhoto;

  const _Image({
    required this.sightPhoto,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 72,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.hardEdge,
        child: ImageOverlay(
          image: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  sightPhoto.imageUrl,
                ), // Background image
              ),
            ),
          ),
        ),
      ),
    );
  }
}
