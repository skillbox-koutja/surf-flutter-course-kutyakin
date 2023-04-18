import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/ui/app/state/favorite_places.dart';
import 'package:places/ui/app/state/user_preferences_state.dart';
import 'package:provider/provider.dart';

class AvailableMapsWidget extends StatelessWidget {
  final PlaceEntity placeEntity;

  const AvailableMapsWidget({
    super.key,
    required this.placeEntity,
  });

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    final theme = Theme.of(context);
    final wishedState = context.read<WishedPlacesState>();
    final visitedState = context.read<VisitedPlacesState>();
    final availableMaps = context.select<UserPreferencesState, List<AvailableMap>>((s) => s.availableMaps);
    final place = placeEntity.place;

    Future<void> addToVisited() async {
      final wishedPlace = await wishedState.addPlace(placeEntity);

      wishedPlace.fold(
        (l) => debugPrint('Не удалось добавить'),
        (favoritePlace) {
          wishedState.removeFromState(favoritePlace);
          visitedState.add(
            favoritePlace: favoritePlace,
            date: DateTime.now(),
          );
        },
      );
    }

    return SafeArea(
      child: ColoredBox(
        color: theme.scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              for (final map in availableMaps)
                ListTile(
                  onTap: () async {
                    final destination = Coords(place.geo.lat, place.geo.lng);

                    unawaited(map.showMarker(
                      coords: destination,
                      title: place.name,
                    ));
                    unawaited(map.showDirections(
                      destination: destination,
                    ));

                    await addToVisited();

                    navigator.pop();
                  },
                  title: Text(map.mapName),
                  leading: SvgPicture.asset(
                    map.icon,
                    height: 30.0,
                    width: 30.0,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
