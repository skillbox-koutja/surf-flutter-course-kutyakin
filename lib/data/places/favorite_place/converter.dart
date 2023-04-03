import 'package:built_collection/built_collection.dart';
import 'package:places/data/database.dart';
import 'package:places/domain/geo/geo.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/model.dart';
import 'package:places/domain/places/place/photo.dart';
import 'package:places/domain/places/place/status.dart';
import 'package:places/domain/places/place/type.dart';

class FavoritePlacePersistenceModelConverter {
  const FavoritePlacePersistenceModelConverter();

  FavoritePlacePersistenceModel toPersistenceModel(FavoritePlace m) {
    final place = m.placeEntity.place;

    return FavoritePlacePersistenceModel(
      id: m.placeEntity.id,
      name: place.name,
      lat: place.geo.lat,
      lng: place.geo.lng,
      description: place.details,
      photos: place.photos,
      placeType: place.type,
      date: m.status.date,
      statusType: m.status.type,
      priority: m.priority,
    );
  }

  FavoritePlace toFavoritePlace(FavoritePlacePersistenceModel pm) {
    return FavoritePlace(
      placeEntity: PlaceEntity(
        id: pm.id,
        place: Place(
          name: pm.name,
          geo: Geo(lat: pm.lat, lng: pm.lng),
          details: pm.description,
          type: pm.placeType as PlaceType,
          photos: pm.photos as BuiltList<PlacePhoto>,
        ),
      ),
      status: PlaceStatus(
        type: pm.statusType as PlaceStatusType,
        date: pm.date,
      ),
      priority: pm.priority,
    );
  }
}
