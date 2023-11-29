import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/screens/home.dart';
import 'package:oxford_vocabulary_app/screens/splash.dart';

void goHome(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (ctx) => const HomeScreen(),
    ),
  );
}

void goSplash(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (ctx) => const SplashScreen(),
    ),
  );
}
