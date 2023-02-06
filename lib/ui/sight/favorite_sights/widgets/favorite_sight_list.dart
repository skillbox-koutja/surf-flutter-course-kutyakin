import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/sight/favorite_sight.dart';
import 'package:places/ui/sight/favorite_sights/favorite_sights_state.dart';
import 'package:places/ui/sight/favorite_sights/widgets/favorite_sight_card.dart';
import 'package:places/ui/sight/sight_card/removable_sight_card.dart';

class FavoriteSightList extends StatefulWidget {
  final FavoriteSights sights;
  final FavoriteSightCard Function({
    required FavoriteSight favoriteSight,
  }) buildCard;
  final ValueChanged<FavoriteSight> onRemove;
  final void Function({
    required int index,
    required FavoriteSight favoriteSight,
  }) onReorder;

  const FavoriteSightList({
    required this.buildCard,
    required this.sights,
    required this.onRemove,
    required this.onReorder,
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteSightList> createState() => _FavoriteSightListState();
}

class _FavoriteSightListState extends State<FavoriteSightList> {
  final droppedPlace = ValueNotifier<FavoriteSight?>(null);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) {
        return const SizedBox(height: 16);
      },
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: widget.sights.length,
      itemBuilder: (_, index) {
        final favoriteSight = widget.sights[index];
        final card = widget.buildCard(
          favoriteSight: favoriteSight,
        );

        return DragTarget<FavoriteSight>(
          onAccept: (draggedSight) {
            if (favoriteSight == draggedSight) return;

            droppedPlace.value = null;
            widget.onReorder(index: index, favoriteSight: draggedSight);
          },
          onWillAccept: (draggedSight) {
            if (favoriteSight == draggedSight) return false;

            droppedPlace.value = favoriteSight;

            return true;
          },
          onLeave: (draggedSight) {
            if (droppedPlace.value == favoriteSight) {
              droppedPlace.value = null;
            }
          },
          builder: (context, candidateData, rejectedData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ValueListenableBuilder(
                valueListenable: droppedPlace,
                builder: (_, droppedSight, __) {
                  if (droppedSight == favoriteSight) {
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

                  return LongPressDraggable<FavoriteSight>(
                    data: favoriteSight,
                    child: RemovableSightCard(
                      key: ObjectKey(favoriteSight),
                      card: card,
                      onRemove: () {
                        widget.onRemove(favoriteSight);
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
