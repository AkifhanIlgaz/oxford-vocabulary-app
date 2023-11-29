import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import "package:hive_flutter/hive_flutter.dart";
import 'package:oxford_vocabulary_app/firebase_options.dart';
import 'package:oxford_vocabulary_app/models/myUser.dart';
import 'package:oxford_vocabulary_app/screens/home.dart';
import 'package:oxford_vocabulary_app/screens/splash.dart';
import 'package:oxford_vocabulary_app/services/firebase/firebase.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';
import 'package:oxford_vocabulary_app/utilities/constants.dart';

late final FirebaseService firebaseService;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // HiveService().init(
  //   adapters: [MyUserAdapter()],
  // );

  await Hive.initFlutter();
  Hive.registerAdapter(MyUserAdapter());
  await Hive.openBox<MyUser>(userBoxName);

  firebaseService = FirebaseService();

  runApp(const VocabularyApp());
}

class VocabularyApp extends StatefulWidget {
  const VocabularyApp({super.key});

  @override
  State<VocabularyApp> createState() => _VocabularyAppState();
}

class _VocabularyAppState extends State<VocabularyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light().copyWith(
          primaryColor: const Color(0xffff4f18),
          scaffoldBackgroundColor: kBackgroundColor,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                return const HomeScreen();
              } else {
                return const SplashScreen();
              }
            }));
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
