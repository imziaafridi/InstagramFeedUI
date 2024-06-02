import 'package:flutter/material.dart';

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
