import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/core/utils/extensions/build_context_ext.dart';
import 'package:places/domain/places/place/photo.dart';
import 'package:places/ui/app/state/places.dart';
import 'package:places/ui/components/icons/svg_icons.dart';
import 'package:provider/provider.dart';

final _failedUploadPlaceImageSnackBar = SnackBar(
  content: Text(AppMessages.editingSight.failedUploadPlaceImage),
);

class AddPhotoDialog extends StatelessWidget {
  const AddPhotoDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsTheme = context.themeColors;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 17),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: const [
                  _Camera(),
                  Divider(height: 26),
                  _Photo(),
                ],
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.scaffoldBackgroundColor,
                foregroundColor: colorsTheme.green,
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const AppButtonStyle(),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    AppMessages.editingSight.addPhotoDialogCancelButtonLabel,
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

class _Camera extends StatelessWidget {
  const _Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.themeTextStyles;
    final placesState = context.read<PlacesState>();

    return _Item(
      icon: CameraSvgIcon(color: textTheme.textDialog?.color),
      title: AppMessages.editingSight.addPhotoDialogCameraTitle,
      onTap: () async {
        final picker = ImagePicker();

        final image = await picker.pickImage(
          source: ImageSource.camera,
        );

        if (image == null) return;

        final data = await placesState.uploadPlaceImages([image]);
        data.fold(
          (failure) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context)
                .showSnackBar(_failedUploadPlaceImageSnackBar);
          },
          (photos) {
            Navigator.of(context).pop<PlacePhoto>(photos.first);
          },
        );
      },
    );
  }
}

class _Photo extends StatelessWidget {
  const _Photo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.themeTextStyles;
    final placesState = context.read<PlacesState>();

    return _Item(
      icon: PhotoSvgIcon(color: textTheme.textDialog?.color),
      title: AppMessages.editingSight.addPhotoDialogPhotoTitle,
      onTap: () async {
        final picker = ImagePicker();

        final image = await picker.pickImage(
          source: ImageSource.gallery,
        );

        if (image == null) return;

        final data = await placesState.uploadPlaceImages([image]);
        data.fold(
          (failure) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context)
                .showSnackBar(_failedUploadPlaceImageSnackBar);
          },
          (photos) {
            Navigator.of(context).pop<PlacePhoto>(photos.first);
          },
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  final Widget icon;
  final String title;
  final Future<void> Function() onTap;

  const _Item({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.themeTextStyles;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Row(
        children: [
          icon,
          const SizedBox(width: 14),
          Text(title, style: textTheme.textDialog),
        ],
      ),
    );
  }
}
