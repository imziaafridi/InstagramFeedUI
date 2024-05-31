import 'package:flutter/material.dart';
import 'package:instagram_feed_ui/const/app_paint.dart';
import 'package:instagram_feed_ui/util/widgets/custom_text.dart';

class PostListTileInstaFeed extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppPaint.BLACK, width: 2),
        ),
        child: ClipOval(
          child: Image.asset(
            leadImg,
            fit: BoxFit.cover,
            // height: 40,
          ),
        ),
      ),
      title: CustomText(title: title),
      subtitle: CustomText(
        title: subTitle ?? 'Tokyo, Japan',
        color: AppPaint.WHITE_LIGHT,
      ),
      trailing: Image.asset(
        trailImg,
        scale: 0.8,
      ),
    );
  }
}
