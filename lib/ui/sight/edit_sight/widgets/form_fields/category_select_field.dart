import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/places/place/type.dart';
import 'package:places/ui/components/icons/svg_icons.dart';
import 'package:places/ui/sight/edit_sight/category_select_screen.dart';
import 'package:places/ui/sight/edit_sight/edit_sight_state.dart';
import 'package:provider/provider.dart';
import 'package:recase/recase.dart';

class CategorySelectField extends StatelessWidget {
  const CategorySelectField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final colorsTheme = theme.extension<CustomColors>();
    final type = context.select<EditSightState, PlaceType>((s) => s.model.type.value);
    final onChanged = context.select<EditSightState, ValueChanged<PlaceType>>((s) => s.switchType);

    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            openCategorySelectScreen(
              context: context,
              type: type,
              onChanged: onChanged,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type.title.sentenceCase,
                style: type.isNone()
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

  void openCategorySelectScreen({
    required BuildContext context,
    required PlaceType type,
    required ValueChanged<PlaceType> onChanged,
  }) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CategorySelectScreen(
          selected: type,
          onClose: () {
            Navigator.of(context).pop();
          },
          onSave: (sightType) {
            onChanged(sightType);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
