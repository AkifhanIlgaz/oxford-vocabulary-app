import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:oxford_vocabulary_app/utilities/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: TextButton(
          onPressed: () async {
            FirebaseAuth.instance.signOut();
            await Hive.box(userBoxName).delete("user");
          },
          child: const Text("Log out"),
        ),
      ),
    );
  }
}
