import 'package:bosszp/ui/chat/chat_row_text_widget.dart';
import 'package:flutter/material.dart';

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

class ChatListModel {
  final List<ChatRowModel> datas = [];
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  void addRow(ChatRowModel m) {
    final idx = datas.length;
    datas.insert(idx, m);
    listKey.currentState?.insertItem(idx);
  }

  void removeRow(int index) {
    // datas.removeAt(index);
  }
}
