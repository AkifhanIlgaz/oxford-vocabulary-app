import 'package:flutter/material.dart';

class LineSeparator extends StatelessWidget {
  const LineSeparator({
    super.key,
    required this.padding,
    required this.color,
  });

  final double padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: Divider(
        color: color,
      ),
    );
  }
}
