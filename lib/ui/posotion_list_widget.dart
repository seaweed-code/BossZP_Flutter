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
        AppBar(title: Text("aaa")),
        Expanded(
          child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return PostionItemWidget();
              }),
        ),
      ],
    );
  }
}
