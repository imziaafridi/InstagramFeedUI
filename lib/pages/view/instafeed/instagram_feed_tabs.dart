import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../const/app_paint.dart';
import '../../../util/insta_feed_lists.dart';
import '../../../util/widgets/b_nav_bar/custom_B_nav_bar.dart';
import '../../../util/widgets/b_nav_bar/custom_n_bar_items.dart';

class InstagramFeedTabs extends StatefulWidget {
  const InstagramFeedTabs({super.key});

  @override
  State<InstagramFeedTabs> createState() => _InstagramFeedTabsState();
}

class _InstagramFeedTabsState extends State<InstagramFeedTabs> {
  ValueNotifier<int> currentTab = ValueNotifier<int>(0);

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPaint.BLACK,
      bottomNavigationBar: Container(
        color: AppPaint.BLACK,
        child: CustomBNavBar(
          items: [
            CustomNavBarItem(
              icon: currentTab.value == 0
                  ? Icons.home_filled
                  : Icons.home_outlined,
            ),
            CustomNavBarItem(
              icon: currentTab.value == 1
                  ? CupertinoIcons.search_circle_fill
                  : CupertinoIcons.search,
            ),
            CustomNavBarItem(
              icon: currentTab.value == 2
                  ? CupertinoIcons.plus_rectangle_fill
                  : CupertinoIcons.plus_rectangle,
            ),
            CustomNavBarItem(
              icon: currentTab.value == 3
                  ? Icons.favorite
                  : Icons.favorite_outline,
            ),
            const CustomNavBarItem(
              img: 'assets/images/profile-05.jpg',
            ),
          ],
          currentIndex: currentTab.value,
          onTap: (v) {
            setState(
              () {
                currentTab.value = v;
              },
            );
          },
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: currentTab,
        builder: (context, value, _) {
          return tabs[value];
        },
      ),
    );
  }
}
