import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/services/hive/hive.dart';
import 'package:oxford_vocabulary_app/widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBar(),
            TextButton(
              onPressed: () {
                HiveService().deleteUser();
              },
              child: const Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }
}
