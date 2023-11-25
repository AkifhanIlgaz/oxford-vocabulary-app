import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/widgets/auth/buttons/submit.dart';
import 'package:oxford_vocabulary_app/widgets/auth/horizontal_or_line.dart';
import 'package:oxford_vocabulary_app/widgets/auth/input/email.dart';
import 'package:oxford_vocabulary_app/widgets/auth/input/password.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  final _signInText = "Sign In";
  final _signUpText = "Sign Up";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height / 3,
              child: Image.asset("assets/images/apple_with_book.png"),
            ),
            const AuthEmailInput(),
            SizedBox(height: 10),
            const AuthPasswordInput(),
            SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Already have an account?"),
                Text("Forgot password?"),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: AuthSubmitButton(text: _signInText, onSubmit: () {}),
            ),
            HorizontalOrLine(),
          ],
        ),
      ),
    );
  }
}
