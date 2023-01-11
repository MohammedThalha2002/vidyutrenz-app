import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

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
    var Usercollection = FirebaseFirestore.instance.collection('UserDetails');
    var UserdocSnapshot = await Usercollection.doc(user!.uid).get();

    Map<String, dynamic>? data = UserdocSnapshot.data();
    seenMsg.value = data?['seenMsg'];

    print("Number of seen messages = " + seenMsg.toString());
    NumberOfProclaimDocs();
  }

  Future NumberOfProclaimDocs() async {
    QuerySnapshot productCollection =
        await FirebaseFirestore.instance.collection('Proclaims').get();
    NumberOfProcliamDocuments.value = productCollection.size;
    print("Number of Procliam Documents " +
        NumberOfProcliamDocuments.value.toString());
    UnseenValue();
  }

  Future UnseenValue() async {
    // Number of unseen msg = Total number of msgs (in the proclaims) - seen value
    Unseen.value = await NumberOfProcliamDocuments.value - seenMsg.value;
    print("Unseen Value = " + Unseen.value.toString());
  }

  AssignTheValueOfSeenMsgToDocumentSize() {
    FirebaseFirestore.instance.collection("UserDetails").doc(user!.uid).update({
      "seenMsg": NumberOfProcliamDocuments.value,
    });
    seenMsg.value = NumberOfProcliamDocuments.value;
    findNoOfseenMsg();
  }
}
