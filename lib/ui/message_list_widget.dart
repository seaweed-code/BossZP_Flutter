import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
// import 'package:bosszp/model/appearance.dart';
import 'package:bosszp/ui/message_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class MessageListWidget extends StatelessWidget {
  const MessageListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appear = context.read<Appearance>();
    const leading = 15.0;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
            actions: [
              IconButton(
                  onPressed: null,
                  icon: Assets.images.bzGetNaviMsgGrayIconIphone.image())
            ],
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                background: Assets.images.basicBgNaviBackImgIphone
                    .image(fit: BoxFit.cover))),
        _SearchBarWidget(leading: leading, appear: appear),
        SliverPersistentHeader(
          delegate: _SliverHeaderDelegate(leading: leading),
          pinned: true,
          // floating: true,
        ),
        SliverList.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return MessageItemWidget(
              leading: leading,
            );
          },
        )
      ],
    );
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverHeaderDelegate({required this.leading});
  final double leading;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final Appearance appearance = context.read();
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: leading, right: leading),
      height: maxExtent,
      child: Row(
        children: [
          Text(
            "全部",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: appearance.titleColor),
          ),
          SizedBox(width: 15),
          Text(
            "我发起",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: appearance.titleColor),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 50;

  @override
  // TODO: implement minExtent
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class _SearchBarWidget extends StatelessWidget {
  const _SearchBarWidget({
    super.key,
    required this.leading,
    required this.appear,
  });

  final double leading;
  final Appearance appear;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: leading, right: leading),
        child: SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: appear.backgroundColor,
                hintText: '搜索联系人、公司、聊天记录',
                hintStyle: TextStyle(color: appear.timeColor),
                prefixIcon:
                    Assets.images.settingContactSearchIconIphone.image(),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                contentPadding: EdgeInsets.symmetric(vertical: 9.0)),
          ),
        ),
      ),
    );
  }
}
