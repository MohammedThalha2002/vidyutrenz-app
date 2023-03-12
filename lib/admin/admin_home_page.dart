import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vidyutrenz_app/constants/colors.dart';
import 'package:vidyutrenz_app/controller/event_selector_controller.dart';
import 'package:vidyutrenz_app/widgets/adminPagedesicionmaker.dart';
import 'package:vidyutrenz_app/widgets/titles.dart';
import '../controller/admin_page_controller.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colors.bgColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: colors.lightColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(
                img: 'assets/signin.png',
                title: 'ADMIN PANEL',
                desc: 'Manage the data',
                color: Color(0xFFFF56868),
              ),
              SizedBox(
                height: 20,
              ),
              AdminPageSelector(),
              Obx(
                () => AdminPageDesicionMaker(size),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminPageSelector extends StatelessWidget {
  AdminPageSelector({Key? key}) : super(key: key);
  final AdminPageController eventController = Get.put(AdminPageController());
  final EventsAnimationController eventAnimationController =
      Get.put(EventsAnimationController());

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GestureDetector(
          onTap: () {
            eventController.changing(1);
            eventAnimationController.animate();
            print(eventController.selected.value);
          },
          child: Obx(
            () => Container(
              margin: EdgeInsets.only(top: 10),
              width: 60,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: eventController.selected.value == 1
                    ? colors.blueColor
                    : Colors.transparent,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Users",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {
            eventController.changing(2);
            eventAnimationController.animate();
            print(eventController.selected.value);
          },
          child: Obx(
            () => Container(
              margin: EdgeInsets.only(top: 10),
              width: 80,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: eventController.selected.value == 2
                    ? colors.blueColor
                    : Colors.transparent,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Procliams",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {
            eventController.changing(3);
            eventAnimationController.animate();
            print(eventController.selected.value);
          },
          child: Obx(
            () => Container(
              margin: EdgeInsets.only(top: 10),
              width: 85,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: eventController.selected.value == 3
                    ? colors.blueColor
                    : Colors.transparent,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Feedbacks",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
