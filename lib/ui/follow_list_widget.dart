import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/ui/follow_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FollowListWidget extends StatelessWidget {
  const FollowListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: FlexibleSpaceBar(
              background: Assets.images.basicBgNaviBackImgIphone
                  .image(fit: BoxFit.cover))),
      body: ListView.builder(
        // prototypeItem: Follow_Item_Widget(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return FollowItemWidget();
        },
      ),
    );
  }
}
