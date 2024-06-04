// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_feed_ui/const/app_paint.dart';
import 'package:instagram_feed_ui/util/widgets/custom_text.dart';
import 'insta_post_image.dart';

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

class _InstaPostState extends State<InstaPost> with TickerProviderStateMixin {
  late PageController _pageController;
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.indexImg!.value);
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340.h,
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
      height: 310.h,
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
          return FadeTransition(
            opacity: _animation,
            child: InstaPostImage(
              img: image.img,
              bf: BoxFit.cover,
              w: double.infinity,
            ),
          );
        },
      ),
    );
  }

  Widget _buildPostIndicator(
    int imageCount,
  ) {
    return Positioned(
      right: 6.w,
      top: 6.h,
      child: Container(
        decoration: BoxDecoration(
          color: AppPaint.GREY_LIGHT,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
          child: CustomText(title: '${widget.indexImg!.value + 1}/$imageCount'),
        ),
      ),
    );
  }
}
