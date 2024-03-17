import 'package:bosszp/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
              // flexibleSpace: FlexibleSpaceBar(
              //     background: Colors.transparent,
              //     ),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.amber,
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
