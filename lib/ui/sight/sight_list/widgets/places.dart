import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/use_case/edit/use_case.dart';
import 'package:places/ui/app/state/favorite_places.dart';
import 'package:places/ui/app/state/place_filters.dart';
import 'package:places/ui/app/state/places.dart';
import 'package:places/ui/components/error_state.dart';
import 'package:places/ui/components/icon_action.dart';
import 'package:places/ui/components/icons/menu/svg_icons.dart';
import 'package:places/ui/place/empty_state/widget.dart';
import 'package:places/ui/sight/edit_sight/edit_place_screen.dart';
import 'package:places/ui/sight/sight_card/sight_card.dart';
import 'package:places/ui/sight/sight_card/widgets/actions.dart';
import 'package:places/ui/sight/sight_card/widgets/body.dart';
import 'package:places/ui/sight/sight_card/widgets/details_text.dart';
import 'package:places/ui/sight/sight_card/widgets/header.dart';
import 'package:places/ui/sight/sight_card/widgets/image.dart';
import 'package:places/ui/sight/sight_card/widgets/name_text.dart';
import 'package:places/ui/sight/sight_card/widgets/type_text.dart';
import 'package:provider/provider.dart';

class PlacesContainerWidget extends StatelessWidget {
  final VoidCallback? onEditDone;

  const PlacesContainerWidget({
    this.onEditDone,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filtersState = context.read<PlaceFiltersState>();
    final placesState = context.read<PlacesState>();

    final filters = filtersState.filters;
    final placesData = placesState.places;
    final loadPlaces = placesState.loadPlaces;

    void openEditPlaceScreen(PlaceEntity placeEntity) {
      Navigator.push(
        context,
        MaterialPageRoute<EditPlaceScreen>(
          builder: (context) {
            return EditPlaceScreen(
              placeEntity: placeEntity,
              onSave: (editablePlace) {
                placesState.editPlaceEntity(EditPlaceArgs(
                  id: placeEntity.id,
                  place: editablePlace,
                ));
                filtersState.clear();

                onEditDone?.call();
              },
              onClose: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
      );
    }

    return PlacesWidget(
      openEditPlaceScreen: openEditPlaceScreen,
      onInit: () {
        final skipLoad = placesData.loaded || placesData.loading;
        if (!skipLoad) {
          loadPlaces(filters);
        }
      },
    );
  }
}

class PlacesWidget extends StatefulWidget {
  final VoidCallback onInit;
  final void Function(PlaceEntity placeEntity) openEditPlaceScreen;

  const PlacesWidget({
    required this.onInit,
    required this.openEditPlaceScreen,
    Key? key,
  }) : super(key: key);

  @override
  State<PlacesWidget> createState() => _PlacesWidgetState();
}

class _PlacesWidgetState extends State<PlacesWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    final placesData = context.select<PlacesState, PlacesData>((s) => s.places);

    if (placesData.loading) {
      return const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return placesData.data.fold(
          (failure) {
        return const SliverToBoxAdapter(child: ErrorState());
      },
          (placeEntities) {
        if (placeEntities.isEmpty) {
          return const SliverToBoxAdapter(child: PlacesEmptyState());
        }

        return _PlacesWidget(
          placeEntities: placeEntities,
          openEditPlaceScreen: widget.openEditPlaceScreen,
        );
      },
    );
  }
}

class _PlacesWidget extends StatelessWidget {
  final PlaceEntities placeEntities;
  final void Function(PlaceEntity placeEntity) openEditPlaceScreen;

  const _PlacesWidget({
    required this.placeEntities,
    required this.openEditPlaceScreen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MediaQuery.of(context).orientation == Orientation.portrait
        ? _PlacesListWidget(
      placeEntities: placeEntities,
      openEditPlaceScreen: openEditPlaceScreen,
    )
        : _PlacesGridWidget(
      placeEntities: placeEntities,
      openEditPlaceScreen: openEditPlaceScreen,
    );
  }
}

class _PlacesListWidget extends StatelessWidget {
  final PlaceEntities placeEntities;
  final void Function(PlaceEntity placeEntity) openEditPlaceScreen;

  const _PlacesListWidget({
    required this.placeEntities,
    required this.openEditPlaceScreen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: placeEntities.length * 2 - 1,
          semanticIndexCallback: (_, index) {
            return index.isEven ? index ~/ 2 : null;
          },
              (context, index) {
            final itemIndex = index ~/ 2;
            if (index.isEven) {
              return _PlaceCard(
                placeEntity: placeEntities[itemIndex],
                openEditPlaceScreen: openEditPlaceScreen,
              );
            }

            const separator = SizedBox(height: 16);

            return separator;
          },
        ),
      ),
    );
  }
}

class _PlacesGridWidget extends StatelessWidget {
  final PlaceEntities placeEntities;
  final void Function(PlaceEntity placeEntity) openEditPlaceScreen;

  const _PlacesGridWidget({
    required this.placeEntities,
    required this.openEditPlaceScreen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).padding.right),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 36.0,
          crossAxisSpacing: 36.0,
          childAspectRatio: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: placeEntities.length,
              (context, index) {
            return _PlaceCard(
              placeEntity: placeEntities[index],
              openEditPlaceScreen: openEditPlaceScreen,
            );
          },
        ),
      ),
    );
  }
}

class _PlaceCard extends StatelessWidget {
  final PlaceEntity placeEntity;
  final void Function(PlaceEntity placeEntity) openEditPlaceScreen;

  const _PlaceCard({
    required this.placeEntity,
    required this.openEditPlaceScreen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final place = placeEntity.place;

    return SightCard(
      placeEntity: placeEntity,
      header: SightCardHeader(
        image: SightImage(place: place, fit: BoxFit.fitWidth),
        typeText: SightTypeText(place: place),
        actions: SightActions(
          children: [
            IconActionWidget(
              onPressed: () {
                openEditPlaceScreen(placeEntity);
              },
              icon: const Icon(
                Icons.edit_note,
                color: AppColors.white,
              ),
            ),
            _AddToFavoriteAction(
              placeEntity: placeEntity,
            ),
          ],
        ),
      ),
      body: SightCardBody(
        children: [
          SightNameText(place: place),
          const SizedBox(height: 2),
          SightDetailsText(place: place),
        ],
      ),
    );
  }
}

class _AddToFavoriteAction extends StatelessWidget {
  final PlaceEntity placeEntity;

  const _AddToFavoriteAction({
    required this.placeEntity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.select<WishedPlacesState, bool>((s) => s.isFavorite(placeEntity));
    final wishedPlacesState = context.read<WishedPlacesState>();

    if (isFavorite) {
      return const IconActionWidget(
        icon: HeartSvgIcon.filled(
          color: AppColors.white,
        ),
      );
    }

    return IconActionWidget(
      onPressed: () {
        wishedPlacesState.add(placeEntity);
      },
      icon: const HeartSvgIcon(
        color: AppColors.white,
      ),
    );
  }
}
