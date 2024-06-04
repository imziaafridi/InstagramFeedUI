// ignore_for_file: must_be_immutable

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
      width: 68,
      height: isLive ? 70 : 68,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
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
                  spreadRadius: 2.5,
                  blurRadius: 30,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.6),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppPaint.BLACK,
                    width: 4.0,
                  ),
                ),
                child: child,
              ),
            ),
          ),
          if (isLive)
            Positioned(
              top: 52,
              left: 15,
              right: 20,
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
