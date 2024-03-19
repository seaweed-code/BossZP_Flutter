import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class MessageItemWidget extends StatelessWidget {
  const MessageItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appear = context.read<Appearance>();
    final avatarWidth = 50.0;
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(avatarWidth / 2),
            child: Assets.images.avatar3Iphone
                .image(width: avatarWidth, height: avatarWidth),
            // child: CachedNetworkImage(
            //   width: avatarWidth,
            //   height: avatarWidth,
            //   fit: BoxFit.cover,
            //   placeholder: (context, url) => const CircularProgressIndicator(),
            //   imageUrl:
            //       'https://k.sinaimg.cn/n/sinakd20117/192/w1696h1696/20240131/3dd7-94af50d27027ceae9ccc3d13760a2f7c.jpg/w700d1q75cms.jpg',
            // ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Text(
                        "李女士",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: appear.titleColor),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "bibili-HRM",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF969696)),
                      ),
                      Spacer(),
                      Text(
                        "15:09",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFFB8B8B8)),
                      ),
                      // SizedBox(width: 8)
                    ],
                  ),
                  SizedBox(height: 3),
                  Text.rich(
                      TextSpan(text: "[已读] ", children: [
                        TextSpan(
                            text: "嗯，好的，收到了，稍后给给您回复消息，耐心等候一下哈",
                            style: TextStyle(color: Color(0XFF636363)))
                      ]),
                      style: TextStyle(
                        color: Color(0xFFB8B8B8),
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
