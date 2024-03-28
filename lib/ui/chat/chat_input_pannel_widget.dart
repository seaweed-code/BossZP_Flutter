import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:bosszp/model/chat_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ChatInputPannelWidget extends StatefulWidget {
  const ChatInputPannelWidget({
    super.key,
    required this.inputController,
  });

  final TextEditingController inputController;

  @override
  State<ChatInputPannelWidget> createState() => _ChatInputPannelWidgetState();
}

enum _SelectIndex {
  none,
  lang,
  texting,
  emoji,
  more,
}

class _ChatInputPannelWidgetState extends State<ChatInputPannelWidget> {
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
              onSubmitted: (content) {
                final chatList = context.read<ChatListModel>();
                final text = content.trim();

                if (text.isNotEmpty) {
                  chatList.addRow(ChatRowTextModel(true, text));
                }

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
