import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:places/core/utils/extensions/build_context_ext.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/ui/app/state/places.dart';
import 'package:places/ui/app/state/user_preferences_state.dart';
import 'package:places/ui/components/progress_indicator/circular.dart';
import 'package:provider/provider.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapWidget extends StatefulWidget {
  final ValueChanged<PlaceEntity> onPlaceTap;
  final MapCreatedCallback initMap;
  final GlobalKey mapKey;

  const MapWidget({
    super.key,
    required this.mapKey,
    required this.onPlaceTap,
    required this.initMap,
  });

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  static final selectedPlaceImage = BitmapDescriptor.fromAssetImage('assets/images/map/place/selected.png');
  final List<MapObject> mapObjects = [];

  @override
  Widget build(BuildContext context) {
    final selectedPlace = context.select<PlacesState, PlaceEntity?>((s) => s.selectedPlace);
    final placesData = context.select<PlacesState, PlacesData>((s) => s.places);

    if (placesData.loading) {
      return Stack(
        children: [
          _Map(
            mapKey: widget.mapKey,
            mapObjects: const <MapObject>[],
            onMapCreated: onMapCreated,
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
              ),
              child: Center(
                child: AppCircularProgressIndicator.defaultLoader(),
              ),
            ),
          ),
        ],
      );
    }

    return _Map(
      mapKey: widget.mapKey,
      mapObjects: placesData.data.fold(
        (l) => [],
        (places) => places.map(
          (placeEntity) {
            final geo = placeEntity.place.geo;

            return PlacemarkMapObject(
              mapId: MapObjectId(placeEntity.id.toString()),
              point: Point(latitude: geo.lat, longitude: geo.lng),
              onTap: (_, __) {
                widget.onPlaceTap(placeEntity);
              },
              opacity: 1,
              icon: PlacemarkIcon.single(
                PlacemarkIconStyle(
                  scale: 3,
                  image: placeEntity == selectedPlace ? selectedPlaceImage : context.mapPlaceImage,
                ),
              ),
            );
          },
        ).toList(),
      ),
      onMapCreated: onMapCreated,
    );
  }

  void onMapCreated(YandexMapController controller) {
    widget.initMap(controller);
  }
}

class _Map extends StatelessWidget {
  final GlobalKey mapKey;
  final MapCreatedCallback onMapCreated;
  final List<MapObject> mapObjects;

  const _Map({
    super.key,
    required this.mapKey,
    required this.mapObjects,
    required this.onMapCreated,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('mapObjects: ${mapObjects.length}');
    final isDark = context.select<UserPreferencesState, bool>((settings) => settings.isDark);

    return YandexMap(
      key: mapKey,
      mapObjects: mapObjects,
      onMapCreated: onMapCreated,
      nightModeEnabled: isDark,
      onUserLocationAdded: (view) async {
        return view.copyWith(
          pin: view.pin.copyWith(
            opacity: 1,
            icon: context.userLocationImage,
          ),
          accuracyCircle: view.accuracyCircle.copyWith(
            strokeColor: Colors.transparent,
            fillColor: Colors.transparent,
          ),
        );
      },
    );
  }
}
