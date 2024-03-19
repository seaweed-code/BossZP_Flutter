import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainMineWidget extends StatelessWidget {
  const MainMineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const avatarWidth = 58.0;
    final scrollControlller = ScrollController();
    final appear = context.read<Appearance>();
    return Container(
      color: appear.backgroundColor,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
              width: double.infinity,
              child: Assets.images.basicBgNavMineBackImgIphone
                  .image(fit: BoxFit.fitWidth)),
          CustomScrollView(
            controller: scrollControlller,
            slivers: [
              _AnimatedAppBar(controller: scrollControlller),
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
                        elevation: 0.0,
                        child: Column(
                          children: [
                            Placeholder(
                              fallbackHeight: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
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
                          ],
                        ),
                      ),
                      _FrequentFunWidget(),
                      _OtherFunsWidget(),
                      Placeholder()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnimatedAppBar extends StatefulWidget {
  _AnimatedAppBar({super.key, required this.controller, this.maxOffset = 28.0});
  final ScrollController controller;

  final maxOffset;
  @override
  State<_AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<_AnimatedAppBar> {
  double offset = 0;
  final backNavigation =
      Assets.images.basicBgNaviBackImgIphone.image(fit: BoxFit.cover);
  @override
  void initState() {
    widget.controller.addListener(_onscroll);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onscroll);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _AnimatedAppBar oldWidget) {
    oldWidget.controller.removeListener(_onscroll);
    widget.controller.addListener(_onscroll);

    super.didUpdateWidget(oldWidget);
  }

  void _onscroll() {
    final position = widget.controller.position;
    final dx = clampDouble(position.pixels, 0, widget.maxOffset);

    if (offset != dx) {
      setState(() {
        offset = dx;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final opacity = offset * (1.0 / widget.maxOffset);
    final Appearance appear = context.read();
    return SliverAppBar(
      pinned: true,
      actions: [
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.person,
              color: appear.titleColor,
            )),
        IconButton(
            onPressed: null,
            icon: Icon(Icons.document_scanner, color: appear.titleColor)),
        IconButton(
            onPressed: null,
            icon: Icon(Icons.settings, color: appear.titleColor))
      ],
      flexibleSpace: FlexibleSpaceBar(
          background: Opacity(opacity: opacity, child: backNavigation)),
    );
  }
}

class _FrequentFunWidget extends StatelessWidget {
  const _FrequentFunWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return Card(
        color: Colors.white,
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "常用功能",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < 4; i++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.g_translate_outlined,
                          size: 35,
                        ),
                        Text(
                          "在线简历",
                          style:
                              TextStyle(color: appear.titleColor, fontSize: 12),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "待优化5项",
                          style: TextStyle(
                              color: appear.subTitleColor, fontSize: 10),
                        )
                      ],
                    )
                ],
              )
            ],
          ),
        ));
  }
}

class _OtherFunsWidget extends StatelessWidget {
  const _OtherFunsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return Card(
        color: Colors.white,
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "其他功能",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  Spacer(),
                  Text(
                    "查看全部",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: Colors.black45),
                  ),
                  SizedBox(width: 12),
                  Assets.images.basicMoreArrowiphone.image()
                ],
              ),
              SizedBox(height: 10),
              for (int idx = 0; idx < 3; idx++)
                Padding(
                  padding: EdgeInsets.only(bottom: (idx == 3 - 1) ? 0 : 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (int i = 0; i < 4; i++)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Assets.images.settingDetailIconIphone.image(
                                width: 25, height: 25, fit: BoxFit.cover),
                            SizedBox(height: 5),
                            Text(
                              "企业洞察",
                              style: TextStyle(
                                  color: appear.titleColor, fontSize: 12),
                            ),
                          ],
                        )
                    ],
                  ),
                )
            ],
          ),
        ));
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
        Assets.images.settingMoreArrowIphone.image(
            fit: BoxFit.fitHeight,
            color: appear.subTitleColor,
            width: 18,
            height: 18)
      ],
    );
  }
}
