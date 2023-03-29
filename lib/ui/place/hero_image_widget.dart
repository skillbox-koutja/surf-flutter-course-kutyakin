import 'package:flutter/material.dart';
import 'package:places/domain/places/place/entity.dart';

class PlaceHeroImageWidget extends StatelessWidget {
  final PlaceEntity placeEntity;
  final Widget child;

  const PlaceHeroImageWidget({
    required this.placeEntity,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'place-img-${placeEntity.id}',
      child: child,
    );
  }
}
