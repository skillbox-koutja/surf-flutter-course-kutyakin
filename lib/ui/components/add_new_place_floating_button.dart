import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/core/utils/extensions/build_context_ext.dart';
import 'package:places/ui/app/state/place_filters.dart';
import 'package:places/ui/app/state/places.dart';
import 'package:places/ui/components/icons/svg_icons.dart';
import 'package:places/ui/components/main_gradient_overlay.dart';
import 'package:places/ui/sight/edit_sight/add_place_screen.dart';
import 'package:provider/provider.dart';

class AddNewPlaceFloatingButton extends StatelessWidget {
  const AddNewPlaceFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
      ),
      icon: const _FloatingButtonText(),
      label: const SizedBox(),
      onPressed: () => openAddSightScreen(context),
    );
  }

  void openAddSightScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<AddPlaceScreen>(
        builder: (context) {
          final filtersState = context.read<PlaceFiltersState>();
          final placesState = context.read<PlacesState>();

          return AddPlaceScreen(
            onSave: (editablePlace) {
              placesState.createPlaceEntity(editablePlace);
              filtersState.clear();
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(_successAddedPlaceSnackBar);
            },
            onClose: () {
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }
}

final _successAddedPlaceSnackBar = SnackBar(
  content: Text(AppMessages.sightsList.successAddedPlace),
);

class _FloatingButtonText extends StatelessWidget {
  const _FloatingButtonText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 9),
        child: MainGradientOverlay(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          boxShadow: const [
            BoxShadow(
              color: AppColors.mapBoxShadow,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(56.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
              child: Row(
                children: [
                  PlusSvgIcon(
                    color: theme.floatingActionButtonTheme.foregroundColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppMessages.sightsList.newButtonLabel,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
