import 'package:bosszp/gen/assets.gen.dart';
// import 'package:bosszp/model/appearance.dart';
import 'package:bosszp/ui/message_item_widget.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class MessageListWidget extends StatelessWidget {
  const MessageListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<Appearance>();

    return CustomScrollView(
      slivers: [
        SliverAppBar(
            actions: [
              IconButton(
                  onPressed: null,
                  icon: Assets.images.bzGetNaviMsgGrayIconIphone.image())
            ],
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                background: Assets.images.basicBgNaviBackImgIphone
                    .image(fit: BoxFit.cover))),
        SliverList.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return MessageItemWidget();
          },
        )
      ],
    );
  }
}
