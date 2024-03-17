import 'dart:math';
import 'package:bosszp/model/Appearance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FollowItemWidget extends StatelessWidget {
  const FollowItemWidget({super.key, this.answeredQuestion});

  final String? answeredQuestion;

  @override
  Widget build(BuildContext context) {
    final appearance = context.read<Appearance>();
    return Container(
      color: appearance.backgroundColor,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
        elevation: 0.5,
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.ac_unit_sharp),
                  SizedBox(width: 6),
                  _PersonInfoWidget(colorDark: appearance.darkColor),
                  Spacer(),
                  SizedBox(width: 8),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent)),
                      child: Text(
                        "关注",
                        style: TextStyle(
                            color: appearance.blueColor, fontSize: 12),
                      )),
                  TextButton(onPressed: () {}, child: Text("..."))
                ],
              ),
              if (answeredQuestion != null) SizedBox(height: 6),
              if (answeredQuestion != null)
                Text(
                  answeredQuestion!,
                  style: TextStyle(
                      fontSize: 12,
                      color: context.read<Appearance>().darkColor),
                ),
              SizedBox(height: 8),
              Text.rich(
                TextSpan(
                    text:
                        "面试岗位:：移动开发——iOS\n面试题目：谈谈Block与函数的区别？\n回答参考：Block可以写在方法里面",
                    children: []),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  _IconTextWIdget(),
                  Spacer(),
                  _IconTextWIdget(),
                  Spacer(),
                  _IconTextWIdget()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _IconTextWIdget extends StatelessWidget {
  const _IconTextWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<Appearance>(context, listen: false).darkColor;
    return TextButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.access_alarm_outlined,
          color: color,
          size: 22,
        ),
        label: Text(
          "426",
          style: TextStyle(fontSize: 12, color: color),
        ));
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
              fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        if (Random().nextBool())
          Text(
            "今日回复4次",
            style: TextStyle(fontSize: 10, color: colorDark),
          )
      ],
    );
  }
}
