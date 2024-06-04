import 'package:flutter/material.dart';
import 'package:instagram_feed_ui/const/app_paint.dart';
import 'package:instagram_feed_ui/pages/view/instafeed/parts/user_avatar.dart';
import 'custom_n_bar_items.dart';

class CustomBNavBar extends StatelessWidget {
  final List<CustomNavBarItem> items;
  final int currentIndex;
  final Function(int) onTap;

  const CustomBNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.black, // Adjust color as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          return InkWell(
            onTap: () => onTap(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (items[index].icon != null)
                  Icon(
                    items[index].icon,
                    color: currentIndex == index
                        ? Colors.white
                        : Colors.white, // Adjust colors as needed
                  ),
                if (items[index].img != null)
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: currentIndex == index
                            ? AppPaint.WHITE
                            : AppPaint.BLACK,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: UserAvatar(img: items[index].img!),
                  ),
                if (items[index].label != null)
                  Text(
                    items[index].label!,
                    style: TextStyle(
                      color: currentIndex == index
                          ? Colors.blue
                          : Colors.grey, // Adjust colors as needed
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
