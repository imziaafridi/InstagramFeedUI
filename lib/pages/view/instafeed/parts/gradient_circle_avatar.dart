import 'package:flutter/material.dart';

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
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.purple,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        child: FadeInImage(
          image: AssetImage(
            assetImage,
          ),
          // fadeInDuration: const Duration(microseconds: 500),
          placeholder: const AssetImage('assets/images/profile-05.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
