import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_feed_ui/const/app_paint.dart';
import 'package:instagram_feed_ui/pages/view/instafeed/parts/insta_story_it.dart';
import 'package:instagram_feed_ui/pages/view/instafeed/parts/user_avatar.dart';
import 'package:instagram_feed_ui/util/insta_feed_lists.dart';
import 'package:instagram_feed_ui/util/widgets/custom_circle_avatar.dart';

class CustomListViewBuilder extends StatelessWidget {
  const CustomListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      child: ListView.builder(
        itemCount: storyInstagramList.length,
        itemBuilder: (context, index) {
          InstaStoryItems insta = storyInstagramList[index];
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: Column(
              children: [
                CustomCircleAvatar(
                  isLive: insta.isLive!,
                  child: UserAvatar(
                    img: insta.image,
                    h: 65.h,
                    w: 65.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 2.0.h,
                  ),
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
