import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:bosszp/ui/common/listen_scroll_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

int _scrollProgress(ScrollPosition position) {
  const maxOffset = 28.0;
  final dx = clampDouble(position.pixels, 0, maxOffset);
  return (dx * (100 / maxOffset)).toInt();
}

class MainMineWidget extends StatelessWidget {
  const MainMineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const avatarWidth = 58.0;
    final scrollControlller = ScrollController();
    final appear = context.read<Appearance>();
    const leaidng = 15.0;
    const nameFont = 20.0;
    double appBarHeight =
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height;
    return Container(
      color: appear.backgroundColor,
      child: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              child: Assets.images.basicBgNavMineBackImgIphone
                  .image(fit: BoxFit.fitWidth)),
          _ScrollView(
              scrollControlller: scrollControlller,
              avatarWidth: avatarWidth,
              leading: leaidng,
              nameFont: nameFont,
              appear: appear),
          Positioned(
              left: leaidng,
              right: leaidng,
              top: appBarHeight,
              child: ListenScrollController(
                scrollController: scrollControlller,
                builder: (progress, context, _) {
                  const fromSize = avatarWidth;
                  const toSize = avatarWidth / 2;
                  final toFont = nameFont - 4;
                  const _maxYName = 35.0;
                  const _maxYsubname = 20.0;
                  const _maxYavatar = 48.0;

                  return Offstage(
                    offstage: progress == 0,
                    child: _AvatarWidget(
                        subnameOffset: Offset(0, _maxYsubname * -progress),
                        subNameAlaph: (progress * -255).toInt() + 255,
                        avatarOffset: Offset(0, _maxYavatar * -progress),
                        nameOffset: Offset(0, _maxYName * -progress),
                        nameFontSize: progress * (toFont - nameFont) + nameFont,
                        avatarWidth: progress * (toSize - fromSize) + fromSize),
                  );
                },
                didUpdate: () => _scrollProgress(scrollControlller.position),
              ))
        ],
      ),
    );
  }
}

class _ScrollView extends StatelessWidget {
  const _ScrollView(
      {super.key,
      required this.scrollControlller,
      required this.avatarWidth,
      required this.appear,
      required this.nameFont,
      required this.leading});

  final ScrollController scrollControlller;
  final double avatarWidth;
  final Appearance appear;
  final double leading;
  final nameFont;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollControlller,
      slivers: [
        _AnimatedAppBar(controller: scrollControlller),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: leading, right: leading),
            child: Column(
              children: [
                ListenScrollController(
                  scrollController: scrollControlller,
                  builder: (progress, context, child) {
                    return Visibility(
                        visible: progress == 0,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: child!);
                  },
                  child: _AvatarWidget(
                    avatarWidth: avatarWidth,
                    nameFontSize: nameFont,
                  ),
                  didUpdate: () => _scrollProgress(scrollControlller.position),
                ),
                SizedBox(height: 16),
                _NumberRowWidget(appear: appear),
                SizedBox(height: 10),
                Card(
                  color: Colors.white,
                  elevation: 0.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Assets.images.newBannerIphone
                            .image(fit: BoxFit.fill, height: 80),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 15, 5, 40),
                  child: Text(
                    "客服电话 400-065-5799 工作时间 8:00-22:00\n老年人直连热线 400-661-6030 工作时间 8:00-22:00\n推荐算法举报与未成年人举报渠道同上\n人力资源服务许可证  营业执照  朝阳区人社局监督电话\n京ICP备案14013441号-23A  京ICP证150923号",
                    style: TextStyle(
                        color: appear.subTitleColor, fontSize: 13, height: 2.2),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AnimatedAppBar extends StatelessWidget {
  _AnimatedAppBar({super.key, required this.controller});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      actions: [
        IconButton(
            onPressed: null,
            icon: Assets.images.geekMyNavSwitchNewIphone.image()),
        IconButton(
            onPressed: null,
            icon: Assets.images.geekMyNavScanNewIphone.image()),
        IconButton(
            onPressed: null, icon: Assets.images.geekMyNavSetNewIphone.image())
      ],
      flexibleSpace: FlexibleSpaceBar(
          background: ListenScrollController(
        scrollController: controller,
        builder: (progress, context, child) => Opacity(
          opacity: progress,
          child: child!,
        ),
        didUpdate: () => _scrollProgress(controller.position),
        child: Assets.images.basicBgNaviBackImgIphone.image(fit: BoxFit.cover),
      )),
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
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < 4; i++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Assets.images.bgResumeMbtiDidTestIconIphone.image(),
                        Text(
                          "在线简历",
                          style:
                              TextStyle(color: appear.titleColor, fontSize: 14),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "待优化5项",
                          style: TextStyle(
                              color: appear.subTitleColor, fontSize: 12),
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
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                  Spacer(),
                  Text(
                    "查看全部",
                    style: TextStyle(
                        fontSize: 13,
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
                                width: 30, height: 30, fit: BoxFit.cover),
                            SizedBox(height: 5),
                            Text(
                              "企业洞察",
                              style: TextStyle(
                                  color: appear.titleColor, fontSize: 14),
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
              fontSize: 15,
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
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              TextSpan(
                text: "740",
                children: [
                  TextSpan(
                      text: "\n沟通过",
                      style: TextStyle(
                          color: appear.subTitleColor,
                          fontSize: 14,
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
  const _AvatarWidget(
      {super.key,
      required this.avatarWidth,
      this.avatarOffset = Offset.zero,
      this.nameOffset = Offset.zero,
      this.subnameOffset = Offset.zero,
      required this.nameFontSize,
      this.subNameAlaph = 255});

  final double avatarWidth;
  final Offset avatarOffset;
  final Offset nameOffset;
  final Offset subnameOffset;
  final double nameFontSize;
  final int subNameAlaph;
  @override
  Widget build(BuildContext context) {
    final appear = context.read<Appearance>();
    return Row(
      children: [
        Transform.translate(
          offset: avatarOffset,
          child: ClipOval(
              child: Assets.images.avatar1Iphone
                  .image(width: avatarWidth, height: avatarWidth)),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: nameOffset,
              child: Text(
                "李孝利",
                style: TextStyle(
                    color: appear.titleColor,
                    fontSize: nameFontSize,
                    fontWeight: FontWeight.w900),
              ),
            ),
            // SizedBox(height: 3),
            Transform.translate(
              offset: subnameOffset,
              child: Text(
                "简历评分80分，建议优化",
                style: TextStyle(
                    color: appear.subTitleColor.withAlpha(subNameAlaph),
                    fontSize: 14),
              ),
            )
          ],
        ),
        Spacer(),
        Assets.images.settingMoreArrowIphone.image(
            fit: BoxFit.fitHeight,
            color: appear.subTitleColor.withAlpha(subNameAlaph),
            width: 18,
            height: 18)
      ],
    );
  }
}
