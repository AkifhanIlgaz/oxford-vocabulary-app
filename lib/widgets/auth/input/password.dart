import 'package:flutter/material.dart';

class AuthPasswordInput extends StatefulWidget {
  const AuthPasswordInput({super.key});

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
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock_outline_rounded),
        hintText: "Enter your password",
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
    );
  }
}
