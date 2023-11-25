import 'package:flutter/material.dart';

class AuthEmailInput extends StatelessWidget {
  const AuthEmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email_outlined),
        hintText: "Enter your email",
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
