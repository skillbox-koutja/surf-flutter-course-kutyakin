import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/ui/sight/favorite_sights/widgets/favorite_sight_card.dart';
import 'package:places/ui/sight/sight_card/removable_sight_card.dart';
import 'package:places/ui/sight/sight_list/widgets/separator.dart';

class FavoriteSightList extends StatefulWidget {
  final FavoritePlaces favoritePlaces;
  final FavoriteSightCard Function({
    required FavoritePlace favoritePlace,
  }) buildCard;
  final ValueChanged<FavoritePlace>? onRemove;
  final void Function({
    required int index,
    required int targetPriority,
    required FavoritePlace favoritePlace,
  }) onReorder;

  const FavoriteSightList({
    required this.buildCard,
    required this.favoritePlaces,
    required this.onReorder,
    this.onRemove,
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteSightList> createState() => _FavoriteSightListState();
}

class _FavoriteSightListState extends State<FavoriteSightList> {
  final droppedPlace = ValueNotifier<FavoritePlace?>(null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverReorderableList(
            onReorderStart: (index) {
              debugPrint('onReorderStart $index');
            },
            onReorderEnd: (index) {
              debugPrint('onReorderEnd $index');
            },
            onReorder: (oldIndex, newIndex) {
              debugPrint('onReorder oldIndex: $oldIndex newIndex: $newIndex');
              widget.onReorder(
                index: newIndex,
                targetPriority: widget.favoritePlaces[newIndex].priority,
                favoritePlace: widget.favoritePlaces[oldIndex],
              );
            },
            itemCount: widget.favoritePlaces.length * 2 - 1,
            itemBuilder: (_, index) {
              final itemIndex = index ~/ 2;
              if (index.isOdd) {
                return SizedBox(
                  key: ValueKey('separator$index'),
                  child: placesSeparatorWidget,
                );
              }

              final favoritePlace = widget.favoritePlaces[itemIndex];
              final card = widget.buildCard(favoritePlace: favoritePlace);

              return _ReorderItem(
                key: ValueKey(favoritePlace.placeEntity.id),
                favoritePlace: favoritePlace,
                droppedPlace: droppedPlace,
                card: card,
                onReorder: (draggedPlace) {
                  widget.onReorder(
                    index: itemIndex,
                    targetPriority: favoritePlace.priority,
                    favoritePlace: draggedPlace,
                  );
                },
                onRemove: widget.onRemove,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ReorderItem extends StatelessWidget {
  final ValueNotifier<FavoritePlace?> droppedPlace;

  final FavoritePlace favoritePlace;
  final Widget card;
  final void Function(FavoritePlace draggedPlace) onReorder;
  final ValueChanged<FavoritePlace>? onRemove;

  const _ReorderItem({
    required this.droppedPlace,
    required this.card,
    required this.favoritePlace,
    required this.onReorder,
    this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<FavoritePlace>(
      onAccept: (draggedPlace) {
        if (favoritePlace == draggedPlace) return;

        droppedPlace.value = null;
        onReorder(draggedPlace);
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
        return ValueListenableBuilder(
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
              key: ObjectKey(favoritePlace),
              child: onRemove == null
                  ? card
                  : RemovableSightCard(
                      card: card,
                      onRemove: () => onRemove!.call(favoritePlace),
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
        );
      },
    );
  }
}
