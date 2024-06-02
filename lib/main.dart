import 'package:flutter/material.dart';
import 'package:instagram_feed_ui/const/app_paint.dart';
import 'package:instagram_feed_ui/util/extensions.dart';
import 'package:instagram_feed_ui/util/insta_feed_lists.dart';
import 'pages/view/instafeed/parts/comment_text_insta_feed.dart';
import 'pages/view/instafeed/parts/custom_listview_builder.dart';
import 'pages/view/instafeed/parts/insta_post.dart';
import 'pages/view/instafeed/parts/post_list_tile_insta_feed.dart';
import 'pages/view/instafeed/parts/post_reactions.dart';
import 'pages/view/instafeed/parts/reactions_figures.dart';
import 'util/widgets/custom_dotted_image.dart';
import 'util/widgets/custom_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' I N S T A G R A M - F E E D ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: InstagramFeed(),
    );
  }
}

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
          actions: const [
            CustomDottedImage(
              assetImage: 'assets/icons/icons8-igtv-50.png',
            ),
            SizedBox(
              width: 15,
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: CustomImage(
                assetImg: 'assets/icons/Messanger.png',
              ),
            ),
          ],
        ),
        backgroundColor: AppPaint.BLACK,
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const CustomListViewBuilder(),
            const SizedBox(
              height: 10,
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
                const SizedBox(
                  height: 10,
                ),
                Positioned(
                  bottom: 0,
                  left: -15,
                  right: -8,
                  child: PostReactions(
                    indexImg: indexImg,
                  ),
                ),
              ],
            ),
            const ReactionsFigures(),
            6.ph,
            const Align(
              alignment: Alignment.topLeft,
              child: CommentTextInstaFeed(),
            ),
          ],
        ),
      ),
    );
  }
}
