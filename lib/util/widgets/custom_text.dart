import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_feed_ui/const/app_paint.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.title, this.color});
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.lato(color: color ?? AppPaint.WHITE),
    );
  }
}
