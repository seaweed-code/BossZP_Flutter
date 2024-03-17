import 'package:bosszp/ui/follow_item_widget.dart';
import 'package:flutter/material.dart';

class Follow_List_Widget extends StatelessWidget {
  const Follow_List_Widget({super.key});

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
