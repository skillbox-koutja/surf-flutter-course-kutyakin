import 'package:dartz/dartz.dart' show Either;
import 'package:flutter/material.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/use_case/get_place_details/use_case.dart';
import 'package:places/ui/app/state/places.dart';
import 'package:places/ui/components/back_button.dart';
import 'package:places/ui/components/error_state.dart';
import 'package:places/ui/sight/sight_details/widgets/sight_details_body.dart';
import 'package:places/ui/sight/sight_details/widgets/sight_details_header.dart';
import 'package:provider/provider.dart';

class SightDetailsScreen extends StatelessWidget {
  final int placeId;

  const SightDetailsScreen({
    super.key,
    required this.placeId,
  });

  @override
  Widget build(BuildContext context) {
    return _DetailsLoader(
      placeId: placeId,
      getPlaceDetails: context.read<PlacesState>().getPlaceDetails,
    );
  }
}

class _DetailsLoader extends StatefulWidget {
  final int placeId;
  final GetPlaceDetails getPlaceDetails;

  const _DetailsLoader({
    Key? key,
    required this.placeId,
    required this.getPlaceDetails,
  }) : super(key: key);

  @override
  State<_DetailsLoader> createState() => _DetailsLoaderState();
}

class _DetailsLoaderState extends State<_DetailsLoader> {
  late Future<Either<Failure, PlaceEntity>> _placeDetails;

  @override
  void initState() {
    super.initState();
    _placeDetails = widget.getPlaceDetails(widget.placeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Either<Failure, PlaceEntity>>(
        future: _placeDetails,
        builder: (_, snapshot) {
          if (ConnectionState.done == snapshot.connectionState) {
            final response = snapshot.data!;

            return response.fold(
              (failure) => const ErrorState(
                actions: GoBackAction(),
              ),
              (placeEntity) => _Body(placeEntity: placeEntity),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final PlaceEntity placeEntity;

  const _Body({required this.placeEntity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          flexibleSpace: SightDetailsHeader(place: placeEntity.place),
          leading: const Center(child: AppBackButton()),
          expandedHeight: 360,
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              SightDetailsBody(place: placeEntity.place),
            ]),
          ),
        ),
      ],
    );
  }
}
