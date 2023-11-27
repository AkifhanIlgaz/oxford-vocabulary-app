import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/firebase_options.dart';
import 'package:oxford_vocabulary_app/screens/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
