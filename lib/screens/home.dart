import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/main.dart';
import 'package:oxford_vocabulary_app/product/language/language_items.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';
import 'package:oxford_vocabulary_app/widgets/my_app_bar.dart';
import 'package:oxford_vocabulary_app/widgets/profile_avatar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: MyAppBar(
          openEndDrawer: _openEndDrawer,
          appBarTitle: LanguageItems.appName,
        ),
        endDrawer: const Drawer(
          // width: MediaQuery.of(context).size.width / 1.5,
          backgroundColor: Colors.black,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileAvatar(
                size: kDrawerAvatarSize,
              ),
              Spacer()
            ],
          ),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () => firebaseService.signOut(context),
              child: const Text(LanguageItems.signOutText),
            ),
          ],
        ),
      ),
    );
  }
}
