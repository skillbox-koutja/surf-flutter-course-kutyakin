import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/editable_sight.dart';
import 'package:places/ui/icons/svg_icons.dart';
import 'package:places/ui/sight/editing_sight/category_select_screen.dart';
import 'package:recase/recase.dart';

class CategorySelectField extends StatelessWidget {
  final EditableSight sight;
  final ValueChanged<EditableSight> onChanged;

  const CategorySelectField({
    required this.sight,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final colorsTheme = theme.extension<CustomColors>();

    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            openCategorySelectScreen(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sight.type.title.sentenceCase,
                style: sight.type.isNone()
                    ? textTheme?.text?.copyWith(
                        color: theme.disabledColor,
                      )
                    : textTheme?.text,
              ),
              ChevronRightSvgIcon(
                color: colorsTheme?.icon,
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }

  void openCategorySelectScreen(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CategorySelectScreen(
          selected: sight.type,
          onClose: () {
            Navigator.of(context).pop();
          },
          onSave: (sightType) {
            onChanged(sight.copyWith(type: sightType));
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
