import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/product/language/errors/firebase_errors.dart';
import 'package:oxford_vocabulary_app/screens/home.dart';
import 'package:oxford_vocabulary_app/widgets/snackbar.dart';

class FirebaseService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // TODO: Sign in, sign up, sign out
  void signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // TODO: Add to firestore
      // TODO: Add to hive
      if (!context.mounted) {
        return;
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => const HomeScreen(),
        ),
      );
    } on FirebaseAuthException catch (error) {
      _showError(context, error.code);
    }
  }

  void _showError(BuildContext context, String errorCode) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
        content: firebaseErrors[errorCode] ?? "Unhandled error"));
  }
  // TODO: Add user to firestore
}
