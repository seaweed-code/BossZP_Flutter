import 'package:bosszp/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class MainMineWidget extends StatelessWidget {
  const MainMineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
            width: double.infinity,
            child: Assets.images.basicBbNavMineBacIphone
                .image(fit: BoxFit.fitWidth)),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.transparent,
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
