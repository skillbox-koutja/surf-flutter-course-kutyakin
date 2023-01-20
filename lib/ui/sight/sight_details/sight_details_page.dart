import 'package:flutter/material.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/ui/sight/sight_details/widgets/sight_details_body.dart';
import 'package:places/ui/sight/sight_details/widgets/sight_details_header.dart';

class SightDetailsPage extends StatefulWidget {
  final Sight sight;

  const SightDetailsPage({required this.sight, Key? key}) : super(key: key);

  @override
  State<SightDetailsPage> createState() => _SightDetailsPageState();
}

class _SightDetailsPageState extends State<SightDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SightDetailsHeader(sight: widget.sight),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: SightDetailsBody(sight: widget.sight),
            ),
          ),
        ],
      ),
    );
  }
}
