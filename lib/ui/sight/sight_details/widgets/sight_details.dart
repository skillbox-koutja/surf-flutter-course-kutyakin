import 'package:dartz/dartz.dart' show Either;
import 'package:flutter/material.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/use_case/get_place_details/use_case.dart';
import 'package:places/ui/app/state/places.dart';
import 'package:places/ui/components/back_button.dart';
import 'package:places/ui/components/error_state.dart';
import 'package:places/ui/components/progress_indicator/circular.dart';
import 'package:places/ui/place/hero_image_widget.dart';
import 'package:places/ui/sight/sight_details/widgets/sight_details_body.dart';
import 'package:places/ui/sight/sight_details/widgets/sight_details_header.dart';
import 'package:provider/provider.dart';

class SightDetails extends StatelessWidget {
  final PlaceEntity placeEntity;
  final Widget? leading;

  const SightDetails({
    required this.placeEntity,
    this.leading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          flexibleSpace: PlaceHeroImageWidget(
            placeEntity: placeEntity,
            child: SightDetailsHeader(place: placeEntity.place),
          ),
          leading: leading,
          automaticallyImplyLeading: leading != null,
          expandedHeight: 360,
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              SightDetailsBody(placeEntity: placeEntity),
            ]),
          ),
        ),
      ],
    );
  }
}
