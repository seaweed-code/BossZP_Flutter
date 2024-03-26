import 'package:bosszp/model/appearance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatDetailWidget extends StatelessWidget {
  const ChatDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appear = context.read<Appearance>();
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "李响",
              style: TextStyle(
                  color: appear.titleColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "5min-hr",
              style: TextStyle(
                  color: appear.titleColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
      body: Placeholder(),
    );
  }
}
