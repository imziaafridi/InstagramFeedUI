// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_feed_ui/const/app_paint.dart';
import 'package:instagram_feed_ui/util/extensions.dart';
import 'package:instagram_feed_ui/util/insta_feed_lists.dart';
import 'package:instagram_feed_ui/util/widgets/custom_dotted_image.dart';
import 'package:instagram_feed_ui/util/widgets/custom_image.dart';
import 'parts/comment_text_insta_feed.dart';
import 'parts/custom_listview_builder.dart';
import 'parts/insta_post.dart';
import 'parts/post_list_tile_insta_feed.dart';
import 'parts/post_reactions.dart';
import 'parts/reactions_figures.dart';

class InstagramFeed extends StatelessWidget {
  InstagramFeed({super.key});

  var indexImg = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const CustomImage(
            assetImg: "assets/images/Instagram Logo.png",
          ),
          elevation: .0,
          leading: const CustomImage(
            assetImg: 'assets/icons/Camera Icon.png',
          ),
          centerTitle: true,
          backgroundColor: AppPaint.BLACK,
          actions: [
            const CustomDottedImage(
              assetImage: 'assets/icons/icons8-igtv-50.png',
            ),
            14.w.pw,
            Padding(
              padding: EdgeInsets.only(right: 10.0.h),
              child: const CustomImage(
                assetImg: 'assets/icons/Messanger.png',
              ),
            ),
          ],
        ),
        backgroundColor: AppPaint.BLACK,
        body: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            // stroy
            const CustomListViewBuilder(),
            SizedBox(
              height: 8.h,
            ),
            const PostListTileInstaFeed(
              leadImg: 'assets/images/profile-07.jpg',
              title: "Joshua_L",
              subTitle: "Tokyo, Japan",
              trailImg: "assets/icons/Shape.png",
            ),
            Stack(
              children: [
                InstaPost(
                  images: instaPostImageList,
                  indexImg: indexImg,
                ),
                Positioned(
                  bottom: -15.h,
                  left: -14.w,
                  right: -6.w,
                  child: PostReactions(
                    indexImg: indexImg,
                  ),
                ),
              ],
            ),
            10.h.ph,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: const ReactionsFigures(),
            ),
            8.h.ph,
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: const CommentTextInstaFeed(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
