import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/ui/components/empty_state.dart';
import 'package:places/ui/components/icons/svg_icons.dart';

class PlacesEmptyState extends StatelessWidget {
  const PlacesEmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return EmptyState(
      icon: SearchSvgIcon(
        color: theme.disabledColor,
      ),
      title: AppMessages.searchSights.emptyListTitle,
      description: AppMessages.searchSights.emptyListDescription,
    );
  }
}