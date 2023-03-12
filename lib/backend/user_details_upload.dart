import 'dart:convert';
import 'package:vidyutrenz_app/constants/credentials.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

Future<int> UploadUserDetails({required Map<String, dynamic> userDetails}) async {
  User? user = FirebaseAuth.instance.currentUser;
  userDetails['user'] = user!.uid;

  print(userDetails);

  try {
    var url = Uri.parse('${cred.url}/add_user');
    var response = await http.post(
      url,
      body: jsonEncode(userDetails),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
      },
    );
    return response.statusCode;
  } on Exception catch (e) {
    // TODO
    print("Something went wrong");
    print(e);
    return 500;
  }
}
