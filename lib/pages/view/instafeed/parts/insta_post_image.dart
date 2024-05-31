import 'package:flutter/material.dart';

class InstaPostImage extends StatelessWidget {
  const InstaPostImage({
    super.key,
    required this.img,
    this.w,
    this.h,
    this.bf,
  });
  final String img;
  final double? w;
  final double? h;
  final BoxFit? bf;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      img,
      fit: bf ?? BoxFit.cover,
      width: w,
      height: h,
    );
  }
}
