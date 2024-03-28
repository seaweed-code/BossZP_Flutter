import 'dart:ffi';

import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:bosszp/model/chat_list_model.dart';
import 'package:bosszp/ui/chat/chat_setting_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ChatDetailWidget extends StatelessWidget {
  const ChatDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appear = context.read<Appearance>();

    final inputController = TextEditingController();
    return ChangeNotifierProvider(
      create: (context) {
        final list = ChatListModel();
        list.datas.add(ChatRowTextModel(false, "看了您的经历感觉很合适，方便发一份简历过来吗？"));
        return list;
      },
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              color: Colors.white,
            ),
          ),
          actions: [
            // IconButton(
            //     onPressed: () {},
            //     icon: Assets.images.chatNavRightTagsIconIphone.image()),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ChatSettingWidget();
                    },
                  ));
                },
                icon: Assets.images.chatNavRightIconIphone.image())
          ],
          title: Center(
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "李响",
                      style: TextStyle(
                          color: appear.titleColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 8),
                    Assets.images.cbChatOnlineIphone
                        .image(height: 20, fit: BoxFit.fitHeight)
                  ],
                ),
                SizedBox(height: 3),
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
        ),
        body: Container(
          color: Colors.white,
          child: SafeArea(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _ButtonWidget(
                    icon: Assets.images.exchangePhoneHighlightIphone.image(),
                    text: "打电话",
                  ),
                  _ButtonWidget(
                    icon: Assets.images.exchangeWechatHighlightIphone.image(),
                    text: "换微信",
                  ),
                  _ButtonWidget(
                    icon: Assets.images.exchangeResumeHighlightIphone.image(),
                    text: "发简历",
                  ),
                  _ButtonWidget(
                    icon: Assets.images.bbChatExchangeItemNotFitAbleIphone
                        .image(),
                    text: "不感兴趣",
                  )
                ],
              ),
              Expanded(
                child: Container(
                  color: appear.backgroundColor,
                  child: _ListView(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                child: _InputPannel(inputController: inputController),
              )
            ],
          )),
        ),
      ),
    );
  }
}

class _InputPannel extends StatefulWidget {
  const _InputPannel({
    super.key,
    required this.inputController,
  });

  final TextEditingController inputController;

  @override
  State<_InputPannel> createState() => _InputPannelState();
}

enum _SelectIndex {
  none,
  lang,
  texting,
  emoji,
  more,
}

class _InputPannelState extends State<_InputPannel> {
  _SelectIndex select = _SelectIndex.none;
  FocusNode focus = FocusNode();

  void _onFocusChanged() {
    setState(() {
      if (focus.hasFocus) {
        select = _SelectIndex.texting;
      } else {
        select = _SelectIndex.none;
      }
    });
  }

  @override
  void initState() {
    focus.addListener(_onFocusChanged);
    super.initState();
  }

  @override
  void dispose() {
    focus.removeListener(_onFocusChanged);
    super.dispose();
  }

  void _changePannel(_SelectIndex index) {
    if (select == index) {
      focus.requestFocus();
    } else {
      setState(() {
        select = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                _changePannel(_SelectIndex.lang);
              },
              icon: ((select == _SelectIndex.none)
                      ? Assets.images.chatBottomCommonIconIphone
                      : (select == _SelectIndex.lang
                          ? Assets
                              .images.chatBottomGreenCommonKeyboardIconIphone
                          : Assets.images.chatBottomGreenCommonSmallIconIphone))
                  .image(),
            ),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              focusNode: focus,
              controller: widget.inputController,
              keyboardType: TextInputType.text,
              minLines: 1,
              maxLines: 5,
              onTapOutside: (event) {
                SystemChannels.textInput.invokeMethod('TextInput.hide');
              },
              onSubmitted: (value) {
                widget.inputController.clear();
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "新信息",
                  hintStyle: TextStyle(color: appear.timeColor)),
            )),
            const SizedBox(width: 10),
            IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                _changePannel(_SelectIndex.emoji);
              },
              icon: (select != _SelectIndex.emoji
                      ? Assets.images.chatKeyboardExpressionNormalIphone
                      : Assets.images.chatKeyboardInputIphone)
                  .image(),
            ),
            IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                _changePannel(_SelectIndex.more);
              },
              icon: (select != _SelectIndex.more
                      ? Assets.images.chatBottomMoreDefaultIconIphone
                      : Assets.images.chatBottomMoreCloseIconIphone)
                  .image(),
            )
          ],
        ),
        if (select == _SelectIndex.lang)
          _LangPannelWidget(
            didSelect: (_, title) {
              widget.inputController.text = title;
              focus.requestFocus();
            },
          ),
        if (select == _SelectIndex.emoji) _EmojiPannelWidget(),
        if (select == _SelectIndex.more) _MorePannelWidget()
      ],
    );
  }
}

