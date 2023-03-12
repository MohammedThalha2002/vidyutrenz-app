import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vidyutrenz_app/constants/colors.dart';
import 'package:vidyutrenz_app/pages/signup_page.dart';
import 'homepage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: colors.bgColor,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(width: size.width),
                    Image.asset(
                      'assets/half _logo.png',
                      width: size.width * 0.9,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(
                          SignUp(),
                          transition: Transition.native,
                          duration: Duration(milliseconds: 600),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        width: size.width * 0.9,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.blue, boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: Offset(1, 2), // changes position of shadow
                          ),
                        ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/google_white.png',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "continue with Google",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(
                              SignUp(),
                              transition: Transition.native,
                              duration: Duration(milliseconds: 600),
                            );
                          },
                          child: Container(
                            width: size.width * 0.43,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: colors.lightColor,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Image.asset(
                              'assets/gmail.png',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(
                              SignUp(),
                              transition: Transition.native,
                              duration: Duration(milliseconds: 600),
                            );
                          },
                          child: Container(
                            // padding: EdgeInsets.all(12),
                            width: size.width * 0.43,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: colors.lightColor,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Image.asset('assets/apple_logo.png'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        "By continuing you agree our terms of services and privacy policies",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: colors.lightColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
