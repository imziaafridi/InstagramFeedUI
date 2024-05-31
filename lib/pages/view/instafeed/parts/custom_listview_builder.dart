import 'package:flutter/cupertino.dart';
import 'package:instagram_feed_ui/const/app_paint.dart';
import 'package:instagram_feed_ui/main.dart';
import 'package:instagram_feed_ui/pages/view/instafeed/parts/insta_story_it.dart';
import 'package:instagram_feed_ui/util/insta_feed_lists.dart';
import 'package:instagram_feed_ui/util/widgets/custom_circle_avatar.dart';

import 'gradient_circle_avatar.dart';

class CustomListViewBuilder extends StatelessWidget {
  const CustomListViewBuilder({
    super.key,
    // required this.child,
    // this.itemCount,
  });
  // final int? itemCount;
  // Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: storyInstagramList.length,
        itemBuilder: (context, index) {
          InstaStoryItems insta = storyInstagramList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                CustomCircleAvatar(
                  isLive: insta.isLive!,
                  child: GradientCircleAvatar(
                    radius: 30,
                    assetImage: insta.image,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    insta.name ?? "henna beker",
                    style: const TextStyle(color: AppPaint.WHITE),
                  ),
                ),
              ],
            ),
          );
        },
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
