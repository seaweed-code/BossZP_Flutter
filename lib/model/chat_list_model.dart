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

class ChatListModel extends ChangeNotifier {
  final List<ChatRowModel> datas = [];

  void addRow(ChatRowModel m) {
    datas.add(m);
    notifyListeners();
  }

  void removeRow(int index) {
    datas.removeAt(index);
    notifyListeners();
  }
}
