import 'package:bosszp/model/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PostionDetailWidget extends StatelessWidget {
  const PostionDetailWidget({super.key, this.leading = 25});
  final double leading;
  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(leading, 10, leading, 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "iOS技术专家",
                            style: TextStyle(
                                color: appear.titleColor,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            "40-60K 15薪",
                            style: TextStyle(
                                color: appear.blueColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )
                        ],
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
                      fontSize: 20,
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
