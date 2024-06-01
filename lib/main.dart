import 'package:flutter/cupertino.dart';
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
            InstaPost(
              images: instaPostImageList,
              indexImg: indexImg,
            ),
            const SizedBox(
              height: 10,
            ),
            // PostReactions(
            //   indexImg: indexImg,
            // ),
          ],
        ),
      ),
    );
  }
}

class PostReactions extends StatelessWidget {
  PostReactions({
    super.key,
    this.indexImg,
  });
  ValueNotifier<int>? indexImg;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppPaint.ORANGE,
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomImage(
            assetImg: 'assets/icons/Tab 4.png',
          ),
          const CustomImage(
            assetImg: 'assets/icons/chat.png',
            h: 26,
            color: AppPaint.WHITE,
          ),
          15.pw,
          const CustomImage(
            assetImg: 'assets/icons/Messanger.png',
          ),
          const Spacer(),
          ...List.generate(instaPostImageList.length, (int index) {
            return Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: index == indexImg!.value
                    ? AppPaint.BLUE
                    : AppPaint.GREY_LIGHT,
                shape: BoxShape.circle,
              ),
            );
          }),
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

extension pad on num {
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );
  SizedBox get pw => SizedBox(
        width: toDouble(),
      );
}

class InstaPost extends StatefulWidget {
  InstaPost({
    super.key,
    required this.images,
    this.indexImg, // List of image URLs or objects
  });
  ValueNotifier<int>? indexImg;
  final List<InstaPostImage> images;
  @override
  State<InstaPost> createState() => _InstaPostState();
}

class _InstaPostState extends State<InstaPost> {
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: widget.indexImg!.value);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Stack(
        fit: StackFit.loose,
        children: [
          _buildImageCarousel(widget.images),
          _buildPostIndicator(widget.images.length),
        ],
      ),
    );
  }

  Widget _buildImageCarousel(
    List<InstaPostImage> images,
  ) {
    return SizedBox(
      height: 320,
      child: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        onPageChanged: (value) {
          setState(() {
            widget.indexImg!.value = value;
            debugPrint('img-indx: ${widget.indexImg!.value}');
          });
        },
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final image = images[index];
          return Stack(
            fit: StackFit.expand,
            children: [
              InstaPostImage(
                img: image.img,
                bf: BoxFit.cover,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPostIndicator(
    int imageCount,
  ) {
    return Positioned(
      right: 6,
      top: 6,
      child: Container(
        decoration: BoxDecoration(
          color: AppPaint.GREY_LIGHT,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: CustomText(title: '${widget.indexImg!.value + 1}/$imageCount'),
        ),
      ),
    );
  }
}

// class InstaPost extends StatelessWidget {
//   const InstaPost({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         SizedBox(
//           height: 300,
//           child: PageView.builder(
//             itemCount: instaPostImageList.length,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               var image = instaPostImageList[index];
//               return InstaPostImage(
//                 img: image.img,
//                 bf: BoxFit.cover,
//                 // h: 300,
//               );
//             },
//           ),
//         ),
//         Positioned(
//           right: 6,
//           top: 6,
//           child: Container(
//             decoration: BoxDecoration(
//               color: AppPaint.GREY_LIGHT,
//               borderRadius: BorderRadius.circular(
//                 15,
//               ),
//             ),
//             child: const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
//               child: CustomText(title: '1/3'),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.assetImg,
    this.color,
    this.h,
  });

  final String assetImg;
  final Color? color;
  final double? h;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetImg,
      color: color,
      height: h,
    );
  }
}
