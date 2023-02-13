import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/ui/components/back_button.dart';
import 'package:places/ui/components/close_card_button.dart';
import 'package:places/ui/sight/sight_details/widgets/sight_details_body.dart';
import 'package:places/ui/sight/sight_details/widgets/sight_details_header.dart';

class SightDetailsBottomSheet extends StatelessWidget {
  final Sight sight;

  const SightDetailsBottomSheet({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height - 64,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        clipBehavior: Clip.hardEdge,
        child: ColoredBox(
          color: theme.scaffoldBackgroundColor,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    flexibleSpace: SightDetailsHeader(sight: sight),
                    automaticallyImplyLeading: false,
                    expandedHeight: 360,
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        SightDetailsBody(sight: sight),
                      ]),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      height: 4,
                      width: 40,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CloseCardButton()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
