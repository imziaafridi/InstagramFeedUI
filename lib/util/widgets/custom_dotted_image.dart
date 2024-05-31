import 'package:flutter/material.dart';
import 'package:instagram_feed_ui/const/app_paint.dart';

class CustomDottedImage extends StatelessWidget {
  const CustomDottedImage({
    super.key,
    required this.assetImage,
  });
  final String assetImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          assetImage,
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
    );
  }
}
