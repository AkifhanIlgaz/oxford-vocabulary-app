import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/main.dart';
import 'package:oxford_vocabulary_app/product/image/image_items.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      // TODO: Listen photoUrl
      backgroundImage: hiveService.photoUrl == null
          ? const AssetImage(ImageItems.defaultProfileAvatar)
          : NetworkImage(hiveService.photoUrl!) as ImageProvider,
      backgroundColor: Colors.transparent,
    );
  }
}
