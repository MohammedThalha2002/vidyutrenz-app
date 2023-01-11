import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyutrenz_app/colors.dart';
import 'package:vidyutrenz_app/controller/admin_page_controller.dart';
import 'package:vidyutrenz_app/pages/proclaims.dart';

final AdminPageController adminPageController = Get.put(AdminPageController());

Widget AdminPageDesicionMaker(Size size) {
  //Proclaims
  if (adminPageController.selected.value == 2) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Proclaims").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot data = snapshot.data!.docs[index];
            return messageModel(
              size: size,
              date_time: data['date_time'],
              msg: data['msg'],
              link: data['link'] != null ? data['link'] : '',
            );
          },
        );
      },
    );
  }
  //Feedbacks
  else if (adminPageController.selected.value == 3) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Feedbacks").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot data = snapshot.data!.docs[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              padding: EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: colors.containerColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text(
                    data['feeddback'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  
                  Text(
                    data['rate'].toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  
                ],
              ),
            );
          },
        );
      },
    );
  }
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection("UserDetails").snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return Text("Loading");
      }
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: snapshot.data!.docs.length,
        itemBuilder: (context, index) {
          DocumentSnapshot data = snapshot.data!.docs[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            padding: EdgeInsets.all(12),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: colors.containerColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['name'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data['collage'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  data['department'] + " , " + data['year'] + " Year",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  data['email'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  data['phone'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
