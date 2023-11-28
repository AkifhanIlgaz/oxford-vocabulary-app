import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxford_vocabulary_app/product/language/language_items.dart';
import 'package:oxford_vocabulary_app/screens/signin.dart';
import 'package:oxford_vocabulary_app/screens/signup.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';
import 'package:oxford_vocabulary_app/widgets/circular_button_without_splash.dart';
import 'package:oxford_vocabulary_app/widgets/horizontal_line_with_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
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
            LanguageItems.splashTitle,
            textAlign: TextAlign.center,
            style: kLargeTextStyle,
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 15.0,
              left: 50.0,
              right: 50.0,
              bottom: 15.0,
            ),
            child: const Text(
              LanguageItems.splashSubTitle,
              textAlign: TextAlign.center,
              style: kSmallTextStyle,
            ),
          ),
          CircularButtonWithoutSplash(
            buttonText: LanguageItems.signInText,
            topMargin: 20,
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
          const HorizontalLineWithText(title: "or"),
          CircularButtonWithoutSplash(
            buttonText: LanguageItems.signUpText,
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
}
