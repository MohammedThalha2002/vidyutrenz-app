import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vidyutrenz_app/controller/unseen_msg_controller.dart';
import 'package:vidyutrenz_app/widgets/titles.dart';
import 'package:vidyutrenz_app/colors.dart';

class Proclaims extends StatefulWidget {
  const Proclaims({Key? key}) : super(key: key);

  @override
  State<Proclaims> createState() => _ProclaimsState();
}

class _ProclaimsState extends State<Proclaims> {
  final ProclaimsStream = FirebaseFirestore.instance
      .collection("Proclaims")
      .orderBy('date_time')
      .snapshots();
  UnseenMsgController unseenMsgController = Get.put(UnseenMsgController());
  @override
  void initState() {
    unseenMsgController.AssignTheValueOfSeenMsgToDocumentSize();
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TitleWidget(
              img: 'assets/proclaims_1.png',
              title: 'PROCLAIMS',
              desc: 'Stay tuned with the announcements',
              color: Color(0xFF9C68F5),
            ),
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream: ProclaimsStream,
              builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
                if (snapshot.data!.docs.length == 0) {
                  return Center(
                    child: Text('No announcements left'),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: ((context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return messageModel(
                      size: size,
                      date_time: data['date_time'],
                      msg: data['msg'],
                      link: data['link'] != null ? data['link'] : '',
                    );
                  }),
                );
              }),
            ),
          ]),
        ),
      ),
    );
  }
}

class messageModel extends StatelessWidget {
  final Size size;
  final String date_time;
  final String msg;
  final String link;
  const messageModel({
    Key? key,
    required this.size,
    required this.date_time,
    required this.msg,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Image.asset('assets/logo.png'),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    date_time,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                msg,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              link != ''
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            _launchURL(link);
                          },
                          child: Text(
                            link,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
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
