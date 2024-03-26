import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatDetailWidget extends StatelessWidget {
  const ChatDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appear = context.read<Appearance>();
    return Scaffold(
      appBar: AppBar(
        title: Column(
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
      body: SafeArea(
          child: Column(
        children: [
          Row(
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
          )
        ],
      )),
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
