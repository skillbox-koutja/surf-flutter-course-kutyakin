import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class SightDetails extends StatefulWidget {
  final Sight sight;

  const SightDetails({required this.sight, Key? key}) : super(key: key);

  @override
  State<SightDetails> createState() => _SightDetailsState();
}

class _SightDetailsState extends State<SightDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
              ),
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: Image.network(
                      widget.sight.imageUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        return loadingProgress == null ? child : const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                  Positioned(
                    top: 36,
                    left: 16,
                    child: SizedBox(
                      height: 32,
                      width: 32,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
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
                    style: const TextStyle(
                      color: Color(0xFF3B3E5B),
                      fontSize: 24.0,
                      height: 1.2,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    widget.sight.type,
                    style: const TextStyle(
                      color: Color(0xFF3B3E5B),
                      fontSize: 14.0,
                      height: 1.29,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    widget.sight.details,
                    style: const TextStyle(
                      color: Color(0xFF3B3E5B),
                      fontSize: 14.0,
                      height: 1.29,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF4CAF50),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SizedBox(
                        height: 48,
                        child: Center(
                          child: Text(
                            'ПОСТРОИТЬ МАРШРУТ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              height: 1.29,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
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
