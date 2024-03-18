import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'position_item_widget.dart';

class PositionListWidget extends StatelessWidget {
  const PositionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appear = context.read<Appearance>();
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          // title: Text("aaa"),
          leading: Text(
            "iOS",
            style: TextStyle(
                color: appear.titleColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          pinned: true,
          actions: [
            IconButton(onPressed: null, icon: Icon(Icons.add)),
            IconButton(onPressed: null, icon: Icon(Icons.search)),
          ],
          flexibleSpace: FlexibleSpaceBar(
              background:
                  Assets.images.basicBbNavBacIphone.image(fit: BoxFit.cover)),
        ),
        SliverList.builder(
          itemBuilder: (context, index) {
            return PostionItemWidget();
          },
          itemCount: 20,
        )
      ],
    );
  }
}
