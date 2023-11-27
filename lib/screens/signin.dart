import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/main.dart';
import 'package:oxford_vocabulary_app/widgets/auth/buttons/submit.dart';
import 'package:oxford_vocabulary_app/widgets/horizontal_line_with_text.dart';
import 'package:oxford_vocabulary_app/widgets/auth/input/email.dart';
import 'package:oxford_vocabulary_app/widgets/auth/input/password.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";

  void onEmailSaved(String email) {
    setState(() {
      _email = email;
    });
  }

  void onPasswordSaved(String password) {
    setState(() {
      _password = password;
    });
  }

  void onSubmit() {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: ProjectPaddings.ScreenHorizontalPadding,
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                height: size.height / 3,
                child: Image.asset("assets/images/apple_with_book.png"),
              ),
              AuthEmailInput(
                onSaved: onEmailSaved,
              ),
              _gap(),
              AuthPasswordInput(
                onSaved: onPasswordSaved,
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
                child: AuthSubmitButton(text: "Sign In", onSubmit: onSubmit),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const HorizontalOrLine(
                  title: "or",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _gap() => const SizedBox(height: 16);
}