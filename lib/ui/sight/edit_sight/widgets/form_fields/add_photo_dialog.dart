import 'dart:math';

import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight_photo.dart';
import 'package:places/ui/components/icon_action.dart';
import 'package:places/ui/components/icons/svg_icons.dart';
import 'package:places/ui/sight/edit_sight/edit_sight_state.dart';
import 'package:places/ui/sight/image_overlay/image_overlay.dart';
import 'package:provider/provider.dart';

class AddPhotoDialog extends StatelessWidget {
  const AddPhotoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsTheme = theme.extension<CustomColors>();

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
                  Divider(height: 26),
                  _File(),
                ],
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.scaffoldBackgroundColor,
                foregroundColor: colorsTheme?.green,
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const AppButtonStyle(),
                // minimumSize: Size.fromHeight(56),
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
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return _Item(
      icon: CameraSvgIcon(color: textTheme?.textDialog?.color),
      title: AppMessages.editingSight.addPhotoDialogCameraTitle,
    );
  }
}

class _Photo extends StatelessWidget {
  const _Photo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return _Item(
      icon: PhotoSvgIcon(color: textTheme?.textDialog?.color),
      title: AppMessages.editingSight.addPhotoDialogPhotoTitle,
    );
  }
}

class _File extends StatelessWidget {
  const _File({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return _Item(
      icon: FileSvgIcon(color: textTheme?.textDialog?.color),
      title: AppMessages.editingSight.addPhotoDialogFileTitle,
    );
  }
}

class _Item extends StatelessWidget {
  final Widget icon;
  final String title;

  const _Item({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        final rng = Random();
        final photo = SightPhoto(imageUrl: 'https://picsum.photos/300/400?_c=${rng.nextDouble()}');
        Navigator.of(context).pop<SightPhoto>(photo);
      },
      child: Row(
        children: [
          icon,
          const SizedBox(width: 14),
          Text(title, style: textTheme?.textDialog),
        ],
      ),
    );
  }
}
