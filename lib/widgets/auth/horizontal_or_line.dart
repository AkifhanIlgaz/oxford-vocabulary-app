import 'package:flutter/material.dart';

class HorizontalOrLine extends StatelessWidget {
  const HorizontalOrLine({
    super.key,
    this.height = 10,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            height: 10,
            color: Colors.deepOrange,
            endIndent: 10,
            thickness: 1,
          ),
        ),
        Text(
          "Sign in with",
          style: TextStyle(color: Colors.blueGrey),
        ),
        Expanded(
          child: Divider(
            indent: 10,
            thickness: 1,
          ),
        )
      ],
    );
  }
}
