import 'package:flutter/cupertino.dart';
import 'package:instagram_feed_ui/pages/view/instafeed/parts/insta_story_it.dart';

import '../pages/view/instafeed/parts/insta_post_image.dart';

List<InstaStoryItems> storyInstagramList = [
  const InstaStoryItems(
    image: "assets/images/profile-05.jpg",
    name: "your story",
    isLive: false,
  ),
  const InstaStoryItems(
    image: "assets/images/profile-01.jpg",
    name: "Zara",
    isLive: true,
  ),
  const InstaStoryItems(
    image: "assets/images/profile-07.jpg",
    name: "OmarOwl",
    isLive: false,
  ),
  const InstaStoryItems(
    image: "assets/images/profile-02.jpg",
    name: "Ayesha",
    isLive: true,
  ),
  const InstaStoryItems(
    image: "assets/images/profile-06.jpg",
    name: "johson",
    isLive: false,
  ),
  const InstaStoryItems(
    image: "assets/images/profile-03.jpg",
    name: "HanaHalo",
    isLive: true,
  ),
];

List<InstaPostImage> instaPostImageList = [
  const InstaPostImage(
    img: 'assets/images/Rectangle.png',
  ),
  const InstaPostImage(
    img: 'assets/images/post-02.jpg',
  ),
  const InstaPostImage(
    img: 'assets/images/post-04.jpg',
  ),
];
