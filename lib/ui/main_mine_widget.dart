import 'package:bosszp/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class MainMineWidget extends StatelessWidget {
  const MainMineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Assets.images.basicBbNavMineBacIphone.image(fit: BoxFit.fitWidth),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              // title: Text("---"),
              pinned: true,
              backgroundColor: Colors.transparent,
              // foregroundColor: Colors.amber,
              // shadowColor: Colors.white,
              surfaceTintColor: Colors.transparent,
            ),
            SliverToBoxAdapter(
              child: Placeholder(),
            ),
            SliverToBoxAdapter(
              child: Placeholder(),
            )
          ],
        ),
      ],
    );
  }
}
