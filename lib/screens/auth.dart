import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/widgets/signin_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SignInForm(),
      ),
    );
  }
}

class ProjectPaddings {
  static const ScreenHorizontalPadding = EdgeInsets.symmetric(horizontal: 28);
}

class ProjectColors {
  static const AuthBaseColor = Colors.grey;
}
