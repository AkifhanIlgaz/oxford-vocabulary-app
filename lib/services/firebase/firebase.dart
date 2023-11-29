import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/main.dart';
import 'package:oxford_vocabulary_app/models/myUser.dart';
import 'package:oxford_vocabulary_app/product/language/errors/firebase_errors.dart';
import 'package:oxford_vocabulary_app/product/navigation/navigation.dart';
import 'package:oxford_vocabulary_app/widgets/snackbar.dart';

class FirebaseService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String get usersCollection => "users";

  void signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final userCredentials = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!context.mounted) {
        return;
      }
      goHome(context);
    } on FirebaseAuthException catch (error) {
      _showError(context, error.code);
    }
  }

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final userInfo = (await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      var user = MyUser(
        email: email,
        displayName: userInfo?.displayName,
        photoUrl: userInfo?.photoURL,
      );

      await firestore
          .collection(usersCollection)
          .doc(userInfo?.uid)
          .set(user.toJson());

      user.uid = userInfo?.uid;

      hiveService.storeUser(user);

      if (!context.mounted) {
        return;
      }

      goHome(context);
    } on FirebaseAuthException catch (error) {
      _showError(context, error.code);
    }
  }

  void signOut(BuildContext context) async {
    await auth.signOut();
    hiveService.deleteUser();

    if (!context.mounted) {
      return;
    }

    goSplash(context);
  }

  void _showError(BuildContext context, String errorCode) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
        content: firebaseErrors[errorCode] ?? "Unhandled error"));
  }
}
