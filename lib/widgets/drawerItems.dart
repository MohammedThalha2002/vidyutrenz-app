import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vidyutrenz_app/admin/admin_home_page.dart';
import 'package:vidyutrenz_app/auth/google_sign_in.dart';
import 'package:vidyutrenz_app/pages/about_page.dart';
import 'package:vidyutrenz_app/pages/events.dart';
import 'package:vidyutrenz_app/pages/gallery.dart';
import 'package:vidyutrenz_app/pages/homepage.dart';
import 'package:vidyutrenz_app/pages/proclaims.dart';
import 'package:vidyutrenz_app/pages/welcome_page.dart';
import 'package:vidyutrenz_app/constants/colors.dart';

class DrawerItems extends StatefulWidget {
  final AdvancedDrawerController advancedDrawerController;
  DrawerItems({Key? key, required this.advancedDrawerController}) : super(key: key);

  @override
  State<DrawerItems> createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  User? user = FirebaseAuth.instance.currentUser;

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    widget.advancedDrawerController.hideDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 70,
              ),
              SizedBox(
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.network(
                    user!.photoURL!,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ListTile(
                onTap: () {
                  _handleMenuButtonPressed();
                },
                leading: Icon(
                  FontAwesomeIcons.house,
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.to(
                    Events(),
                    transition: Transition.native,
                    duration: Duration(milliseconds: 600),
                  );
                },
                leading: Icon(
                  FontAwesomeIcons.calendarDays,
                  color: Colors.white,
                ),
                title: Text(
                  'EVENTS',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.to(
                    Gallery(),
                    transition: Transition.native,
                    duration: Duration(milliseconds: 600),
                  );
                },
                leading: Icon(
                  FontAwesomeIcons.image,
                  color: Colors.white,
                ),
                title: Text(
                  'Gallery',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.to(
                    Proclaims(),
                    transition: Transition.native,
                    duration: Duration(milliseconds: 600),
                  );
                },
                leading: Icon(
                  FontAwesomeIcons.bullhorn,
                  color: Colors.white,
                ),
                title: Text(
                  'Proclaims',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.to(
                    AboutPage(),
                    transition: Transition.native,
                    duration: Duration(milliseconds: 600),
                  );
                },
                leading: Icon(
                  FontAwesomeIcons.schoolFlag,
                  color: Colors.white,
                ),
                title: Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              // ListTile(
              //   onTap: () {
              //     Get.to(
              //       AdminHomePage(),
              //       transition: Transition.native,
              //       duration: Duration(milliseconds: 600),
              //     );
              //   },
              //   leading: Icon(
              //     FontAwesomeIcons.person,
              //     color: Colors.white,
              //   ),
              //   title: Text(
              //     'Admin',
              //     style: TextStyle(
              //       fontSize: 22,
              //     ),
              //   ),
              // ),
              ListTile(
                onTap: () {
                  showDialogToLogout();
                },
                leading: Icon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              Spacer(),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDialogToLogout() {
    Get.defaultDialog(
      title: "",
      middleText: "Are you sure?",
      middleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: colors.containerColor,
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
        ),
        onPressed: () {
          signOutFromGoogle();
        },
        child: Text("YES"),
      ),
      cancel: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
        ),
        onPressed: () {
          Get.back();
        },
        child: Text("NO"),
      ),
    );
  }
}
