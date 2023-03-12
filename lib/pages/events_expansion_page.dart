import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vidyutrenz_app/constants/colors.dart';
import 'package:vidyutrenz_app/controller/event_selector_controller.dart';
import 'package:vidyutrenz_app/widgets/bullet_points.dart';
import 'package:url_launcher/url_launcher.dart';

class EventsExpansionPage extends StatelessWidget {
  final String title;
  final String desc;
  final String img;
  final List<String> rules;
  final List<String> coordinators;
  final String reg_url;
  final String whatsApp;
  EventsExpansionPage({
    Key? key,
    required this.title,
    required this.desc,
    required this.img,
    required this.rules,
    required this.coordinators,
    required this.reg_url,
    required this.whatsApp,
  }) : super(key: key);

  @override
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  final EventController eventController = Get.put(EventController());

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
          padding: const EdgeInsets.all(14),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //TITLE
            Text(
              title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            //DESCRIPTION
            Text(
              desc,
              style: TextStyle(
                fontSize: 14,
                color: colors.lightColor,
              ),
            ),
            SizedBox(
              height: 15,
            ),
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
              height: 15,
            ),

            Text(
              eventController.selected.value == 3
                  ? 'OUTCOMES'
                  : 'RULES & \nREGULATIONS',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            UnorderedList(rules),
            SizedBox(
              height: 15,
            ),
            Text(
              'COORDINATORS',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          Text(
                            "○  " + coordinators[0],
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              _makePhoneCall("+91" + coordinators[1]);
                            },
                            child: Text(
                              coordinators[1],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: [
                          Text(
                            "○  " + coordinators[2],
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              _makePhoneCall("+91" + coordinators[3]);
                            },
                            child: Text(
                              coordinators[3],
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Column(
                //   children: [
                //     Text(
                //       "JOIN",
                //       style: TextStyle(
                //         fontSize: 18,
                //         color: Colors.white,
                //         fontWeight: FontWeight.w400,
                //       ),
                //     ),
                //     InkWell(
                //       onTap: () {
                //         _launchURL(whatsApp);
                //       },
                //       child: Image.asset(
                //         "assets/whatsapp.png",
                //         width: 40,
                //         height: 40,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                _launchURL(reg_url);
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
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  _launchURL(String regurl) async {
    String url = regurl;
    if (await canLaunchUrlString(url)) {
      await launchUrlString(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
