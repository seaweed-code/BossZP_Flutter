import 'package:bosszp/model/Appearance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'position_item_widget.dart';

class PositionListWidget extends StatelessWidget {
  const PositionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<Appearance>();
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return PostionItemWidget();
        });
  }
}
