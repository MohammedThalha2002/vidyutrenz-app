import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyutrenz_app/widgets/titles.dart';
import 'package:vidyutrenz_app/colors.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              img: 'assets/collage.png',
              title: 'ABOUT US',
              desc: 'About our collage',
              color: Color(0xFF383838),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "ABOUT OUR COLLEGE :",
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '''Chennai Institute of technology, the best engineering college in Chennai was established with the objective of providing quality technical education with adequate industrial exposure.The College has grown from strength to strength in the last 12 years and progressing towards Excellence in Engineering Education, Research and Development. 

           The motive of our institution is to transform lives through deployment of emerging technology, novelty and sustainability.CIT has strong links with many firms and organizations in private and public sectors. This partnership with industry is the reason for a successful career for each and every student in CIT. Our institution strives to create next generation leaders by effective teaching learning methodologies and instill scientific spark into them to meet the global challenges''',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "ABOUT VIDYUTRENZ :",
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '''"The royal road to man's heart is to achieve the one which he desires for" .  We, Department of Electronics and Communication Engineering are  organising the national level technical symposium "Vidyutrenz 2022" with exciting technical and non-technical events to achieve the right path .''',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
