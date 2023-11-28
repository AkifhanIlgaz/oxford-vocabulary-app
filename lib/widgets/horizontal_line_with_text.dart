import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';

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
          const Expanded(
            child: Divider(
              height: 10,
              color: Color(kPrimaryColor),
              endIndent: 10,
              thickness: 1,
            ),
          ),
          Text(title,
              style: const TextStyle(
                color: Colors.blueGrey,
              )),
          const Expanded(
            child: Divider(
              color: Color(kPrimaryColor),
              indent: 10,
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
