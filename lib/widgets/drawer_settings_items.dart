import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';

class DrawerSettingsItem extends StatelessWidget {
  const DrawerSettingsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.color,
  });

  final IconData icon;
  final String title;
  final Color? color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: color ?? kWhite,
          ),
          const SizedBox(width: 30),
          Text(
            title,
            style: kLargeTextStyle.copyWith(
              color: color ?? kWhite,
            ),
          )
        ],
      ),
    );
  }
}
