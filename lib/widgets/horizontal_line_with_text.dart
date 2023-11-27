import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/main.dart';

class HorizontalLineWithText extends StatelessWidget {
  const HorizontalLineWithText({
    super.key,
    this.height = 10,
    required this.title,
  });

  final double? height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              height: 10,
              color: ProjectColors.mainColor,
              endIndent: 10,
              thickness: 1,
            ),
          ),
          const Text(
            "or",
            style: TextStyle(color: Colors.blueGrey),
          ),
          Expanded(
            child: Divider(
              color: ProjectColors.mainColor,
              indent: 10,
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
