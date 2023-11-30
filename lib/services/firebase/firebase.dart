import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oxford_vocabulary_app/main.dart';
import 'package:oxford_vocabulary_app/models/myUser.dart';
import 'package:oxford_vocabulary_app/product/language/errors/firebase_errors.dart';
import 'package:oxford_vocabulary_app/product/navigation/navigator_manager.dart';
import 'package:oxford_vocabulary_app/screens/home.dart';
import 'package:oxford_vocabulary_app/screens/splash.dart';
import 'package:oxford_vocabulary_app/widgets/snackbar.dart';

class FirebaseService with NavigatorManager {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String get usersCollection => "users";

  void signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final userInfo = (await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      var user = MyUser(
        uid: userInfo?.uid,
        email: email,
        displayName: userInfo?.displayName,
        photoUrl: userInfo?.photoURL,
      );

      hiveService.storeUser(user);

      if (!context.mounted) {
        return;
      }

      navigateToReplacement(context, HomeScreen());
    } on FirebaseAuthException catch (error) {
      _showError(context, error.code);
    }
  }

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCredentials =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final userInfo = userCredentials.user;
    var user = MyUser(
      email: userInfo?.email,
      displayName: userInfo?.displayName,
      photoUrl: userInfo?.photoURL,
    );

    if (userCredentials.additionalUserInfo!.isNewUser) {
      await firestore
          .collection(usersCollection)
          .doc(userInfo?.uid)
          .set(user.toJson());
    }

    user.uid = userInfo?.uid;

    hiveService.storeUser(user);
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

      navigateToReplacement(context, HomeScreen());
    } on FirebaseAuthException catch (error) {
      _showError(context, error.code);
    }
  }

  void signOut(BuildContext context) async {
    await GoogleSignIn().signOut();
    await auth.signOut();
    hiveService.deleteUser();

    if (!context.mounted) {
      return;
    }

    navigateToReplacement(context, const SplashScreen());
  }

  void _showError(BuildContext context, String errorCode) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
        content: firebaseErrors[errorCode] ?? "Unhandled error"));
  }
}
