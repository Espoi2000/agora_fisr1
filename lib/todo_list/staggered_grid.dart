import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StraggeredScreen extends StatefulWidget {
  const StraggeredScreen({super.key});

  @override
  State<StraggeredScreen> createState() => _StraggeredScreenState();
}

class _StraggeredScreenState extends State<StraggeredScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.custom(
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 2,
          pattern: [
            const WovenGridTile(1),
            const WovenGridTile(
              5 / 7,
              crossAxisRatio: 0.9,
              alignment: AlignmentDirectional.centerEnd,
            ),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: 30,
          (context, index) => ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Padding(
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
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
