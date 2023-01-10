import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

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
          Flexible(
            flex: 3,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: FutureBuilder<bool>(
                    future: Future.delayed(
                      const Duration(seconds: 1),
                      () => true,
                    ), // a previously-obtained Future<String> or null
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return _SightImage(imageUrl: sight.imageUrl);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        sight.type,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          height: 1.29,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 3, right: 2),
                        child: ColoredBox(
                          color: Colors.white,
                          child: SizedBox.square(
                            dimension: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 16),
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
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth / 2,
                        ),
                        child: Text(
                          sight.details,
                          style: const TextStyle(
                            color: Color(0xFF7C7E92),
                            fontSize: 14.0,
                            height: 1.29,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    },
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

class _SightImage extends StatelessWidget {
  final String imageUrl;

  const _SightImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.fitWidth,
      loadingBuilder: (context, child, loadingProgress) {
        return loadingProgress == null
            ? ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: child,
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
