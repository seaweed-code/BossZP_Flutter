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
    final line =
        SizedBox(height: 1, child: ColoredBox(color: appear.lineColor));
    const avatarWidth = 50.0;
    const avatarTraing = 20.0;
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
      body: Container(
        color: Colors.white,
        child: Column(
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
                        _AttributesWiget(),
                        SizedBox(height: 20),
                        line,
                        SizedBox(height: 20),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(avatarWidth / 2),
                              child: Assets.images.avatar2Iphone.image(
                                  width: avatarWidth, height: avatarWidth),
                            ),
                            SizedBox(width: avatarTraing),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "刘泽奇",
                                  style: TextStyle(
                                      color: appear.titleColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "贝壳找房·专家",
                                  style: TextStyle(
                                      color: appear.subTitleColor,
                                      fontSize: 16),
                                )
                              ],
                            ),
                            Spacer(),
                            Assets.images.basicMoreArrowiphone.image()
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: avatarWidth + avatarTraing, top: 4),
                          child: Text(
                            "今日回复1次",
                            style: TextStyle(
                                color: appear.subTitleColor, fontSize: 13),
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
                        _TagsWidget(),
                        SizedBox(height: 20),
                        Text(
                          """职位详情:
        HRBP 人事 招聘 面试 培训	 办公室	
        时间及福利待遇:
        1、工作时间:8:30-12:00，2:00-5:30
        2、周休一天半法定节假日正常休，年假节日福利。
        3、五险一金+补充医疗保险+意外险，定期体检。
        4、员工旅游，不定时团建。
        5、绩效奖金，年终分红等。
        岗位职责:
        1、负责所管辖部门的数据汇总
        2、员工基本技能培训
        3、员工福利及活动福利的发放
        4、员工考核及沟通面谈
        5、员工选拔和筛选
        岗位要求:
        1、党员优先
        2、退伍军人优先
        3、年龄25岁-40岁，大专及以上学历。
        4、亲和力强，有很好的沟通能力和需要表达能力。
        5、工作踏实负责，学习能力强""",
                          style: TextStyle(
                              color: appear.titleColor,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              height: 1.8),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 20),
                        line,
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "员工福利",
                              style: TextStyle(
                                  color: appear.titleColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  height: 1.8),
                            ),
                            SizedBox(width: 4),
                            Assets.images.bhChatRobotQuesIconIphone.image(
                                fit: BoxFit.fitWidth, width: 20, height: 20)
                          ],
                        ),
                        SizedBox(height: 20),
                        _TagsWidget(),
                        SizedBox(height: 20),
                        line,
                        SizedBox(height: 20),
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
      ),
    );
  }
}

class _TagsWidget extends StatelessWidget {
  const _TagsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return Wrap(
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
    );
  }
}

class _AttributesWiget extends StatelessWidget {
  const _AttributesWiget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return Wrap(
      direction: Axis.horizontal,
      spacing: 15,
      alignment: WrapAlignment.start,
      runSpacing: 10,
      children: [
        for (int i = 0; i < 3; i++)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.images.bzGetCardDetailInfoIconIphone.image(),
              SizedBox(width: 5),
              Text(
                "北京～庄$i",
                style: TextStyle(color: appear.subTitleColor, fontSize: 16),
              )
            ],
          )
      ],
    );
  }
}
