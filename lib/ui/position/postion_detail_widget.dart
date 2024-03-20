import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostionDetailWidget extends StatelessWidget {
  const PostionDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [],
            ),
          ),
          Container(
            color: Colors.white,
            child: TextButton(
              onPressed: () {},
              child: Text("立即沟通"),
            ),
          )
        ],
      ),
    );
  }
}
