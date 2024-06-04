import 'package:flutter/material.dart';
import 'package:instagram_feed_ui/util/widgets/custom_image.dart';

class GradientCircleAvatar extends StatelessWidget {
  final double radius; // Radius of the avatar
  final String assetImage; // Path to the asset image

  const GradientCircleAvatar({
    super.key,
    required this.radius,
    required this.assetImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [
      //       Colors.blue,
      //       Colors.purple,
      //     ],
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //   ),
      //   shape: BoxShape.circle,
      // ),
      child: ClipOval(
        child: CustomImage(
          assetImg: assetImage,
        ),
        //  FadeInImage(
        //   image:
        //   AssetImage(
        //     assetImage,
        //   ),
        //   // fadeInDuration: const Duration(microseconds: 500),
        //   placeholder: const AssetImage('assets/images/profile-05.jpg'),
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }
}
