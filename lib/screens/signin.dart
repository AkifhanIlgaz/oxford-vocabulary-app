import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oxford_vocabulary_app/configs/configs.dart';
import 'package:oxford_vocabulary_app/main.dart';
import 'package:oxford_vocabulary_app/widgets/auth/input/email.dart';
import 'package:oxford_vocabulary_app/widgets/auth/input/password.dart';
import 'package:oxford_vocabulary_app/widgets/circular_button_without_splash.dart';
import 'package:oxford_vocabulary_app/widgets/horizontal_line_with_text.dart';
import 'package:oxford_vocabulary_app/widgets/snackbar.dart';

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

  void onSubmit() async {
    _formKey.currentState!.validate();
    _formKey.currentState!.save();

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      var snackBarContent = "";

      if (e.code == "user-not-found") {
        snackBarContent = "User not found!";
      } else if (e.code == "wrong-password") {
        snackBarContent = "Wrong password!";
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

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCredentials =
        await FirebaseAuth.instance.signInWithCredential(credential);

    print(userCredentials);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: ProjectPaddings.ScreenHorizontalPadding,
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width,
                      child: SvgPicture.asset("assets/vectors/welcomeBack.svg"),
                    ),
                    AuthEmailInput(
                      onSaved: onEmailSaved,
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
                          child: const Text("Don't have an account ?",
                              style: kSmallTextStyle),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot password ?",
                            style: kSmallTextStyle,
                          ),
                        )
                      ],
                    ),
                    CircularButtonWithoutSplash(
                        buttonText: "Sign In",
                        topMargin: 10,
                        filled: true,
                        fillColorInHex: kPrimaryColor,
                        onTap: onSubmit),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const HorizontalLineWithText(
                        title: "or",
                      ),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            "assets/vectors/google.svg",
                            width: 24,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Sign in with Google",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _gap() => const SizedBox(height: 16);
}
