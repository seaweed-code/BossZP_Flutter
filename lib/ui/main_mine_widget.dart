import 'package:bosszp/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainMineWidget extends StatelessWidget {
  const MainMineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final avatarWidth = 50.0;
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
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(avatarWidth / 2),
                        child: Assets.images.avatar1Iphone
                            .image(width: avatarWidth, height: avatarWidth))
                  ],
                ),
              ),
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
