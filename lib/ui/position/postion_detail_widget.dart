import 'package:bosszp/model/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PostionDetailWidget extends StatelessWidget {
  const PostionDetailWidget({super.key, this.leading = 15});
  final double leading;
  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [],
            ),
          ),
          SafeArea(
            child: Container(
              color: appear.blueColor,
              width: double.infinity,
              padding: EdgeInsets.only(left: leading, right: leading),
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
