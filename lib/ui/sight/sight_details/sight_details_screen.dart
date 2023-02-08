import 'package:flutter/material.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/ui/components/back_button.dart';
import 'package:places/ui/sight/sight_details/widgets/sight_details_body.dart';
import 'package:places/ui/sight/sight_details/widgets/sight_details_header.dart';

class SightDetailsScreen extends StatefulWidget {
  final Sight sight;

  const SightDetailsScreen({required this.sight, Key? key}) : super(key: key);

  @override
  State<SightDetailsScreen> createState() => _SightDetailsScreenState();
}

class _SightDetailsScreenState extends State<SightDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: SightDetailsHeader(sight: widget.sight),
            leading: Center(child: const AppBackButton()),
            expandedHeight: 360,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                SightDetailsBody(sight: widget.sight),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
