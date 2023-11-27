import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/widgets/horizontal_line_with_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                        onPressed: () {},
                        child: const Text("Sign In"),
                      ),
                    ),
                    const HorizontalOrLine(
                      title: "or",
                    ),
                    SizedBox(
                      width: size.width / 2,
                      child: ElevatedButton(
                        onPressed: () {},
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
