import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:bosszp/model/chat_list_model.dart';
import 'package:bosszp/ui/chat/chat_input_pannel_widget.dart';
import 'package:bosszp/ui/chat/chat_row_text_widget.dart';
import 'package:bosszp/ui/chat/chat_setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatDetailWidget extends StatelessWidget {
  ChatDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appear = context.read<Appearance>();

    final inputController = TextEditingController();
    return Provider(
      create: (context) {
        final list = ChatListModel()
          ..datas.add(ChatRowTimeModel("此Boss正在急招该职位，系统自动为您匹配该职位，若感兴趣可以直接投递"))
          ..datas.add(ChatRowTextModel(false, "看了您的经历感觉很合适，方便发一份简历过来吗？"))
          ..datas.add(ChatRowTextModel(true, "好的，稍等一下"))
          ..datas.add(ChatRowTextModel(false, "OK，我等你"));
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
                  child: Builder(builder: (context) {
                    final datas = context.read<ChatListModel>();
                    return AnimatedList(
                      controller: datas.scrollController,
                      key: datas.listKey,
                      initialItemCount: datas.datas.length,
                      itemBuilder: (context, index, animation) {
                        return SizeTransition(
                          sizeFactor: animation,
                          child: datas.datas[index].builderRow(),
                        );
                      },
                    );
                  }),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                child: ChatInputPannelWidget(inputController: inputController),
              )
            ],
          )),
        ),
      ),
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
