import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/cupertino.dart';
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
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return LayoutBuilder(builder: (context, constraints) {
                  return Row(
                    children: [
                      ClipOval(
                          child: Assets.images.avatar2Iphone
                              .image(width: 40, height: 40)),
                      SizedBox(width: 5),
                      SizedBox(
                        width: constraints.maxWidth * 0.7,
                        child: Text(
                          "您好，您考虑外包岗位吗？77777==-=-=-=-=",
                          style: TextStyle(
                              color: appear.titleColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  );
                });
              },
            ),
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
