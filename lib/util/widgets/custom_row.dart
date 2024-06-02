import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.childern,
    this.mainAlign,
    this.crossAlign,
    this.t1,
    this.t2,
  });
  final List<Widget> childern;
  final MainAxisAlignment? mainAlign;
  final CrossAxisAlignment? crossAlign;
  final String? t1;
  final String? t2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAlign ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAlign ?? CrossAxisAlignment.center,
      children: childern,
    );
  }
}
