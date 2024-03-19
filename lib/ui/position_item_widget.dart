import 'dart:math';

import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostionItemWidget extends StatelessWidget {
  const PostionItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appear = context.read<Appearance>();
    const avatarWidth = 32.0;
    return Container(
      color: appear.backgroundColor,
      child: Card(
        margin: EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 0),
        elevation: 0.2,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 12, 10, 6),
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
                          fontWeight: FontWeight.bold,
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
              SizedBox(height: 8),
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(avatarWidth / 2),
                      child: Assets.images.avatar1Iphone
                          .image(width: avatarWidth, height: avatarWidth)),
                  SizedBox(width: 6),
                  _PersonInfoWidget(),
                  Spacer(),
                  Text(
                    "东城区 - 建国门",
                    style: TextStyle(fontSize: 14, color: appear.darkColor),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Assets.images.darkBasicGuideviewCommentCloseIphone
                        .image(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PersonInfoWidget extends StatelessWidget {
  const _PersonInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "张先生 - 人事总监",
          style: TextStyle(fontSize: 14, color: appear.subTitleColor),
        ),
        if (Random().nextBool())
          Text(
            "今日回复4次",
            style: TextStyle(fontSize: 13, color: appear.darkColor),
          )
      ],
    );
  }
}
