import 'dart:convert';
import 'package:vidyutrenz_app/constants/credentials.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UnseenMsgController extends GetxController {
  var seenMsg = 0.obs;
  var NumberOfProcliamDocuments = 0.obs;
  var Unseen = 0.obs;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    findNoOfseenMsg();
  }

  // Getting the value of seen from each user
  Future findNoOfseenMsg() async {
    // Finding the number of seen msg

    Map<String, String> userUID = {"user": user!.uid};

    try {
      var url = Uri.parse("${cred.url}/seen-msg");
      var response = await http.post(
        url,
        body: jsonEncode(userUID),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      var seenMsgValue = jsonDecode(response.body);
      print(seenMsgValue);
      seenMsg.value = seenMsgValue.seenMsg;
      print("Number of seen messages = " + seenMsg.toString());
    } on Exception catch (e) {
      // TODO
      print(e);
    }
    NumberOfProclaimDocs();
  }

  Future NumberOfProclaimDocs() async {
    QuerySnapshot productCollection = await FirebaseFirestore.instance.collection('Proclaims').get();
    NumberOfProcliamDocuments.value = productCollection.size;
    print("Number of Procliam Documents " + NumberOfProcliamDocuments.value.toString());
    UnseenValue();
  }

  Future UnseenValue() async {
    // Number of unseen msg = Total number of msgs (in the proclaims) - seen value
    Unseen.value = await NumberOfProcliamDocuments.value - seenMsg.value;
    print("Unseen Value = " + Unseen.value.toString());
  }

  AssignTheValueOfSeenMsgToDocumentSize() async {
    Map<String, dynamic> data = {"user": user!.uid, "seenMsg": NumberOfProcliamDocuments.value};
    var url = Uri.parse('${cred.url}/update-seen-msg');
    var response = await http.post(
      url,
      body: jsonEncode(data),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
      },
    );
    seenMsg.value = NumberOfProcliamDocuments.value;
    findNoOfseenMsg();
  }
}
