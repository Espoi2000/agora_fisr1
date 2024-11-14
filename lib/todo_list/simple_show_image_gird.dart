import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SimpleShowImageGrid extends StatefulWidget {
  const SimpleShowImageGrid({super.key});

  @override
  State<SimpleShowImageGrid> createState() => _SimpleShowImageGridState();
}

class _SimpleShowImageGridState extends State<SimpleShowImageGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 40,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: "https://picsum.photos/${index}00",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                            Colors.red, BlendMode.colorBurn)),
                  ),
                ),
                placeholder: (context, url) =>
                    const SizedBox(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          );
        },
      ),
    );
  }
}
