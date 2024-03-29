import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/material.dart';
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
      child: Text(
        content,
        style: TextStyle(fontSize: 13, color: appear.timeColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
