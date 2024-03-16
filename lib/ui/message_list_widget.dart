import 'package:bosszp/ui/message_item_widget.dart';
import 'package:flutter/material.dart';

class MessageListWidget extends StatelessWidget {
  const MessageListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return MessageItemWidget();
      },
    );
  }
}
