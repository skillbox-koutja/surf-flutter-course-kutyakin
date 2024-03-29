import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/places/place/photo.dart';
import 'package:places/ui/app/state/places.dart';
import 'package:places/ui/components/icon_action.dart';
import 'package:places/ui/components/icons/svg_icons.dart';
import 'package:places/ui/place/photo/image_widget.dart';
import 'package:places/ui/sight/edit_sight/edit_sight_state.dart';
import 'package:places/ui/sight/edit_sight/widgets/form_fields/add_photo_dialog.dart';
import 'package:places/ui/sight/image_overlay/image_overlay.dart';
import 'package:provider/provider.dart';

class AddPhotoField extends StatelessWidget {
  static const _photoListViewPadding = 72 + 2 * 16;

  const AddPhotoField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final photos = context.select<EditSightState, BuiltList<PlacePhoto>>((s) => s.model.photos.value);

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
          width: MediaQuery.of(context).size.width - _photoListViewPadding,
          child: ListView.separated(
            separatorBuilder: (_, __) {
              return const SizedBox(width: 16);
            },
            padding: const EdgeInsets.only(right: 8),
            scrollDirection: Axis.horizontal,
            itemCount: photos.length,
            itemBuilder: (_, index) => _RemovableListItem(placePhoto: photos[index]),
          ),
        ),
      ],
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
      onTap: () async {
        final photo = await showDialog<PlacePhoto>(
          context: context,
          builder: (_) => const AddPhotoDialog(),
        );

        if (photo != null) {
          state.addPhoto(photo);
        }
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
  final PlacePhoto placePhoto;

  const _ListItem({required this.placePhoto, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Image(placePhoto: placePhoto);
  }
}

class _RemovableListItem extends StatelessWidget {
  final PlacePhoto placePhoto;

  const _RemovableListItem({required this.placePhoto, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<EditSightState>();

    return Dismissible(
      key: ObjectKey(placePhoto),
      direction: DismissDirection.up,
      onDismissed: (_) {
        state.removePhoto(placePhoto);
      },
      child: Stack(
        children: [
          Material(
            color: Colors.transparent,
            child: _ListItem(placePhoto: placePhoto),
          ),
          Positioned(
            top: 6,
            right: 6,
            child: IconActionWidget(
              onPressed: () {
                state.removePhoto(placePhoto);
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
  final PlacePhoto placePhoto;

  const _Image({
    required this.placePhoto,
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
          image: PlacePhotoImageWidget(
            borderRadius: BorderRadius.circular(12),
            photo: placePhoto,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
