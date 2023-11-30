import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/models/drawer_items.dart';
import 'package:oxford_vocabulary_app/product/icons/icons.dart';
import 'package:oxford_vocabulary_app/product/language/language_items.dart';

const userBoxName = "userBox";

final List<DrawerItem> settingsItems = [
  DrawerItem(
    icon: ProjectIcons.like,
    title: LanguageItems.drawerLiked,
    onTap: () {},
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
    onTap: () {},
  ),
];
