import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_feed_ui/const/app_paint.dart';

class CommentTextInstaFeed extends StatelessWidget {
  const CommentTextInstaFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          _customTextStyleBuilderForTxtSpan(
            text: 'Joshua_L\t',
            fwT: FontWeight.bold,
            sT: 14.sp,
          ),
          _customTextStyleBuilderForTxtSpan(
            text: 'The game in Japan wa amazing and i want to\n',
            sT: 14.sp,
          ),
          _customTextStyleBuilderForTxtSpan(
            text: 'share some photos',
            sT: 14,
          ),
        ],
      ),
    );
  }

  TextSpan _customTextStyleBuilderForTxtSpan({
    required String text,
    Color? colorT,
    FontWeight? fwT,
    double? sT,
  }) {
    return TextSpan(
      text: text,
      style: GoogleFonts.lato(
        color: colorT ?? AppPaint.WHITE,
        fontWeight: fwT ?? FontWeight.normal,
        fontSize: sT,
      ),
    );
  }
}
