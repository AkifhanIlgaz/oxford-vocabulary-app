import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class AuthEmailInput extends StatefulWidget {
  const AuthEmailInput({super.key});

  @override
  State<AuthEmailInput> createState() => _AuthEmailInputState();
}

class _AuthEmailInputState extends State<AuthEmailInput> {
  var _isValid = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined),
        hintText: "Enter your email",
        fillColor: Colors.black,
        suffixIcon: _isValid ? const Icon(Icons.check) : null,
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (email) {
        if (email == null) {
          return "Please enter an email.";
        }

        if (EmailValidator.validate(email) == false) {
          return "Please enter a valid email.";
        }

        setState(() {
          _isValid = true;
        });
        return null;
      },
    );
  }
}
