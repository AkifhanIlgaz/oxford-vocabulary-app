import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/models/drawer_items.dart';

const userBoxName = "userBox";

final List<DrawerItem> settingsItems = [
  DrawerItem(
    icon: Icons.favorite_outline_rounded,
    title: "Liked",
    onTap: () {},
  ),
  DrawerItem(
    icon: Icons.translate,
    title: "Languages",
    onTap: () {},
  ),
  DrawerItem(
    icon: Icons.info_outline_rounded,
    title: "About",
    onTap: () {},
  ),
  DrawerItem(
    icon: Icons.description_outlined,
    title: "Licenses",
    onTap: () {},
  ),
  DrawerItem(
    icon: Icons.logout_outlined,
    title: "Sign Out",
    onTap: () {},
  ),
];
