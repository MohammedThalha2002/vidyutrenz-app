import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/colors.dart';
import 'package:vidyutrenz_app/models/homeBoxModels.dart';
import 'package:vidyutrenz_app/pages/events.dart';
import 'package:vidyutrenz_app/pages/feedback.dart';
import 'package:vidyutrenz_app/pages/gallery.dart';
import 'package:vidyutrenz_app/pages/proclaims.dart';
import 'package:vidyutrenz_app/widgets/countdown.dart';
import 'package:vidyutrenz_app/widgets/eventBoxes.dart';
import '../widgets/drawerItems.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final advancedDrawerController = AdvancedDrawerController();
  void _handleMenuButtonPressed() {
    advancedDrawerController.showDrawer();
  }

  User? user = FirebaseAuth.instance.currentUser;
  late AnimationController _animationController;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    Timer(
      Duration(seconds: 1),
      () => _animationController.forward(),
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: (() async {
        SystemNavigator.pop();
        return false;
      }),
      child: SafeArea(
        child: AdvancedDrawer(
          backdropColor: colors.containerColor,
          controller: advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          // openScale: 1.0,
          disabledGestures: false,
          childDecoration: const BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Scaffold(
            key: _key,
            backgroundColor: colors.bgColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              toolbarHeight: 50,
              flexibleSpace: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _handleMenuButtonPressed();
                      },
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: colors.lightColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "V I D Y U T R E N Z",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: -0.8,
                        fontFamily: 'Voice',
                        fontSize: 28,
                      ),
                    ),
                    Spacer(),
                    SizedBox(width: 4),
                    CircleAvatar(
                      radius: 14,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          user!.photoURL!,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            user!.displayName!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/hi_emoji.png',
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    countdown(
                      size: size,
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    GridView.builder(
                      itemCount: HomeBoxLists.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 170,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 12,
                      ),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(0, 0.5 * index + 1),
                            end: Offset.zero,
                          ).animate(
                            CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.fastOutSlowIn,
                            ),
                          ),
                          child: FadeTransition(
                            opacity: _animationController,
                            child: EventBox(
                              size: size,
                              img: HomeBoxLists[index].img,
                              name: HomeBoxLists[index].name,
                              desc: HomeBoxLists[index].desc,
                              page: HomeBoxLists[index].page,
                              color: HomeBoxLists[index].color,
                              index: index,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          drawer: DrawerItems(
            advancedDrawerController: advancedDrawerController,
          ),
        ),
      ),
    );
  }
}
