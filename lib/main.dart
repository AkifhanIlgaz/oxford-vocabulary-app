import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:oxford_vocabulary_app/models/myUser.dart';
import 'package:oxford_vocabulary_app/screens/home.dart';
import 'package:oxford_vocabulary_app/screens/splash.dart';
import 'package:oxford_vocabulary_app/services/firebase/firebase.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';
import 'package:oxford_vocabulary_app/utilities/constants.dart';
import "package:path_provider/path_provider.dart" as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // HiveService().init(
  //   adapters: [MyUserAdapter()],
  // );

  Hive.init((await path_provider.getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(MyUserAdapter());
  await Hive.openBox(userBoxName);

  FirebaseService().init();

  runApp(const VocabularyApp());
}

class VocabularyApp extends StatefulWidget {
  const VocabularyApp({super.key});

  @override
  State<VocabularyApp> createState() => _VocabularyAppState();
}

class _VocabularyAppState extends State<VocabularyApp> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _isLoggedIn = Hive.box(userBoxName).isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light().copyWith(
          primaryColor: const Color(0xffff4f18),
          scaffoldBackgroundColor: kBackgroundColor,
        ),
        home: _isLoggedIn ? const HomeScreen() : const SplashScreen());
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
