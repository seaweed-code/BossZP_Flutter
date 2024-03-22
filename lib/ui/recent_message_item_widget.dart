import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RecentMessageItemWidget extends StatelessWidget {
  const RecentMessageItemWidget({super.key, this.leading = 15.0});
  final leading;
  @override
  Widget build(BuildContext context) {
    final appear = context.read<Appearance>();
    final avatarWidth = 50.0;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(leading, 15, leading, 15),
      child: Row(
        children: [
          ClipOval(
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
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: appear.titleColor),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "bibili-iOS工程师",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: appear.darkColor),
                      ),
                      Spacer(),
                      Text(
                        "15:09",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: appear.timeColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Text.rich(
                      TextSpan(text: "[已读] ", children: [
                        TextSpan(
                            text: "嗯，好的，收到了，稍后给给您回复消息，耐心等候一下哈",
                            style: TextStyle(color: appear.subTitleColor))
                      ]),
                      style: TextStyle(
                        color: appear.timeColor,
                        fontSize: 15,
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
