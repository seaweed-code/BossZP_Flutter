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
    context.read<Appearance>();
    return Column(
      children: [
        AppBar(
          title: Text("aaa"),

          // flexibleSpace: FlexibleSpaceBar(
          //     // background: Assets.images.basicBbNavBacIphone.image(),
          //     ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return PostionItemWidget();
              }),
        ),
      ],
    );
  }
}
