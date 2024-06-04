import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_feed_ui/util/extensions.dart';
import 'package:instagram_feed_ui/util/widgets/custom_row.dart';
import 'package:instagram_feed_ui/util/widgets/custom_text.dart';
import 'user_avatar.dart';

class ReactionsFigures extends StatelessWidget {
  const ReactionsFigures({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRow(
      mainAlign: MainAxisAlignment.start,
      childern: [
        UserAvatar(
          img: 'assets/images/profile-06.jpg',
          h: 20.h,
          w: 20.w,
        ),
        6.pw,
        CustomText(
          title: 'Liked by',
          size: 14.sp,
        ),
        4.pw,
        CustomText(
          title: 'craig_love',
          fw: FontWeight.bold,
          size: 14.sp,
        ),
        4.pw,
        CustomText(
          title: 'and',
          size: 14.sp,
        ),
        4.pw,
        CustomText(
          title: '44,686',
          fw: FontWeight.bold,
          size: 14.sp,
        ),
        4.pw,
        CustomText(
          title: 'others',
          size: 14.sp,
        ),
      ],
    );
  }
}
