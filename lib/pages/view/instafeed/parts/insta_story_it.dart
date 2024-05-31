import 'package:flutter/cupertino.dart';
import 'package:instagram_feed_ui/util/widgets/custom_circle_avatar.dart';
import 'gradient_circle_avatar.dart';

class InstaStoryItems extends StatelessWidget {
  const InstaStoryItems({
    super.key,
    required this.image,
    this.name,
    this.isLive = true,
  });
  final String image;
  final String? name;
  final bool? isLive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCircleAvatar(
          isLive: isLive!,
          child: const GradientCircleAvatar(
            radius: 30,
            assetImage: 'assets/images/profile-07.jpg',
          ),
        ),
        Text(name ?? 'imran khan'),
      ],
    );
  }
}
