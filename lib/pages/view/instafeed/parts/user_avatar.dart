import 'package:flutter/material.dart';
import 'package:instagram_feed_ui/const/app_paint.dart';

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
