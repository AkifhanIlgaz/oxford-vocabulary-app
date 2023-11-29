import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/main.dart';
import 'package:oxford_vocabulary_app/product/image/image_items.dart';
import 'package:oxford_vocabulary_app/product/language/language_items.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LanguageItems.appName,
            style: kAppBarStyle,
          ),
          ProfileAvatar(),
        ],
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundImage: hiveService.photoUrl == null
          ? const AssetImage(ImageItems.defaultProfileAvatar)
          : NetworkImage(hiveService.photoUrl!) as ImageProvider,
      backgroundColor: Colors.transparent,
    );
  }
}
