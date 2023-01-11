import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  var selected = 1.obs;

  changing(int count) {
    selected.value = count;
  }
}

class EventsAnimationController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void animate() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
    Timer(
      Duration(milliseconds: 500),
      () => animationController.forward(),
    );
  }
}
