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
    context.read<Appearance>();
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text("aaa"),
          pinned: true,
          // backgroundColor: Colors.amber,
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

        //   child: ListView.builder(
        //       itemCount: 20,
        //       itemBuilder: (context, index) {
        //         return PostionItemWidget();
        //       }),
        // ),
      ],
    );
  }
}
