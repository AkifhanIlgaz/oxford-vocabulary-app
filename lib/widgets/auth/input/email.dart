import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/configs/configs.dart';

class AuthEmailInput extends StatefulWidget {
  const AuthEmailInput({
    super.key,
    required this.onSaved,
  });

  final void Function(String) onSaved;

  @override
  State<AuthEmailInput> createState() => _AuthEmailInputState();
}

class _AuthEmailInputState extends State<AuthEmailInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email_outlined),
        hintText: "Enter your email",
        fillColor: Colors.black,
        prefixIconColor: Color(kPrimaryColor),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (email) {
        if (email == null || email.trim().isEmpty) {
          return "Please enter an email.";
        }

        if (EmailValidator.validate(email) == false) {
          return "Please enter a valid email.";
        }

        return null;
      },
      onSaved: (value) {
        widget.onSaved(value!);
      },
    );
  }
}
