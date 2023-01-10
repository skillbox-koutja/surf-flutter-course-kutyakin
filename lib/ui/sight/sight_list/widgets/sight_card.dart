import 'package:flutter/material.dart';
import 'package:places/domain/sight/sight.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  const SightCard({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            sight.type.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              height: 1.29,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3, right: 2),
                            child: ColoredBox(
                              color: Colors.white,
                              child: SizedBox.square(
                                dimension: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sight.name,
                    style: const TextStyle(
                      color: Color(0xFF3B3E5B),
                      fontSize: 16.0,
                      height: 1.25,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    sight.details,
                    style: const TextStyle(
                      color: Color(0xFF7C7E92),
                      fontSize: 14.0,
                      height: 1.29,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
