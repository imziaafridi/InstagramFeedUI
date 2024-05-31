import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_feed_ui/const/app_paint.dart';
import 'package:instagram_feed_ui/util/insta_feed_lists.dart';
import 'pages/view/instafeed/parts/custom_listview_builder.dart';
import 'pages/view/instafeed/parts/insta_post_image.dart';
import 'pages/view/instafeed/parts/post_list_tile_insta_feed.dart';
import 'util/widgets/custom_circle_avatar.dart';
import 'util/widgets/custom_dotted_image.dart';
import 'util/widgets/custom_text.dart';

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
      home: const InstagramFeed(),
    );
  }
}

class InstagramFeed extends StatelessWidget {
  const InstagramFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const CustomImage(
            assetImg: "assets/images/Instagram Logo.png",
          ),
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
              height: 20,
            ),
            const CustomListViewBuilder(),
            const SizedBox(
              height: 20,
            ),
            const PostListTileInstaFeed(
              leadImg: 'assets/images/profile-05.jpg',
              title: "Joshua_L",
              subTitle: "Tokyo, Japan",
              trailImg: "assets/icons/Shape.png",
            ),
            const InstaPost(),
            Container(
              height: 150,
              width: 100,
              color: AppPaint.BLACK,
            ),
          ],
        ),
      ),
    );
  }
}

class InstaPost extends StatelessWidget {
  const InstaPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          ListView.builder(
            itemCount: instaPostImageList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var image = instaPostImageList[index];
              return SizedBox(
                width: 400,
                child: InstaPostImage(
                  img: image.img,
                  bf: BoxFit.cover,
                ),
              );
            },
          ),
          Positioned(
            right: 6,
            top: 6,
            child: Container(
              decoration: BoxDecoration(
                color: AppPaint.GREY_LIGHT,
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: CustomText(title: '1/3'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.assetImg});

  final String assetImg;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetImg,
      // fit: BoxFit.contain,
      // height: 22,
    );
  }
}
