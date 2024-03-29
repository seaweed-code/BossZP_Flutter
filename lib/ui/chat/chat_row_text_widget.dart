import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

const _edgeInset = EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 15);
const _widthAvatar = 35.0;
const _traingAvatar = 5.0;

class ChatRowTextWidget extends StatelessWidget {
  const ChatRowTextWidget({
    super.key,
    required this.isSender,
    required this.text,
  });
  final bool isSender;
  final String text;
  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return Padding(
      padding: _edgeInset,
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          textDirection: isSender ? TextDirection.rtl : TextDirection.ltr,
          children: [
            ClipOval(
                child: Assets.images.avatar2Iphone
                    .image(width: _widthAvatar, height: _widthAvatar)),
            const SizedBox(width: _traingAvatar),
            ConstraintsTransformBox(
              constraintsTransform: (pCon) => BoxConstraints(
                minHeight: pCon.minHeight,
                maxHeight: pCon.maxHeight,
                minWidth: 80,
                maxWidth: constraints.maxWidth * 0.75,
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                      child: (isSender
                              ? Assets.images.bhChatBubbleBlueIphone
                              : Assets.images.bhChatBubbleWhiteLeftIphone)
                          .image(centerSlice: Rect.fromLTRB(15, 15, 25, 25))),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      text,
                      style: TextStyle(
                          color: isSender ? Colors.white : appear.titleColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}

class ChatRowTimeWidget extends StatelessWidget {
  const ChatRowTimeWidget({
    super.key,
    required this.content,
  });
  final String content;
  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    const leading = _widthAvatar + _traingAvatar;
    return Padding(
      padding: _edgeInset + EdgeInsets.only(left: leading, right: leading),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          content,
          style: TextStyle(fontSize: 12, color: appear.timeColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ChatRowJobCardWidget extends StatelessWidget {
  const ChatRowJobCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return Padding(
      padding: EdgeInsets.only(left: _edgeInset.left, right: _edgeInset.right),
      child: Card(
        elevation: 0.0,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 16, 15, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "iOS开发工程师",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: appear.titleColor),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "20-25K",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: context.read<Appearance>().blueColor),
                  )
                ],
              ),
              SizedBox(height: 6),
              Text(
                "腾讯 不需要融资 1000人以上",
                style: TextStyle(fontSize: 15, color: appear.subTitleColor),
              ),
              SizedBox(height: 6),
              Wrap(
                direction: Axis.horizontal,
                runSpacing: 5,
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      decoration: BoxDecoration(
                          color: appear.backgroundColor,
                          borderRadius: BorderRadius.circular(2)),
                      margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                      padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
                      child: Text(
                        "经验不限$i",
                        style: TextStyle(
                            color: appear.subTitleColor, fontSize: 14),
                      ),
                    )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipOval(
                      child: Assets.images.avatar1Iphone
                          .image(width: 25, height: 25)),
                  SizedBox(width: 8),
                  Text(
                    "张先生 - 人事总监",
                    style: TextStyle(fontSize: 14, color: appear.titleColor),
                  ),
                ],
              ),
              SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 1.5,
                child: ColoredBox(color: appear.lineColor),
              ),
              SizedBox(height: 16),
              Text(
                "今天早上 10点 由你发起的沟通",
                style: TextStyle(fontSize: 14, color: appear.subTitleColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
