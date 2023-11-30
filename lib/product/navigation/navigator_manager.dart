import 'package:flutter/material.dart';

mixin NavigatorManager {
  void navigateToReplacement(BuildContext context, Widget to) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => to,
      ),
    );
  }

  void navigateTo(BuildContext context, Widget to) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => to,
      ),
    );
  }
}
