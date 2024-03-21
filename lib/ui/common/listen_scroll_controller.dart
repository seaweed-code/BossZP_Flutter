import 'dart:ui';

import 'package:flutter/material.dart';

typedef ListenScrollControllerBuilder = Widget Function(
    double progress, BuildContext context);
typedef ListenScrollControllerDidUpdate = int Function();

class ListenScrollController extends StatefulWidget {
  ListenScrollController(
      {super.key,
      required this.scrollController,
      required this.builder,
      required this.didUpdate});
  final ScrollController scrollController;
  final ListenScrollControllerBuilder builder;
  final ListenScrollControllerDidUpdate didUpdate;
  @override
  State<ListenScrollController> createState() =>
      __ListenScrollControllerState();
}

class __ListenScrollControllerState extends State<ListenScrollController> {
  int progress = 0;

  @override
  void initState() {
    widget.scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ListenScrollController oldWidget) {
    oldWidget.scrollController.removeListener(_onScroll);
    widget.scrollController.addListener(_onScroll);
    super.didUpdateWidget(oldWidget);
  }

  void _onScroll() {
    final newProgress = widget.didUpdate();
    if (progress != newProgress) {
      setState(() {
        progress = newProgress;
      });
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
        clampDouble(progress.toDouble(), 0, 100) / 100, context);
  }
}
