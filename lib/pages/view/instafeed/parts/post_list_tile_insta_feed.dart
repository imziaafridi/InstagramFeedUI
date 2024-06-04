import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_feed_ui/const/app_paint.dart';
import 'package:instagram_feed_ui/util/extensions.dart';
import 'package:instagram_feed_ui/util/widgets/custom_image.dart';
import 'package:instagram_feed_ui/util/widgets/custom_text.dart';

class PostListTileInstaFeed extends StatefulWidget {
  const PostListTileInstaFeed({
    super.key,
    required this.leadImg,
    required this.title,
    this.subTitle,
    required this.trailImg,
  });
  final String leadImg;
  final String title;
  final String? subTitle;
  final String trailImg;

  @override
  State<PostListTileInstaFeed> createState() => _PostListTileInstaFeedState();
}

class _PostListTileInstaFeedState extends State<PostListTileInstaFeed>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: ListTile(
        leading: Container(
          width: 30.w,
          height: 30.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppPaint.BLACK, width: 2),
          ),
          child: ClipOval(
            child: Image.asset(
              widget.leadImg,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Row(
          children: [
            CustomText(title: widget.title),
            4.w.pw,
            const CustomImage(
              assetImg: 'assets/icons/verified.png',
              w: 15,
            ),
          ],
        ),
        subtitle: CustomText(
          title: widget.subTitle ?? 'Tokyo, Japan',
          color: AppPaint.WHITE_LIGHT,
        ),
        trailing: Image.asset(
          widget.trailImg,
          scale: 0.8.sp,
        ),
      ),
    );
  }
}
