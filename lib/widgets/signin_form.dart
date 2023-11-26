import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/main.dart';
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

  void _onSubmit() {
    _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height / 3,
              child: Image.asset("assets/images/apple_with_book.png"),
            ),
            const AuthEmailInput(),
            _gap(),
            const AuthPasswordInput(),
            _gap(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Already have an account ?",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: ProjectColors.mainColor,
                        ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot password ?",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: ProjectColors.mainColor,
                        ),
                  ),
                )
              ],
            ),
            _gap(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: AuthSubmitButton(text: _signInText, onSubmit: _onSubmit),
            ),
            const HorizontalOrLine(),
            _gap(),
          ],
        ),
      ),
    );
  }

  SizedBox _gap() => const SizedBox(height: 20);
}
