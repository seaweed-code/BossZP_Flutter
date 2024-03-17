import 'package:bosszp/ui/follow_item_widget.dart';
import 'package:flutter/material.dart';

class FollowListWidget extends StatelessWidget {
  const FollowListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // prototypeItem: Follow_Item_Widget(),
      itemCount: 20,
      itemBuilder: (context, index) {
        return FollowItemWidget();
      },
    );
  }
}
