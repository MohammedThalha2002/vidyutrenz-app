import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future UploadUserDetails({required Map<String, dynamic> userDetails}) async {
  User? user = FirebaseAuth.instance.currentUser;
  await FirebaseFirestore.instance
      .collection("UserDetails")
      .doc(user!.uid)
      .set(userDetails);
}
