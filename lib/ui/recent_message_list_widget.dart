import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:bosszp/ui/common/segement_widget.dart';
// import 'package:bosszp/model/appearance.dart';
import 'package:bosszp/ui/recent_message_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RecentMessageListWidget extends StatefulWidget {
  const RecentMessageListWidget({super.key});

  @override
  State<RecentMessageListWidget> createState() =>
      _RecentMessageListWidgetState();
}

class _RecentMessageListWidgetState extends State<RecentMessageListWidget> {
  ValueNotifier<int> selected = ValueNotifier(0);
  ValueNotifier<int> selected2 = ValueNotifier(0);
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
              child: SegementWdiget(
                selected: selected2,
                titles: ["聊天", "互动"],
                selectedStyle: TextStyle(
                    color: appear.titleColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w900),
                unselectedStyle: TextStyle(
                    color: appear.subTitleColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w900),
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
          prototypeItem: RecentMessageItemWidget(leading: leading),
          itemCount: 30,
          itemBuilder: (context, index) {
            return RecentMessageItemWidget(
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

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // final Appearance appearance = context.read();
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: leading, right: leading),
      height: maxExtent,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SegementWdiget(
            selected: selected,
            titles: ["全部", "我发起"],
            valueWillChange: (oldValue, newValue) {
              if (oldValue == newValue && newValue == 1) {
                print("repeated click click 2, show popView");
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 3, bottom: 3),
            child: ListenableBuilder(
              listenable: selected,
              builder: (context, child) {
                return selected.value == 0
                    ? Assets.images.bzGetInterviewPositionNormalIphone
                        .image(fit: BoxFit.cover)
                    : Assets.images.bzGetInterviewPositionSelectedIphone
                        .image(fit: BoxFit.cover);
              },
            ),
          )
        ],
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
