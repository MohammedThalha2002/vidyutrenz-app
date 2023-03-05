import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vidyutrenz_app/auth/google_sign_in.dart';
import 'package:vidyutrenz_app/backend/user_details_upload.dart';
import 'package:vidyutrenz_app/colors.dart';
import 'package:get/get.dart';
import 'package:vidyutrenz_app/pages/homepage.dart';
import 'package:vidyutrenz_app/widgets/custom_textfields.dart';
import 'package:vidyutrenz_app/widgets/drop_down.dart';
import 'package:vidyutrenz_app/widgets/titles.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController clgController = TextEditingController();
  TextEditingController depController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWidget(
                    img: 'assets/signin.png',
                    title: 'SIGN IN',
                    desc: 'Sign in to continue',
                    color: Color(0xFFFF56868),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: clgController,
                    keyboardType: TextInputType.name,
                    title: "COLLEGE NAME",
                    hintText: "Enter Your college name here",
                  ),
                  CustomTextField(
                    controller: depController,
                    keyboardType: TextInputType.name,
                    title: "DEPARTMENT",
                    hintText: "Enter Your department here",
                  ),
                  // DropdownForYearSelection(),
                  CustomTextField(
                    controller: yearController,
                    keyboardType: TextInputType.number,
                    title: "YEAR OF STUDY",
                    hintText: "Enter Your current year here",
                  ),
                  CustomTextField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    title: "PHONE NUMBER",
                    hintText: "Enter Your phone number here",
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (clgController.text.isNotEmpty &&
                      depController.text.isNotEmpty &&
                      yearController.text.isNotEmpty &&
                      phoneController.text.isNotEmpty) {
                    try {
                      signInWithGoogle().then((value) async {
                        if (value != null) {
                          int statusCode =
                              await UploadUserDetails(userDetails: {
                            "name": value.user!.displayName,
                            "email": value.user!.email,
                            "phone": int.parse(phoneController.text),
                            "collage": clgController.text,
                            "department": depController.text,
                            "year": yearController.text,
                            "seenMsg": 0,
                          });
                          if (statusCode == 200) {
                            Get.to(
                              HomePage(),
                              transition: Transition.native,
                              duration: Duration(milliseconds: 600),
                            );
                          } else {
                            Get.snackbar(
                              "Error",
                              "Failed to save. Please try again",
                              snackPosition: SnackPosition.TOP,
                              colorText: Colors.white,
                              backgroundColor: Colors.redAccent,
                            );
                          }
                        } else {
                          Get.snackbar(
                            "Error",
                            "Someting went wrong. Please try again",
                            snackPosition: SnackPosition.TOP,
                            colorText: Colors.white,
                            backgroundColor: Colors.redAccent,
                          );
                        }
                      });
                    } on Exception catch (e) {
                      // TODO
                      print("someting went wrong");
                    }
                  } else {
                    print("enter all fields");
                    Get.snackbar(
                      "Error",
                      "Please Enter all the fields",
                      snackPosition: SnackPosition.TOP,
                      colorText: Colors.white,
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.redAccent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(4, 4), // changes position of shadow
                        ),
                      ]),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
