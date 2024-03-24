import 'dart:math';
import 'dart:ui';
import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FollowItemWidget extends StatelessWidget {
  const FollowItemWidget(
      {super.key, this.answeredQuestion, required this.leading});

  final String? answeredQuestion;
  final leading;

  @override
  Widget build(BuildContext context) {
    final appearance = context.read<Appearance>();
    const avatarWidth = 36.0;
    return Container(
      color: appearance.backgroundColor,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(leading, 5, leading, 5),
        elevation: 0.5,
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Assets.images.avatar2Iphone
                        .image(width: avatarWidth, height: avatarWidth),
                  ),
                  SizedBox(width: 6),
                  _PersonInfoWidget(colorDark: appearance.subTitleColor),
                  Spacer(),
                  SizedBox(width: 8),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.all(0)),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
                                    color: appearance.blueColor, width: 1)),
                            elevation: MaterialStateProperty.all<double>(0),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent)),
                        child: Row(
                          children: [
                            Assets.images.bbChatTagAddIphone.image(),
                            SizedBox(width: 4),
                            Text(
                              "关注",
                              style: TextStyle(
                                  // height: 1,
                                  color: appearance.blueColor,
                                  fontSize: 12),
                            ),
                          ],
                        )),
                  ),
                  IconButton(
                      style: const ButtonStyle(
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent)),
                      onPressed: () {},
                      icon: Assets.images.bzCompanyBlackIconMoreIphone.image())
                ],
              ),
              if (answeredQuestion != null) SizedBox(height: 6),
              if (answeredQuestion != null)
                Text(
                  answeredQuestion!,
                  style: TextStyle(
                      fontSize: 12,
                      color: context.read<Appearance>().subTitleColor),
                ),
              SizedBox(height: 8),
              Text.rich(
                TextSpan(
                    text:
                        "面试岗位:：移动开发——iOS\n面试题目：谈谈Block与函数的区别？\n回答参考：Block可以写在方法里面",
                    children: []),
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: appearance.titleColor,
                    fontSize: 16,
                    height: 1.6,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      color: appearance.backgroundColor,
                      borderRadius: BorderRadius.circular(14)),
                  padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Assets.images.bzGetPostVideoTopicIconIphone.image(),
                      SizedBox(width: 4),
                      Text(
                        "技术面试题交流",
                        style: TextStyle(
                            color: appearance.titleColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 6),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _IconTextWIdget(
                        image:
                            Assets.images.bzGetCardDetailInfoIconIphone.image(),
                        text: "评论"),
                    _IconTextWIdget(
                        image: Assets.images.bzGetCardDetailCollectionIconIphone
                            .image(),
                        text: "12"),
                    _IconTextWIdget(
                        image:
                            Assets.images.bzGetCardDetailLikeIconIphone.image(),
                        text: "45"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _IconTextWIdget extends StatelessWidget {
  const _IconTextWIdget({super.key, required this.text, required this.image});

  final String text;
  final Widget image;
  @override
  Widget build(BuildContext context) {
    final appear = context.read<Appearance>();
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(
            Colors.transparent), // 设置点击时的背景色为透明
      ),
      onPressed: () {},
      child: Row(
        children: [
          image,
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(fontSize: 14, color: appear.subTitleColor),
          )
        ],
      ),
    );
  }
}

class _PersonInfoWidget extends StatelessWidget {
  const _PersonInfoWidget({
    super.key,
    required this.colorDark,
  });

  final Color colorDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "张先生 - 人事总监",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        if (Random().nextBool())
          Text(
            "今日回复4次",
            style: TextStyle(fontSize: 12, color: colorDark),
          )
      ],
    );
  }
}
