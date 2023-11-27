import 'package:firebase_auth/firebase_auth.dart';
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

final _firebaseAuth = FirebaseAuth.instance;

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  var _email = "";
  var _password = "";

  final _signInText = "Sign In";
  final _signUpText = "Sign Up";

  void _onSubmit() async {
    _formKey.currentState?.validate();
    _formKey.currentState?.save();

    try {
      final userCredentials = await _firebaseAuth
          .createUserWithEmailAndPassword(email: _email, password: _password);
      print(userCredentials);
    } catch (error) {
      print(error);
    }
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
            AuthEmailInput(
              onSaved: (email) {
                setState(() {
                  _email = email;
                });
              },
            ),
            _gap(),
            AuthPasswordInput(
              onSaved: (password) {
                setState(() {
                  _password = password;
                });
              },
            ),
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: AuthSubmitButton(text: _signInText, onSubmit: _onSubmit),
            ),
            _gap(),
            const HorizontalOrLine(),
          ],
        ),
      ),
    );
  }

  SizedBox _gap() => const SizedBox(height: 16);
}
