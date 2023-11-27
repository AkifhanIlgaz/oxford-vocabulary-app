import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxford_vocabulary_app/configs/configs.dart';
import 'package:oxford_vocabulary_app/main.dart';
import 'package:oxford_vocabulary_app/widgets/auth/input/email.dart';
import 'package:oxford_vocabulary_app/widgets/auth/input/password.dart';
import 'package:oxford_vocabulary_app/widgets/circular_button_without_splash.dart';
import 'package:oxford_vocabulary_app/widgets/snackbar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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

  void onSubmit() async {
    _formKey.currentState!.validate();
    _formKey.currentState!.save();

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      var snackBarContent = "";

      if (e.code == "email-already-in-use") {
        snackBarContent = "Email is already used by another user.";
      } else if (e.code == "invalid-email") {
        snackBarContent = "Email is invalid.";
      }

      if (!mounted) {
        return;
      }
      if (snackBarContent.isNotEmpty) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context)
            .showSnackBar(CustomSnackBar(content: snackBarContent));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: ProjectPaddings.ScreenHorizontalPadding,
            child: Column(
              children: [
                SizedBox(
                  width: size.width,
                  child: SvgPicture.asset("assets/vectors/signUp.svg"),
                ),
                AuthEmailInput(
                  onSaved: onEmailSaved,
                ),
                _gap(),
                AuthPasswordInput(
                  onSaved: onPasswordSaved,
                ),
                _gap(),
                AuthPasswordInput(
                  onSaved: onPasswordSaved,
                ),
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
                  ],
                ),
                CircularButtonWithoutSplash(
                  buttonText: "Sign Up",
                  topMargin: 10,
                  filled: true,
                  fillColorInHex: kPrimaryColor,
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _gap() => const SizedBox(height: 16);
}
