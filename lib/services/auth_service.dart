import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  String? email;
  String? password;
  String? userName;
  Future<bool?> userSignUp({
    required String email,
    required String password,
    required String UserName,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        userCredential.user!.sendEmailVerification();
      }
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("User registered successfully"),
          backgroundColor: Colors.green,
        ),
      );
      return true;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }
  Future<bool?> userSignIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        userCredential.user!.sendEmailVerification();
      }
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("User signed in successfully"),
          backgroundColor: Colors.green,
        ),
      );
      return true;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }
  Future<bool?> userLogOut({
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("User logged out successfully"),
          backgroundColor: Colors.green,
        ),
      );
      return true;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }
}