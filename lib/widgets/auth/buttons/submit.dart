import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/main.dart';

class AuthSubmitButton extends StatelessWidget {
  const AuthSubmitButton({
    super.key,
    required this.text,
    required this.onSubmit,
  });

  final void Function() onSubmit;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSubmit,
      style: ElevatedButton.styleFrom(
        backgroundColor: ProjectColors.mainColor,
        foregroundColor: Colors.white,
      ),
      child: Text(text),
    );
  }
}
