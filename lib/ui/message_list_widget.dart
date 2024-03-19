import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
// import 'package:bosszp/model/appearance.dart';
import 'package:bosszp/ui/message_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MessageListWidget extends StatefulWidget {
  const MessageListWidget({super.key});

  @override
  State<MessageListWidget> createState() => _MessageListWidgetState();
}

class _MessageListWidgetState extends State<MessageListWidget> {
  ValueNotifier<int> selected = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    final appear = context.read<Appearance>();
    const leading = 15.0;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
            leadingWidth: double.infinity,
            leading: Padding(
              padding: const EdgeInsets.only(left: leading),
              child: Row(
                children: [
                  Text(
                    "聊天",
                    style: TextStyle(
                        color: appear.titleColor,
                        fontSize: 34,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(width: 20),
                  Text("互动")
                ],
              ),
            ),
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
          delegate: _SliverHeaderDelegate(leading: leading, selected: selected),
          pinned: true,
          // floating: true,
        ),
        SliverPrototypeExtentList.builder(
          prototypeItem: MessageItemWidget(leading: leading),
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
  _SliverHeaderDelegate({required this.leading, required this.selected});
  final double leading;
  final ValueNotifier<int> selected;

  TextStyle _getStyle(BuildContext context, int index) {
    final Appearance appearance = context.read();
    if (index == selected.value) {
      return TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: appearance.titleColor);
    }
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: appearance.subTitleColor);
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // final Appearance appearance = context.read();
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: leading, right: leading),
      height: maxExtent,
      alignment: Alignment.center,
      child: ListenableBuilder(
        listenable: selected,
        builder: (context, _) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  selected.value = 0;
                },
                child: Text(
                  "全部",
                  style: _getStyle(context, 0),
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  selected.value = 1;
                },
                child: Text(
                  "我发起",
                  style: _getStyle(context, 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3, bottom: 3),
                child: selected.value == 0
                    ? Assets.images.bzGetInterviewPositionNormalIphone
                        .image(fit: BoxFit.cover)
                    : Assets.images.bzGetInterviewPositionSelectedIphone
                        .image(fit: BoxFit.cover),
              )
            ],
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
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
        padding: EdgeInsets.only(left: leading, right: leading, bottom: 10),
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
