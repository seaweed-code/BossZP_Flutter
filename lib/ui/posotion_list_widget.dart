import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:bosszp/ui/common/segement_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'position_item_widget.dart';

class PositionListWidget extends StatelessWidget {
  PositionListWidget({super.key});

  final selected = ValueNotifier<int>(0);

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
      body: Column(children: [
        Container(
          color: Colors.white,
          height: 50,
          padding: EdgeInsets.only(left: 15),
          child: SegementWdiget(
            titles: ["推荐", "附近", "最新"],
            selected: selected,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return PostionItemWidget();
            },
          ),
        )
      ]),
    );
  }
}
