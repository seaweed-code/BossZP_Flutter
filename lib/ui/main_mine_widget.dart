import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MainMineWidget extends StatelessWidget {
  const MainMineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final avatarWidth = 58.0;
    final appear = context.read<Appearance>();
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
            width: double.infinity,
            // height: 200,
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
                child: Column(
                  children: [
                    _AvatarWidget(avatarWidth: avatarWidth, appear: appear),
                    SizedBox(height: 16),
                    _NumberRowWidget(appear: appear),
                    SizedBox(height: 10),
                    Card(
                      color: Colors.white,
                      // margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(child: _SubRowWidget()),
                            SizedBox(width: 12),
                            Text(
                              "|",
                              style: TextStyle(
                                  color: Colors.black12, fontSize: 14),
                            ),
                            SizedBox(width: 12),
                            Expanded(child: _SubRowWidget()),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SubRowWidget extends StatelessWidget {
  const _SubRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return Row(
      children: [
        Icon(
          Icons.bar_chart,
          size: 20,
        ),
        SizedBox(width: 4), // height)
        Text(
          "简历刷新",
          style: TextStyle(
              color: appear.titleColor,
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
        Spacer(),
        Text(
          "提升曝光",
          style: TextStyle(
              color: Colors.black45,
              fontSize: 12,
              fontWeight: FontWeight.normal),
        ),
        SizedBox(width: 5),
        Assets.images.basicMoreArrowiphone.image(),
      ],
    );
  }
}

class _NumberRowWidget extends StatelessWidget {
  const _NumberRowWidget({
    super.key,
    required this.appear,
  });

  final Appearance appear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < 4; i++)
            Text.rich(
              maxLines: 2,
              style: TextStyle(
                  color: appear.titleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              TextSpan(
                text: "740",
                children: [
                  TextSpan(
                      text: "\n沟通过",
                      style: TextStyle(
                          color: appear.subTitleColor,
                          fontSize: 12,
                          fontWeight: FontWeight.normal))
                ],
              ),
              textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    super.key,
    required this.avatarWidth,
    required this.appear,
  });

  final double avatarWidth;
  final Appearance appear;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  color: appear.titleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w900),
            ),
            // SizedBox(height: 3),
            Text(
              "简历评分80分，建议优化",
              style: TextStyle(color: appear.subTitleColor, fontSize: 13),
            )
          ],
        ),
        Spacer(),
        Assets.images.settingMoreArrowIphone.image()
      ],
    );
  }
}
