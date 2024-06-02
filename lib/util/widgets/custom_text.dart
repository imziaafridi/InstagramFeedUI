import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_feed_ui/const/app_paint.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.title,
    this.color,
    this.fw,
    this.size,
  });
  final String title;
  final Color? color;
  final FontWeight? fw;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.visible,
      softWrap: true,
      style: GoogleFonts.lato(
        color: color ?? AppPaint.WHITE,
        fontWeight: fw ?? FontWeight.normal,
        fontSize: size ?? 14,
      ),
    );
  }
}
