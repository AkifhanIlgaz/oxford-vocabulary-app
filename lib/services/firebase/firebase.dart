import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:oxford_vocabulary_app/firebase_options.dart';

class FirebaseService {
  late final FirebaseAuth auth;
  late final FirebaseFirestore firestore;

  void init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    auth = FirebaseAuth.instance;
    firestore = FirebaseFirestore.instance;
  }

  // TODO: Sign in, sign up, sign out
  // TODO: Add user to firestore
}
