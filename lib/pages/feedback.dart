import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:vidyutrenz_app/backend/feedback_upload.dart';
import 'package:vidyutrenz_app/colors.dart';
import 'package:get/get.dart';
import 'package:vidyutrenz_app/pages/homepage.dart';
import 'package:vidyutrenz_app/widgets/titles.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  int _value = 0;
  bool isPlaying = false;
  TextEditingController feedbackController = TextEditingController();
  final ConfettiController confettiController = ConfettiController();
  @override
  void initState() {
    confettiController.addListener(() {
      isPlaying = confettiController.state == ConfettiControllerState.playing;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    confettiController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleWidget(
                  img: 'assets/feedback_1.png',
                  title: 'FEEDBACK',
                  desc: 'Throw your feedbacks here',
                  color: Color(0xFF68F56E),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "FEEDBACK FORM",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colors.containerColor,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colors.bgColor,
                    ),
                    child: TextField(
                      controller: feedbackController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      maxLines: 8,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type someting here..',
                        hintStyle: TextStyle(
                          color: colors.lightColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "💥 RATE OUR APP 💥",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Slider(
                  value: _value.toDouble(),
                  min: 0,
                  max: 100,
                  divisions: 100,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white,
                  onChanged: (double newValue) {
                    setState(() {
                      _value = newValue.round();
                    });
                  },
                ),
                Spacer(),
                GestureDetector(
                  onTap: () async {
                    if (feedbackController.text.isNotEmpty) {
                      confettiController.play();
                      Get.snackbar(
                        "😊😊😊",
                        "Thanks for your feedback",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.pinkAccent.withOpacity(0.2),
                        colorText: Colors.white,
                      );
                      UploadFeedback(feedback: {
                        "feeddback": feedbackController.text,
                        "rate": _value.toDouble(),
                      });
                      await Future.delayed(Duration(seconds: 2), () {
                        Get.to(
                          HomePage(),
                          transition: Transition.native,
                          duration: Duration(milliseconds: 600),
                        );
                      });
                    } else {
                      Get.snackbar(
                        "Error",
                        "Please throw your feedbacks here...",
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
                        color: colors.containerColor,
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
                        'SUBMIT',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: confettiController,
          shouldLoop: true,
          numberOfParticles: 40,
          blastDirectionality: BlastDirectionality.explosive,
        )
      ],
    );
  }
}
