import 'package:flutter/material.dart';

class CircularButtonWithoutSplash extends StatelessWidget {
  CircularButtonWithoutSplash({
    required this.buttonText,
    required this.topMargin,
    required this.filled,
    required this.fillColorInHex,
    required this.onTap,
  });

  final String buttonText;
  final double topMargin;
  final bool filled;
  final int fillColorInHex;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 300.0,
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        margin: EdgeInsets.only(
          top: topMargin,
          bottom: 10.0,
        ),
        decoration: BoxDecoration(
            color: (filled) ? Color(fillColorInHex).withOpacity(.9) : null,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              style: BorderStyle.solid,
              color: Color(fillColorInHex),
            )),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: (filled) ? Colors.white : Color(fillColorInHex),
          ),
        ),
      ),
    );
  }
}
