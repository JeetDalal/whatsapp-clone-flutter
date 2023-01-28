import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/home.dart';

class AuthServices {
  final user = FirebaseAuth.instance;

  //Logging the user in
  loginUser(String email, String password, BuildContext context) async {
    await user
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
          (value) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          ),
        );
  }

  registerUser(
      String email, String password, String name, BuildContext context) async {
    await user
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(value.user!.uid)
          .set({
        'name': name,
        'email': email,
      }).then((value) => Navigator.of(context).pop());
    });
  }
}
