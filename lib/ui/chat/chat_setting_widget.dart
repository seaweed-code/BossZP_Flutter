import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatSettingWidget extends StatelessWidget {
  const ChatSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    const leading = 20.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "聊天设置",
          style: TextStyle(
              color: appear.titleColor,
              fontSize: 18,
              fontWeight: FontWeight.normal),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: leading, right: leading),
            child: Row(
              children: [
                ClipOval(
                    child: Assets.images.avatar2Iphone
                        .image(width: 50, height: 50)),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "郑爽",
                      style: TextStyle(
                          color: appear.titleColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "百车宝 招聘经理",
                      style: TextStyle(
                        color: appear.subTitleColor,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Spacer(),
                Assets.images.basicMoreArrowiphone.image()
              ],
            ),
          )
        ],
      ),
    );
  }
}
