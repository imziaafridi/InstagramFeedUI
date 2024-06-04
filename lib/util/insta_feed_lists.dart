import 'package:flutter/material.dart';
import '../pages/add_post.dart';
import '../pages/favourites.dart';
import '../pages/profile.dart';
import '../pages/search.dart';
import '../pages/view/instafeed/instagram_feed.dart';
import '../pages/view/instafeed/parts/insta_post_image.dart';
import '../pages/view/instafeed/parts/insta_story_it.dart';

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
    name: "Joshua_L",
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
    img: 'assets/images/post-05.jpg',
  ),
  const InstaPostImage(
    img: 'assets/images/post-02.jpg',
  ),
  const InstaPostImage(
    img: 'assets/images/post-04.jpg',
  ),
];

List<Widget> tabs = [
  InstagramFeed(),
  const Search(),
  const AddPost(),
  const Favourites(),
  const Profile(),
];
