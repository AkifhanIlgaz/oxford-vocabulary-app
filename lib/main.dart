import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import "package:hive_flutter/hive_flutter.dart";
import 'package:oxford_vocabulary_app/firebase_options.dart';
import 'package:oxford_vocabulary_app/models/myUser.dart';
import 'package:oxford_vocabulary_app/screens/home.dart';
import 'package:oxford_vocabulary_app/screens/splash.dart';
import 'package:oxford_vocabulary_app/services/firebase/firebase.dart';
import 'package:oxford_vocabulary_app/services/hive/hive.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';
import 'package:oxford_vocabulary_app/utilities/constants.dart';

late final FirebaseService firebaseService;
late final HiveService hiveService;

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
  hiveService = HiveService();

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
      home: firebaseService.auth.currentUser == null
          ? const SplashScreen()
          : HomeScreen(),
    );
  }
}
