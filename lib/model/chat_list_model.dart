import 'package:flutter/material.dart';
import '../ui/chat/chat_detail_widget.dart';

abstract class ChatRowModel {
  Widget builderRow();
}

class ChatRowTextModel extends ChatRowModel {
  ChatRowTextModel(
    this.isSender,
    this.content,
  );
  String? avatar;
  bool isSender;
  String content;

  @override
  Widget builderRow() {
    return ChatRowTextWidget(
      isSender: isSender,
      text: content,
    );
  }
}

class ChatListModel extends ChangeNotifier {
  final List<ChatRowModel> datas = [];
}
