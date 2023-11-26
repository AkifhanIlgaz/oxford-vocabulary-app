import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/screens/auth.dart';

void main() {
  runApp(const VocabularyApp());
}

class VocabularyApp extends StatelessWidget {
  const VocabularyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: Colors.amber[900],
        ),
      ),
      home: const AuthScreen(),
    );
  }
}

class ProjectColors {
  static final mainColor = Colors.amber[900];
}
