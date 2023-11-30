import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';

class DrawerSettingsItem extends StatelessWidget {
  const DrawerSettingsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Icon(
            icon,
            color: kWhite,
          ),
          const SizedBox(width: 30),
          Text(
            title,
            style: kLargeTextStyle.copyWith(
              color: kWhite,
            ),
          )
        ],
      ),
    );
  }
}
