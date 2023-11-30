import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/main.dart';
import 'package:oxford_vocabulary_app/product/language/language_items.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';
import 'package:oxford_vocabulary_app/utilities/constants.dart';
import 'package:oxford_vocabulary_app/widgets/drawer_settings_items.dart';
import 'package:oxford_vocabulary_app/widgets/line_separator.dart';
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
        endDrawer: Drawer(
          width: MediaQuery.of(context).size.width / 1.5,
          backgroundColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const ProfileAvatar(
                          size: kDrawerAvatarSize,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          hiveService.displayName ?? "Default",
                          style: kAppBarStyle.copyWith(
                            color: kWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (ctx, index) {
                        final item = settingsItems[index];
                        return DrawerSettingsItem(
                            icon: item.icon,
                            title: item.title,
                            onTap: item.onTap);
                      },
                      separatorBuilder: (context, index) => const LineSeparator(
                            padding: 12,
                            color: kWhite,
                          ),
                      itemCount: settingsItems.length),
                )
              ],
            ),
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
