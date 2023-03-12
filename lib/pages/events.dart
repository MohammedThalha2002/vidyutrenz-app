import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyutrenz_app/constants/colors.dart';
import 'package:vidyutrenz_app/controller/event_selector_controller.dart';
import 'package:vidyutrenz_app/models/eventsExpansionModels.dart';
import 'package:vidyutrenz_app/models/non_tech_events.dart';
import 'package:vidyutrenz_app/models/outdoor_games.dart';
import 'package:vidyutrenz_app/models/technical_events.dart';
import 'package:vidyutrenz_app/models/workshops.dart';
import 'package:vidyutrenz_app/pages/events_expansion_page.dart';
import 'package:vidyutrenz_app/widgets/titles.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> with TickerProviderStateMixin {
  //
  final EventsAnimationController eventAnimationController =
      Get.put(EventsAnimationController());
  //
  final EventController eventController = Get.put(EventController());
  //
  Widget eventChecker({required Size size}) {
    if (eventController.selected.value == 2) {
      // 2)  Non Technical events
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: NonTechnicalEvents.length,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0.5 * index + 1, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: eventAnimationController.animationController,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: FadeTransition(
              opacity: eventAnimationController.animationController,
              child: EventLists(
                size: size,
                img: NonTechnicalEvents[index].img,
                title: NonTechnicalEvents[index].title,
                desc: NonTechnicalEvents[index].desc,
                coord: NonTechnicalEvents[index].coordinators,
                rules: NonTechnicalEvents[index].rules,
                reg_url: NonTechnicalEvents[index].url,
                whatsApp: NonTechnicalEvents[index].whatsApp,
              ),
            ),
          );
        },
      );
    } else if (eventController.selected.value == 3) {
      // 3)  Workshops events
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: workshops.length,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0.5 * index + 1, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: eventAnimationController.animationController,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: FadeTransition(
              opacity: eventAnimationController.animationController,
              child: EventLists(
                size: size,
                img: workshops[index].img,
                title: workshops[index].title,
                desc: workshops[index].desc,
                coord: workshops[index].coordinators,
                rules: workshops[index].outcomes,
                reg_url: workshops[index].url,
                whatsApp: workshops[index].whatsApp,
              ),
            ),
          );
        },
      );
    } else if (eventController.selected.value == 4) {
      // 4)  Outdoor Events
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: OutdoorEvents.length,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0.5 * index + 1, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: eventAnimationController.animationController,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: FadeTransition(
              opacity: eventAnimationController.animationController,
              child: EventLists(
                size: size,
                img: OutdoorEvents[index].img,
                title: OutdoorEvents[index].title,
                desc: OutdoorEvents[index].desc,
                coord: OutdoorEvents[index].coordinators,
                rules: OutdoorEvents[index].rules,
                reg_url: OutdoorEvents[index].url,
                whatsApp: OutdoorEvents[index].whatsApp,
              ),
            ),
          );
        },
      );
    } else {
      // 1) Technical Events
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TechnicalEvents.length,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0.5 * index + 1, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: eventAnimationController.animationController,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: FadeTransition(
              opacity: eventAnimationController.animationController,
              child: EventLists(
                size: size,
                img: TechnicalEvents[index].img,
                title: TechnicalEvents[index].title,
                desc: TechnicalEvents[index].desc,
                coord: TechnicalEvents[index].coordinators,
                rules: TechnicalEvents[index].rules,
                reg_url: TechnicalEvents[index].url,
                whatsApp: TechnicalEvents[index].whatsApp,
              ),
            ),
          );
        },
      );
    }
  }

  @override
  void initState() {
    eventAnimationController.animate();
    // TODO: implement initState
    super.initState();
  }

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
                img: 'assets/confetti_1.png',
                title: 'EVENTS',
                desc: 'Explore our upcoming events',
                color: Color(0xFFF89194),
              ),
              SizedBox(
                height: 20,
              ),
              EventSelector(),
              SizedBox(
                height: 30,
              ),
              Obx(
                () => eventChecker(size: size),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EventSelector extends StatelessWidget {
  EventSelector({Key? key}) : super(key: key);
  final EventController eventController = Get.put(EventController());
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
                  "Tech",
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
                  "Non-Tech",
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
                  "Workshops",
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
            eventController.changing(4);
            eventAnimationController.animate();
            print(eventController.selected.value);
          },
          child: Obx(
            () => Container(
              margin: EdgeInsets.only(top: 10),
              width: 70,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: eventController.selected.value == 4
                    ? colors.blueColor
                    : Colors.transparent,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Outdoor",
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
    ;
  }
}

class EventLists extends StatelessWidget {
  final Size size;
  final String img;
  final String title;
  final String desc;
  final List<String> rules;
  final List<String> coord;
  final String reg_url;
  final String whatsApp;
  const EventLists({
    Key? key,
    required this.size,
    required this.img,
    required this.title,
    required this.desc,
    required this.rules,
    required this.coord,
    required this.reg_url,
    required this.whatsApp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          EventsExpansionPage(
            title: title,
            desc: desc,
            img: img,
            rules: rules,
            coordinators: coord,
            reg_url: reg_url,
            whatsApp: whatsApp,
          ),
          transition: Transition.native,
          duration: Duration(milliseconds: 600),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colors.containerColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(4, 4), // changes position of shadow
              ),
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Hero(
            tag: img,
            child: Container(
              width: size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  img,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  desc,
                  style: TextStyle(
                    fontSize: 12,
                    color: colors.lightColor,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    Get.to(
                      EventsExpansionPage(
                        title: title,
                        desc: desc,
                        img: img,
                        rules: rules,
                        coordinators: coord,
                        reg_url: reg_url,
                        whatsApp: whatsApp,
                      ),
                      transition: Transition.native,
                      duration: Duration(milliseconds: 600),
                    );
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
