import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/configs/configs.dart';

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
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              height: 10,
              color: Color(kPrimaryColor),
              endIndent: 10,
              thickness: 1,
            ),
          ),
          Text("or",
              style: TextStyle(
                color: Colors.blueGrey,
              )),
          Expanded(
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
