import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MainMineWidget extends StatelessWidget {
  const MainMineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final avatarWidth = 58.0;
    // final appear = context.read<Appearance>();
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
                            .image(width: avatarWidth, height: avatarWidth)),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "李孝利",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        // SizedBox(height: 3),
                        Text(
                          "简历评分80分，建议优化",
                          style: TextStyle(color: Colors.black12, fontSize: 13),
                        )
                      ],
                    )
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
