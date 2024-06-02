import 'dart:ffi';

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
                alignment: Alignment.topLeft, child: CommentTextInstaFeed()),
          ],
        ),
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.img,
    this.bf,
    this.h,
    this.w,
    this.bclr,
  });
  final String img;
  final BoxFit? bf;
  final double? h;
  final double? w;
  final Color? bclr;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w ?? 20,
      height: h ?? 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: bclr ?? AppPaint.BLACK,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          img,
          fit: bf ?? BoxFit.cover,
        ),
      ),
    );
  }
}

class CommentTextInstaFeed extends StatelessWidget {
  const CommentTextInstaFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          _customTextStyleBuilderForTxtSpan(
              text: 'Joshua_L\t', fwT: FontWeight.bold),
          _customTextStyleBuilderForTxtSpan(
            text: 'The game in Japan wa amazing and i want to\n',
          ),
          _customTextStyleBuilderForTxtSpan(
            text: 'share some photos',
          ),
        ],
      ),
    );
  }

  TextSpan _customTextStyleBuilderForTxtSpan({
    required String text,
    Color? colorT,
    FontWeight? fwT,
    double? sT,
  }) {
    return TextSpan(
      text: text,
      style: GoogleFonts.lato(
        color: colorT ?? AppPaint.WHITE,
        fontWeight: fwT ?? FontWeight.normal,
        fontSize: sT,
      ),
    );
  }
}

class ReactionsFigures extends StatelessWidget {
  const ReactionsFigures({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRow(
      mainAlign: MainAxisAlignment.start,
      childern: [
        const UserAvatar(
          img: 'assets/images/profile-06.jpg',
          h: 25,
          w: 25,
        ),
        6.pw,
        const CustomText(
          title: 'Liked by',
        ),
        4.pw,
        const CustomText(
          title: 'craig_love',
          fw: FontWeight.bold,
        ),
        4.pw,
        const CustomText(title: 'and'),
        4.pw,
        const CustomText(
          title: '44,686',
          fw: FontWeight.bold,
        ),
        4.pw,
        const CustomText(title: 'others'),
      ],
    );
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.childern,
    this.mainAlign,
    this.crossAlign,
    this.t1,
    this.t2,
  });
  final List<Widget> childern;
  final MainAxisAlignment? mainAlign;
  final CrossAxisAlignment? crossAlign;
  final String? t1;
  final String? t2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAlign ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAlign ?? CrossAxisAlignment.center,
      children: childern,
    );
  }
}

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

  // bool isValChecked(int index) {
  //   var imagesIndex = widget.indexImg!.value;
  //   debugPrint('imgIndex: $imagesIndex');
  //   setState(() {
  //     index = imagesIndex;
  //   });
  //   debugPrint('index: $index');
  //   return imagesIndex == index;
  // }
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
            fit: StackFit.loose,
            children: [
              InstaPostImage(
                img: image.img,
                bf: BoxFit.cover,
                w: double.infinity,
                h: 300,
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
    this.w,
  });

  final String assetImg;
  final Color? color;
  final double? h;
  final double? w;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetImg,
      color: color,
      height: h,
      width: w,
    );
  }
}
