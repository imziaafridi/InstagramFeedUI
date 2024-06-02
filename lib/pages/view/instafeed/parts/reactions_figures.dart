import 'package:flutter/material.dart';
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
        const UserAvatar(
          img: 'assets/images/profile-06.jpg',
          h: 25,
          w: 25,
        ),
        6.pw,
        const CustomText(
          title: 'Liked by',
        ),
        4.pw,
        const CustomText(
          title: 'craig_love',
          fw: FontWeight.bold,
        ),
        4.pw,
        const CustomText(title: 'and'),
        4.pw,
        const CustomText(
          title: '44,686',
          fw: FontWeight.bold,
        ),
        4.pw,
        const CustomText(title: 'others'),
      ],
    );
  }
}
