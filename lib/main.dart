import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:oxford_vocabulary_app/models/myUser.dart';
import 'package:oxford_vocabulary_app/screens/splash.dart';
import 'package:oxford_vocabulary_app/services/firebase/firebase.dart';
import 'package:oxford_vocabulary_app/services/hive/hive.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';
import 'package:oxford_vocabulary_app/utilities/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HiveService().init(
    adapters: [MyUserAdapter()],
    boxes: [userBoxName],
  );
  FirebaseService().init();

  runApp(const VocabularyApp());
}

class VocabularyApp extends StatelessWidget {
  const VocabularyApp({super.key});

  void isLoggedIn() async {
    final userBox = await Hive.openBox<MyUser>("userBox");

    if (userBox.isEmpty) {
      print("empty");
    } else {
      final currentUser = userBox.get("user");

      print(currentUser!.uid);
      print(currentUser.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    isLoggedIn();

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
