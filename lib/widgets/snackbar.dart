import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/main.dart';

SnackBar CustomSnackBar({
  required String content,
  Duration duration = const Duration(seconds: 3),
}) {
  return SnackBar(
    content: Text(content),
    backgroundColor: const Color.fromARGB(255, 134, 29, 22),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: ProjectRadiuses.SnackBarRadius,
      ),
    ),
    duration: duration,
  );
}
