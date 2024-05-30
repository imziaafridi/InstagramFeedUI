import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_feed_ui/const/app_paint.dart';
import 'package:instagram_feed_ui/util/insta_story_list.dart';

import 'util/widgets/custom_circle_avatar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          title: Image.asset(
            "assets/images/Instagram Logo.png",
            color: AppPaint.WHITE,
          ),
          leading: Image.asset('assets/icons/Camera Icon.png'),
          centerTitle: true,
          backgroundColor: AppPaint.BLACK,
          actions: [
            Stack(
              children: [
                Image.asset(
                  'assets/icons/icons8-igtv-50.png',
                  height: 30,
                  fit: BoxFit.fitHeight,
                ),
                Positioned(
                  top: 4,
                  right: 2.5,
                  child: Container(
                    width: 8.5,
                    height: 8.5,
                    decoration: const BoxDecoration(
                      color: AppPaint.RED,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: AppPaint.BLACK,
                            offset: Offset(0, 2),
                            blurRadius: .5,
                            spreadRadius: .5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Image.asset(
                'assets/icons/Messanger.png',
                fit: BoxFit.contain,
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
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppPaint.BLACK, width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile-05.jpg',
                    fit: BoxFit.cover,
                    // height: 40,
                  ),
                ),
              ),
              title: const CustomText(title: 'johnny'),
              subtitle: const CustomText(
                title: 'Tokyo, Japan',
                color: AppPaint.WHITE_LIGHT,
              ),
              trailing: Image.asset(
                'assets/icons/Shape.png',
                scale: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.title, this.color});
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.montserrat(color: color ?? AppPaint.WHITE),
    );
  }
}

class CustomOvalClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(
      0,
      0,
      size.width * 0.8, // adjust the width and height to your needs
      size.height * 0.8,
    );
  }

  @override
  bool shouldReclip(covariant CustomOvalClipper oldClipper) => false;
}

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
          InstaStory insta = storyInstagramList[index];
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

// today i wanna build instagram feed ui...
class InstaStory extends StatelessWidget {
  const InstaStory({
    super.key,
    required this.image,
    this.name,
    this.isLive = true,
  });
  final String image;
  final String? name;
  final bool? isLive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCircleAvatar(
          isLive: isLive!,
          child: const GradientCircleAvatar(
            radius: 30,
            assetImage: 'assets/images/profile-07.jpg',
          ),
        ),
        Text(name ?? 'imran khan'),
      ],
    );
  }
}

class GradientCircleAvatar extends StatelessWidget {
  final double radius; // Radius of the avatar
  final String assetImage; // Path to the asset image

  const GradientCircleAvatar({
    super.key,
    required this.radius,
    required this.assetImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.purple,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        child: FadeInImage(
          image: AssetImage(
            assetImage,
          ),
          // fadeInDuration: const Duration(microseconds: 500),
          placeholder: const AssetImage('assets/images/profile-05.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
