import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/main.dart';
import 'package:oxford_vocabulary_app/product/image/image_items.dart';
import 'package:oxford_vocabulary_app/product/language/language_items.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.isTextWhite = false,
  });

  final bool isTextWhite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LanguageItems.appName,
            style: isTextWhite
                ? kAppBarStyle.copyWith(color: kWhite)
                : kAppBarStyle,
          ),
          const ProfileAvatar(),
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
      // TODO: Listen photoUrl
      backgroundImage: hiveService.photoUrl == null
          ? const AssetImage(ImageItems.defaultProfileAvatar)
          : NetworkImage(hiveService.photoUrl!) as ImageProvider,
      backgroundColor: Colors.transparent,
    );
  }
}
