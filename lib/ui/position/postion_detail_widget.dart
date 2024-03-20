import 'dart:ui';

import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PostionDetailWidget extends StatelessWidget {
  const PostionDetailWidget({super.key, this.leading = 20});
  final double leading;
  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    final line = SizedBox(height: 1, child: ColoredBox(color: Colors.black12));
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Assets.images.bhHmpgNavShareBlackIphone.image()),
          IconButton(
              onPressed: () {},
              icon: Assets.images.chatNavRightIconIphone.image())
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(leading, 10, leading, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(children: [
                        Expanded(
                          child: Text(
                            "高级iOS开发工程师",
                            style: TextStyle(
                                color: appear.titleColor,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "40-60K·15薪",
                          style: TextStyle(
                              color: appear.blueColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )
                      ]),
                      SizedBox(height: 20),
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 15,
                        alignment: WrapAlignment.start,
                        runSpacing: 10,
                        children: [
                          for (int i = 0; i < 3; i++)
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Assets.images.bzGetCardDetailInfoIconIphone
                                    .image(),
                                SizedBox(width: 5),
                                Text(
                                  "北京～庄$i",
                                  style: TextStyle(
                                      color: appear.subTitleColor,
                                      fontSize: 15),
                                )
                              ],
                            )
                        ],
                      ),
                      SizedBox(height: 20),
                      line,
                      SizedBox(height: 20),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Assets.images.avatar2Iphone
                                .image(width: 50, height: 50),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text("刘泽奇"), Text("贝壳找房·专家")],
                          ),
                          Spacer(),
                          Assets.images.basicMoreArrowiphone.image()
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 55),
                        child: Text(
                          "今日回复1次",
                          style: TextStyle(
                              color: appear.subTitleColor, fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 30),
                      line,
                      SizedBox(height: 30),
                      Text(
                        "职位详情",
                        style: TextStyle(
                            color: appear.titleColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 25),
                      Wrap(
                        children: [
                          for (int i = 0; i < 14; i++)
                            Container(
                              decoration: BoxDecoration(
                                  color: appear.backgroundColor,
                                  borderRadius: BorderRadius.circular(4)),
                              padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                              child: Text(
                                "智能硬件",
                                style: TextStyle(
                                    color: appear.subTitleColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                        ],
                        spacing: 8,
                        runSpacing: 10,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SafeArea(
            child: Container(
              color: appear.blueColor,
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.only(left: leading, right: leading),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "立即沟通",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
