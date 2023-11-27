import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxford_vocabulary_app/configs/configs.dart';
import 'package:oxford_vocabulary_app/screens/signin.dart';
import 'package:oxford_vocabulary_app/screens/signup.dart';
import 'package:oxford_vocabulary_app/widgets/circular_button_without_splash.dart';
import 'package:oxford_vocabulary_app/widgets/horizontal_line_with_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: [
          const SizedBox(height: 100),
          Center(
            child: SvgPicture.asset(
              "assets/vectors/bookReading.svg",
              width: 300,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'Keep Track of All Your Vocabulary',
            textAlign: TextAlign.center,
            style: kLargeTextStyle,
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 15.0,
              left: 50.0,
              right: 50.0,
              bottom: 5.0,
            ),
            child: const Text(
              'Vocabulary is a matter of word building as well as word using',
              textAlign: TextAlign.center,
              style: kSmallTextStyle,
            ),
          ),
          CircularButtonWithoutSplash(
            buttonText: 'Sign In',
            topMargin: 60,
            filled: true,
            fillColorInHex: kPrimaryColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return const SigninScreen();
                  },
                ),
              );
            },
          ),
          CircularButtonWithoutSplash(
            buttonText: 'Sign Up',
            topMargin: 20,
            filled: false,
            fillColorInHex: kPrimaryColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return const SignupScreen();
                  },
                ),
              );
            },
          )
        ],
      )),
    );
  }

  Scaffold defaultScaffold(Size size, BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height / 3,
              child: Image.asset("assets/images/apple_with_book.png"),
            ),
            Text(
              "Welcome",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: size.width / 2,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (ctx) {
                              return const SigninScreen();
                            }),
                          );
                        },
                        child: const Text("Sign In"),
                      ),
                    ),
                    const HorizontalLineWithText(
                      title: "or",
                    ),
                    SizedBox(
                      width: size.width / 2,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (ctx) {
                              return const SignupScreen();
                            }),
                          );
                        },
                        child: const Text("Sign Up"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _gap() => const SizedBox(height: 10);
}
