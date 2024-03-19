import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'position_item_widget.dart';

class PositionListWidget extends StatelessWidget {
  const PositionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appear = context.read<Appearance>();
    return CustomScrollView(
      slivers: [
        _AppBarWidget(appear: appear),
        SliverList.builder(
          itemBuilder: (context, index) {
            return PostionItemWidget();
          },
          itemCount: 20,
        )
      ],
    );
  }
}

class _AppBarWidget extends StatelessWidget {
  const _AppBarWidget({
    super.key,
    required this.appear,
  });

  final Appearance appear;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leadingWidth: double.infinity,
      leading: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "iOS",
            style: TextStyle(
                color: appear.titleColor,
                fontSize: 26,
                fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      pinned: true,
      actions: [
        IconButton(
            onPressed: null,
            icon: Assets.images.addMoreExpressionIphone.image()),
        IconButton(
            onPressed: null,
            icon: Assets.images.bzGetNaviSearchIconIphone.image()),
      ],
      flexibleSpace: FlexibleSpaceBar(
          background:
              Assets.images.basicBgNaviBackImgIphone.image(fit: BoxFit.cover)),
    );
  }
}
