import 'package:flutter/material.dart';
import 'package:instagram_feed_ui/const/app_paint.dart';
import 'package:instagram_feed_ui/main.dart';

class CustomCircleAvatar extends StatelessWidget {
  CustomCircleAvatar({
    super.key,
    required this.child,
    this.isLive = true,
  });
  Widget child;
  bool isLive;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 66,
      height: isLive ? 70 : 68,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            // width: 65,
            // height: 65,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppPaint.PINK,
                  AppPaint.ORANGE,
                  AppPaint.PURPLE,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(94, 158, 158, 158),
                  spreadRadius: 5,
                  blurRadius: 4,
                  offset: Offset(0, 0),
                ),
              ],
              // border: Border.all(width: 1.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.6),
              child: Container(
                // width: 100,
                // height: 100,
                decoration: BoxDecoration(
                  // color: AppPaint.BLACK,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppPaint.BLACK, width: 3.6),
                  // border: Border.all(width: 1.0),
                ),
                child: child,
              ),
            ),
          ),
          if (isLive)
            Positioned(
              top: 50,
              left: 15,
              right: 20,
              // bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(1),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppPaint.PINK_DARKER,
                  border: Border.all(color: AppPaint.BLACK, width: 2),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: const Text(
                  "LIVE",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppPaint.WHITE, fontSize: 10),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
