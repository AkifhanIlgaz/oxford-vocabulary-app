import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/main.dart';

class HorizontalOrLine extends StatelessWidget {
  const HorizontalOrLine({
    super.key,
    this.height = 10,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Row(
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
          "Sign in with",
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
    );
  }
}
