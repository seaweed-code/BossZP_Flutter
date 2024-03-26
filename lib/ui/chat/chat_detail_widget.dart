import 'package:flutter/material.dart';

class ChatDetailWidget extends StatelessWidget {
  const ChatDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [Text("徐姗姗"), Text("5min-hr")],
        ),
      ),
      body: Placeholder(),
    );
  }
}
