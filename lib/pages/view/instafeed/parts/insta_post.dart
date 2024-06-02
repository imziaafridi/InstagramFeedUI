// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
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

class _InstaPostState extends State<InstaPost> {
  late PageController _pageController;

  @override
  void initState() {
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
