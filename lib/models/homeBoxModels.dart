import 'package:flutter/material.dart';
import 'package:vidyutrenz_app/pages/events.dart';
import 'package:vidyutrenz_app/pages/feedback.dart';
import 'package:vidyutrenz_app/pages/gallery.dart';
import 'package:vidyutrenz_app/pages/proclaims.dart';

class HomeBoxes {
  String img;
  String name;
  String desc;
  Widget page;
  Color color;

  HomeBoxes({
    required this.img,
    required this.name,
    required this.desc,
    required this.page,
    required this.color,
  });
}

List<HomeBoxes> HomeBoxLists = [
  HomeBoxes(
    img: "assets/confetti_1.png",
    name: 'EVENTS',
    desc: 'Explore our upcoming events',
    page: Events(),
    color: Color(0xFFF89194),
  ),
  HomeBoxes(
    img: "assets/gallery_1.png",
    name: 'GALLERY',
    desc: 'Our memorable moments',
    page: Gallery(),
    color: Color(0xFFFFC242),
  ),
  HomeBoxes(
    img: "assets/proclaims_1.png",
    name: 'PROCLAIMS',
    desc: 'Stay tuned with the announcements',
    page: Proclaims(),
    color: Color(0xFF68F56E),
  ),
  HomeBoxes(
    img: "assets/feedback_1.png",
    name: 'FEEDBACK',
    desc: 'Throw your feedbacks here',
    page: FeedBack(),
    color: Color(0xFF9C68F5),
  ),
];
