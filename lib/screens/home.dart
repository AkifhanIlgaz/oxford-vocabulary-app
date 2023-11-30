import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/main.dart';
import 'package:oxford_vocabulary_app/product/language/language_items.dart';
import 'package:oxford_vocabulary_app/widgets/custom_drawer.dart';
import 'package:oxford_vocabulary_app/widgets/my_app_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(
        openEndDrawer: _openEndDrawer,
        appBarTitle: LanguageItems.appName,
      ),
      endDrawer: const CustomDrawer(),
      body: Column(
        children: [
          TextButton(
            onPressed: () => firebaseService.signOut(context),
            child: const Text(LanguageItems.signOutText),
          ),
        ],
      ),
    );
  }
}
