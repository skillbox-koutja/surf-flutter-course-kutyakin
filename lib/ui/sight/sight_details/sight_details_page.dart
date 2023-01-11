import 'package:flutter/material.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/ui/theme/colors.dart';
import 'package:places/ui/theme/typography.dart';

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
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.placeholder,
              ),
              child: SizedBox.expand(
                child: Stack(
                  children: [
                    Positioned(
                      top: 36,
                      left: 16,
                      child: SizedBox(
                        height: 32,
                        width: 32,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.sight.name,
                    style: const AppTitleStyle(
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.sight.type.title,
                    style: const AppSmallBoldStyle(
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    widget.sight.details,
                    style: const AppSmallStyle(
                      color: AppColors.secondary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.whiteGreen,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const SizedBox(
                        height: 48,
                        child: Center(
                          child: Text(
                            'ПОСТРОИТЬ МАРШРУТ',
                            style: AppButtonStyle(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Divider(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(child: Center(child: Text('Запланировать'))),
                      Expanded(child: Center(child: Text('В Избранное'))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
