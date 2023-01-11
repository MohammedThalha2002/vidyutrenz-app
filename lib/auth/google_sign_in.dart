import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vidyutrenz_app/pages/welcome_page.dart';

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  Get.dialog(
    Center(
      child: CircularProgressIndicator(),
    ),
    barrierColor: Colors.transparent,
    transitionDuration: Duration(seconds: 1),
    barrierDismissible: false,
  );
  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
  print("before the credentials");
  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<void> signOutFromGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signOut();
  await FirebaseAuth.instance.signOut().whenComplete(
        () => Get.to(
          WelcomePage(),
          transition: Transition.native,
          duration: Duration(milliseconds: 800),
        ),
      );
}
