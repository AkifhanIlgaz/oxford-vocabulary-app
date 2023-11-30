import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oxford_vocabulary_app/product/language/language_items.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';
import 'package:oxford_vocabulary_app/widgets/profile_avatar.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    super.key,
    this.isWhite = false,
    required this.appBarTitle,
    required this.openEndDrawer,
  }) : super(
          title: const Text(LanguageItems.appName),
          titleTextStyle:
              isWhite ? kAppBarStyle : kAppBarStyle.copyWith(color: kBlack),
          backgroundColor: kTransparent,
          automaticallyImplyLeading: false,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: openEndDrawer,
                child: const ProfileAvatar(size: kAppBarAvatarSize),
              ),
            ),
          ],
        );

  final bool isWhite;
  final String appBarTitle;
  final void Function() openEndDrawer;
}
