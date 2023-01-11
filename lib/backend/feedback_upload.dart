import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future UploadFeedback({required Map<String, dynamic> feedback}) async {
  User? user = FirebaseAuth.instance.currentUser;
  await FirebaseFirestore.instance.collection("Feedbacks").add(feedback);
}
