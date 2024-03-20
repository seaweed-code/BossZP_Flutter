import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'position_item_widget.dart';

class PositionListWidget extends StatelessWidget {
  const PositionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appear = context.read<Appearance>();
    return Scaffold(
      appBar: AppBar(
          leadingWidth: double.infinity,
          leading: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "iOS",
                style: TextStyle(
                    color: appear.titleColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: null,
                icon: Assets.images.bzGetInterviewExpectMenuAddIcon.image()),
            IconButton(
                onPressed: null,
                icon: Assets.images.bzGetNaviSearchIconIphone.image()),
          ],
          flexibleSpace: FlexibleSpaceBar(
              background: Assets.images.basicBgNaviBackImgIphone
                  .image(fit: BoxFit.cover))),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return PostionItemWidget();
        },
      ),
    );
  }
}
