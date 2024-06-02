// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:instagram_feed_ui/const/app_paint.dart';
import 'package:instagram_feed_ui/util/extensions.dart';
import 'package:instagram_feed_ui/util/insta_feed_lists.dart';
import 'package:instagram_feed_ui/util/widgets/custom_image.dart';

class PostReactions extends StatefulWidget {
  PostReactions({
    super.key,
    this.indexImg,
  });
  ValueNotifier<int>? indexImg;

  @override
  State<PostReactions> createState() => _PostReactionsState();
}

class _PostReactionsState extends State<PostReactions> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: AppPaint.ORANGE,
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: CustomImage(
              assetImg: 'assets/icons/Tab 4.png',
            ),
          ),

          const CustomImage(
            assetImg: 'assets/icons/Comment.png',
            h: 24,
            color: AppPaint.WHITE,
          ),
          20.pw,
          const CustomImage(
            assetImg: 'assets/icons/Messanger.png',
          ),
          // const Spacer(),
          70.pw,
          ...List.generate(instaPostImageList.length, (int index) {
            return ValueListenableBuilder<int>(
              valueListenable: widget.indexImg!,
              builder: (context, value, _) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 1.6),
                  decoration: BoxDecoration(
                    color: value == index ? AppPaint.BLUE : AppPaint.GREY_LIGHT,
                    shape: BoxShape.circle,
                  ),
                );
              },
            );
          }),
          // const Spacer(),
          const Spacer(),
          const CustomImage(
            assetImg: 'assets/icons/Save.png',
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
