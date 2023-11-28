import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';

class AuthPasswordInput extends StatefulWidget {
  const AuthPasswordInput({
    super.key,
    required this.onSaved,
    this.hintText = "Enter your password",
  });

  final void Function(String) onSaved;
  final String hintText;

  @override
  State<AuthPasswordInput> createState() => _AuthPasswordInputState();
}

class _AuthPasswordInputState extends State<AuthPasswordInput> {
  var _passwordObscure = true;

  void _togglePasswordVisibility() {
    setState(() {
      _passwordObscure = !_passwordObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock_outline_rounded),
            prefixIconColor: const Color(kPrimaryColor),
            hintText: widget.hintText,
            suffixIcon: IconButton(
              onPressed: _togglePasswordVisibility,
              icon: Icon(
                _passwordObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
          ),
          obscureText: _passwordObscure,
          keyboardType: TextInputType.text,
          validator: (password) {
            if (password == null || password.trim().isEmpty) {
              return "Please enter a password.";
            }

            if (password.trim().length < 6) {
              return "Password must be at least 6 characters long.";
            }

            return null;
          },
          onSaved: (value) {
            widget.onSaved(value!);
          },
          onChanged: (value) {
            widget.onSaved(value);
          },
        ),
      ],
    );
  }
}
