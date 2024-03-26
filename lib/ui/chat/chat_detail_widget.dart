import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ChatDetailWidget extends StatelessWidget {
  const ChatDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appear = context.read<Appearance>();
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            color: Colors.white,
          ),
        ),
        actions: [
          // IconButton(
          //     onPressed: () {},
          //     icon: Assets.images.chatNavRightTagsIconIphone.image()),
          IconButton(
              onPressed: () {},
              icon: Assets.images.chatNavRightIconIphone.image())
        ],
        title: Center(
          child: Column(
            children: [
              Text(
                "李响",
                style: TextStyle(
                    color: appear.titleColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "5min-hr",
                style: TextStyle(
                    color: appear.titleColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _ButtonWidget(
                  icon: Assets.images.chatVideoPhoneOtherIconIphone.image(),
                  text: "打电话",
                ),
                _ButtonWidget(
                  icon: Assets.images.chatVideoPhoneOtherIconIphone.image(),
                  text: "换微信",
                ),
                _ButtonWidget(
                  icon: Assets.images.chatVideoPhoneOtherIconIphone.image(),
                  text: "发简历",
                ),
                _ButtonWidget(
                  icon: Assets.images.chatVideoPhoneOtherIconIphone.image(),
                  text: "不感兴趣",
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: appear.backgroundColor,
              child: ListView.builder(
                // dragStartBehavior: DragStartBehavior.down,
                itemCount: 30,
                itemBuilder: (context, index) {
                  return _ChatRowTextWidget(isSender: index % 2 == 0);
                },
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 5, right: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Assets.images.chatBottomCommonIconIphone.image()),
                SizedBox(width: 10),
                Expanded(
                    child: TextField(
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "新信息",
                      hintStyle: TextStyle(color: appear.timeColor)),
                )),
                SizedBox(width: 10),
                IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    style: ButtonStyle(),
                    onPressed: () {},
                    icon:
                        Assets.images.chatBottomMoreDefaultIconIphone.image()),
                // SizedBox(width: 10),
                IconButton(
                    onPressed: () {},
                    icon:
                        Assets.images.chatBottomMoreDefaultIconIphone.image()),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class _ChatRowTextWidget extends StatelessWidget {
  const _ChatRowTextWidget({super.key, required this.isSender});
  final bool isSender;
  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 15),
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          textDirection: isSender ? TextDirection.rtl : TextDirection.ltr,
          children: [
            ClipOval(
                child:
                    Assets.images.avatar2Iphone.image(width: 35, height: 35)),
            SizedBox(width: 5),
            ConstraintsTransformBox(
              constraintsTransform: (pCon) => BoxConstraints(
                minHeight: pCon.minHeight,
                maxHeight: pCon.maxHeight,
                minWidth: pCon.minWidth,
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
                      "您好，您考？",
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

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({super.key, required this.text, required this.icon});

  final String text;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();

    return TextButton(
        onPressed: () {},
        child: Column(
          children: [
            icon,
            Text(
              text,
              style: TextStyle(color: appear.titleColor, fontSize: 14),
            )
          ],
        ));
  }
}
