import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oxford_vocabulary_app/main.dart';
import 'package:oxford_vocabulary_app/widgets/auth/buttons/submit.dart';
import 'package:oxford_vocabulary_app/widgets/auth/input/email.dart';
import 'package:oxford_vocabulary_app/widgets/auth/input/password.dart';
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
                  child: const HorizontalLineWithText(
                    title: "or",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: signInWithGoogle,
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.twitter,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _gap() => const SizedBox(height: 16);
}
