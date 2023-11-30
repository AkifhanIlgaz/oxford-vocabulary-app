import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/main.dart';
import 'package:oxford_vocabulary_app/product/icons/icons.dart';
import 'package:oxford_vocabulary_app/product/language/language_items.dart';
import 'package:oxford_vocabulary_app/product/navigation/navigator_manager.dart';
import 'package:oxford_vocabulary_app/screens/home.dart';

class DrawerItem {
  DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.color,
  });

  final IconData icon;
  final String title;
  final void Function() onTap;
  final Color? color;
}

class SettingsItems with NavigatorManager {
  SettingsItems(this.context);

  final BuildContext context;

  List<DrawerItem> get settingsItems {
    return [
      DrawerItem(
        icon: ProjectIcons.like,
        title: LanguageItems.drawerLiked,
        onTap: () {
          navigateTo(context, HomeScreen());
        },
      ),
      DrawerItem(
        icon: ProjectIcons.translate,
        title: LanguageItems.drawerLanguages,
        onTap: () {},
      ),
      DrawerItem(
        icon: ProjectIcons.info,
        title: LanguageItems.drawerAbout,
        onTap: () {},
      ),
      DrawerItem(
        icon: ProjectIcons.license,
        title: LanguageItems.drawerLicenses,
        onTap: () {},
      ),
      DrawerItem(
        icon: ProjectIcons.signOut,
        color: const Color.fromARGB(255, 160, 29, 20),
        title: LanguageItems.signOutText,
        onTap: () => firebaseService.signOut(context),
      ),
    ];
  }
}
