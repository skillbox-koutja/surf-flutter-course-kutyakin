import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/ui/sight/favorite_sights/widgets/favorite_sight_card.dart';
import 'package:places/ui/sight/sight_card/removable_sight_card.dart';

class FavoriteSightList extends StatefulWidget {
  final FavoritePlaces favoritePlaces;
  final FavoriteSightCard Function({
    required FavoritePlace favoritePlace,
  }) buildCard;
  final ValueChanged<FavoritePlace> onRemove;
  final void Function({
    required int index,
    required FavoritePlace favoritePlace,
  }) onReorder;

  const FavoriteSightList({
    required this.buildCard,
    required this.favoritePlaces,
    required this.onRemove,
    required this.onReorder,
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteSightList> createState() => _FavoriteSightListState();
}

class _FavoriteSightListState extends State<FavoriteSightList> {
  final droppedPlace = ValueNotifier<FavoritePlace?>(null);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) {
        return const SizedBox(height: 16);
      },
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: widget.favoritePlaces.length,
      itemBuilder: (_, index) {
        final favoritePlace = widget.favoritePlaces[index];
        final card = widget.buildCard(
          favoritePlace: favoritePlace,
        );

        return DragTarget<FavoritePlace>(
          onAccept: (draggedPlace) {
            if (favoritePlace == draggedPlace) return;

            droppedPlace.value = null;
            widget.onReorder(index: index, favoritePlace: draggedPlace);
          },
          onWillAccept: (draggedPlace) {
            if (favoritePlace == draggedPlace) return false;

            droppedPlace.value = favoritePlace;

            return true;
          },
          onLeave: (draggedPlace) {
            if (droppedPlace.value == favoritePlace) {
              droppedPlace.value = null;
            }
          },
          builder: (context, candidateData, rejectedData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ValueListenableBuilder(
                valueListenable: droppedPlace,
                builder: (_, droppedSight, __) {
                  if (droppedSight == favoritePlace) {
                    return Stack(
                      children: [
                        card,
                        Positioned.fill(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.inactive.withOpacity(0.5),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.system_update_alt,
                                size: 72,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  return LongPressDraggable<FavoritePlace>(
                    data: favoritePlace,
                    child: RemovableSightCard(
                      key: ObjectKey(favoritePlace),
                      card: card,
                      onRemove: () {
                        widget.onRemove(favoritePlace);
                      },
                    ),
                    childWhenDragging: const SizedBox.shrink(),
                    feedback: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Opacity(
                        opacity: 0.5,
                        child: card,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