typedef _LangPannelDidSelectCallBack = void Function(int index, String title);

class _LangPannelWidget extends StatelessWidget {
  _LangPannelWidget({super.key, this.didSelect});
  final List<String> datas = [
    "对不起，我觉得该职位不太适合我，祝您早日找到满意的工作人选",
    "我可以去贵公司面试吗？",
    "我可以把我的简历发给您看看吗？"
  ];
  final _LangPannelDidSelectCallBack? didSelect;
  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return SizedBox(
      height: 230,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: datas.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    didSelect?.call(index, datas[index]);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          datas[index],
                          style:
                              TextStyle(fontSize: 16, color: appear.titleColor),
                        ),
                      ),
                      SizedBox(
                          height: 1.5,
                          width: double.infinity,
                          child: ColoredBox(color: appear.lineColor))
                    ],
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}

class _EmojiPannelWidget extends StatelessWidget {
  const _EmojiPannelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return SizedBox(
      height: 280,
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                "全部表情",
                style: TextStyle(fontSize: 14, color: appear.titleColor),
              ),
            )),
            SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 1,
                  maxCrossAxisExtent: 25,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 25),
              itemCount: 100,
              itemBuilder: (context, index) {
                return Image.asset(
                    "assets/images/emoji/Expression__${index + 1}.png");
              },
            )
          ],
        ),
      ),
    );
  }
}

class _MorePannelWidget extends StatelessWidget {
  _MorePannelWidget({
    super.key,
  });
  final List<(String name, String icon)> datas = [
    ("图片", Assets.images.chatMorePhotoIconIphone.path),
    ("语音", Assets.images.chatMoreVoiceIconIphone.path),
    ("语音通话", Assets.images.chatMoreVoiceCallIconIphone.path),
    ("优先提醒", Assets.images.chatMoreOnlineRemindIconIphone.path),
  ];

  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 230,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: datas.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Image.asset(datas[index].$2),
                SizedBox(height: 6),
                Text(
                  datas[index].$1,
                  style: TextStyle(color: appear.titleColor, fontSize: 14),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatListModel>(
      builder: (context, list, child) => ListView.builder(
        itemCount: list.datas.length,
        itemBuilder: (context, index) {
          final m = list.datas[index];
          return m.builderRow();
        },
      ),
    );
  }
}

class ChatRowTextWidget extends StatelessWidget {
  const ChatRowTextWidget({
    super.key,
    required this.isSender,
    required this.text,
  });
  final bool isSender;
  final String text;
  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 15),
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          textDirection: isSender ? TextDirection.rtl : TextDirection.ltr,
          children: [
            ClipOval(
                child:
                    Assets.images.avatar2Iphone.image(width: 35, height: 35)),
            SizedBox(width: 5),
            ConstraintsTransformBox(
              constraintsTransform: (pCon) => BoxConstraints(
                minHeight: pCon.minHeight,
                maxHeight: pCon.maxHeight,
                minWidth: pCon.minWidth,
                maxWidth: constraints.maxWidth * 0.75,
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                      child: (isSender
                              ? Assets.images.bhChatBubbleBlueIphone
                              : Assets.images.bhChatBubbleWhiteLeftIphone)
                          .image(centerSlice: Rect.fromLTRB(15, 15, 25, 25))),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      text,
                      style: TextStyle(
                          color: isSender ? Colors.white : appear.titleColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({super.key, required this.text, required this.icon});

  final String text;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();

    return TextButton(
        onPressed: () {},
        child: Column(
          children: [
            icon,
            SizedBox(height: 4),
            Text(
              text,
              style: TextStyle(color: appear.titleColor, fontSize: 13),
            )
          ],
        ));
  }
}
