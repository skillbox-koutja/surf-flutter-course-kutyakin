import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/core/utils/extensions/build_context_ext.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/ui/app/state/favorite_places.dart';
import 'package:places/ui/app/state/place_filters.dart';
import 'package:places/ui/app/state/places.dart';
import 'package:places/ui/app/state/user_preferences_state.dart';
import 'package:places/ui/components/add_new_place_floating_button.dart';
import 'package:places/ui/components/add_to_favorite_button.dart';
import 'package:places/ui/components/icons/svg_icons.dart';
import 'package:places/ui/map_screen/widgets/available_maps_widget.dart';
import 'package:places/ui/map_screen/widgets/map_action_button.dart';
import 'package:places/ui/map_screen/widgets/map_geolocation_button.dart';
import 'package:places/ui/map_screen/widgets/map_refresh_button.dart';
import 'package:places/ui/map_screen/widgets/map_widget.dart';
import 'package:places/ui/place/hero_image_widget.dart';
import 'package:places/ui/sight/search/sight_search_screen.dart';
import 'package:places/ui/sight/search/widgets/filter_icon.dart';
import 'package:places/ui/sight/search/widgets/search_bar.dart';
import 'package:places/ui/sight/sight_card/sight_card.dart';
import 'package:places/ui/sight/sight_card/widgets/actions.dart';
import 'package:places/ui/sight/sight_card/widgets/body.dart';
import 'package:places/ui/sight/sight_card/widgets/details_text.dart';
import 'package:places/ui/sight/sight_card/widgets/header.dart';
import 'package:places/ui/sight/sight_card/widgets/image.dart';
import 'package:places/ui/sight/sight_card/widgets/name_text.dart';
import 'package:places/ui/sight/sight_card/widgets/type_text.dart';
import 'package:provider/provider.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late YandexMapController _mapController;
  GlobalKey mapKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final placesState = context.read<PlacesState>();
    final textTheme = context.themeTextStyles;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            AppMessages.mapScreen.screenTitle,
            style: textTheme.subtitle,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 8.0),
            child: SearchBarWidget(
              suffixIcons: [
                SearchFilterIcon(
                  onClose: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<SightSearchScreen>(builder: (_) => const SightSearchScreen()),
                );
              },
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          MapWidget(
            mapKey: mapKey,
            onPlaceTap: placesState.selectPlace,
            initMap: (controller) {
              _mapController = controller;

              initMap();
            },
          ),
          Positioned(
            top: 16.0,
            right: 16.0,
            child: Column(
              children: [
                MapActionButton(
                  onTap: () {
                    _mapController.moveCamera(CameraUpdate.zoomIn());
                  },
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(height: 8),
                MapActionButton(
                  onTap: () {
                    _mapController.moveCamera(CameraUpdate.zoomOut());
                  },
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _FloatingActions(
        onGeolocationTap: () => unawaited(showLocationOnMap()),
        onRefreshTap: () => unawaited(refreshPlaces()),
      ),
    );
  }

  Future<void> initMap() async {
    await showLocationOnMap();
  }

  Future<void> showLocationOnMap() async {
    final userPreferencesState = context.read<UserPreferencesState>();
    final userPreferences = userPreferencesState.userPreferences;

    if (!userPreferences.allowedUseLocation) {
      return;
    }

    await _mapController.toggleUserLayer(
      visible: true,
      autoZoomEnabled: true,
    );

    final location = userPreferences.location;

    await _mapController.moveCamera(
      CameraUpdate.newCameraPosition(CameraPosition(
        target: Point(latitude: location.lat, longitude: location.lng),
      )),
    );
  }

  Future<void> refreshPlaces() async {
    final placeFiltersState = context.read<PlaceFiltersState>();

    context.read<PlacesState>().loadPlaces(placeFiltersState.filters);
  }
}

class _FloatingActions extends StatelessWidget {
  final VoidCallback onGeolocationTap;
  final VoidCallback onRefreshTap;

  const _FloatingActions({
    required this.onGeolocationTap,
    required this.onRefreshTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MapRefreshButton(
                onTap: onRefreshTap,
              ),
              const _AddNewPlaceAction(),
              MapGeolocationButton(
                onTap: onGeolocationTap,
              ),
            ],
          ),
        ),
        const _DismissiblePlace(),
      ],
    );
  }
}

class _AddNewPlaceAction extends StatelessWidget {
  const _AddNewPlaceAction({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedPlace = context.select<PlacesState, PlaceEntity?>((s) => s.selectedPlace);

    if (selectedPlace == null) {
      return const AddNewPlaceFloatingButton();
    }

    return const SizedBox();
  }
}

class _DismissiblePlace extends StatelessWidget {
  const _DismissiblePlace({super.key});

  @override
  Widget build(BuildContext context) {
    final placesState = context.read<PlacesState>();
    final selectedPlace = context.select<PlacesState, PlaceEntity?>((s) => s.selectedPlace);

    if (selectedPlace == null) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.all(16.0).copyWith(bottom: 0.0),
      child: Dismissible(
        key: ValueKey(selectedPlace.id),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 5,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.mapBoxShadow,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: _PlaceCard(
              placeEntity: selectedPlace,
            ),
          ),
        ),
        onDismissed: (_) {
          placesState.unselectPlace();
        },
      ),
    );
  }
}

class _PlaceCard extends StatelessWidget {
  final PlaceEntity placeEntity;

  const _PlaceCard({
    required this.placeEntity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final place = placeEntity.place;

    return SightCard(
      cardColor: context.themeColors.mapItemBackground,
      placeEntity: placeEntity,
      header: SightCardHeader(
        image: PlaceHeroImageWidget(
          placeEntity: placeEntity,
          child: SightImage(
            place: place,
            fit: BoxFit.fitWidth,
          ),
        ),
        typeText: SightTypeText(place: place),
        actions: SightActions(
          children: [
            AddToFavoriteButton(
              placeEntity: placeEntity,
            ),
          ],
        ),
      ),
      body: SightCardBody(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SightNameText(place: place),
                  const SizedBox(height: 2),
                  SightDetailsText(place: place),
                ],
              ),
            ),
            SizedBox.square(
              dimension: 48.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (_) {
                      return AvailableMapsWidget(
                        placeEntity: placeEntity,
                      );
                    },
                  );
                },
                child: const GoSvgIcon(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
