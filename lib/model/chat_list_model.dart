import 'package:bosszp/ui/chat/chat_row_text_widget.dart';
import 'package:flutter/cupertino.dart';
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

class ChatRowTimeModel extends ChatRowModel {
  ChatRowTimeModel(this.text);
  String text;

  @override
  Widget builderRow() {
    return ChatRowTimeWidget(content: text);
  }
}

class ChatListModel {
  final List<ChatRowModel> datas = [];
  final scrollController = ScrollController();
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  void addRow(ChatRowModel m) {
    final idx = datas.length;
    datas.insert(idx, m);
    Duration duration = Duration(milliseconds: 500);
    listKey.currentState?.insertItem(idx, duration: duration);
    Future.delayed(duration).whenComplete(() {
      scrollController.scrollToBottom();
    });
  }
}

extension ToBottom on ScrollController {
  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      animateTo(
        position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    });
  }
}
