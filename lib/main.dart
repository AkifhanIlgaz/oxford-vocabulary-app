import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:oxford_vocabulary_app/firebase_options.dart';
import 'package:oxford_vocabulary_app/models/myUser.dart';
import 'package:oxford_vocabulary_app/screens/splash.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';
import "package:path_provider/path_provider.dart" as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.init((await path_provider.getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(MyUserAdapter());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.signOut();

  runApp(const VocabularyApp());
}

class VocabularyApp extends StatelessWidget {
  const VocabularyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xffff4f18),
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: const SplashScreen(),
    );
  }
}

class ProjectColors {
  static final mainColor = Colors.amber[900];
  static const AuthBaseColor = Colors.grey;
}

class ProjectPaddings {
  static const ScreenHorizontalPadding = EdgeInsets.symmetric(horizontal: 28);
}

class ProjectRadiuses {
  static const SnackBarRadius = const Radius.circular(20);
}
