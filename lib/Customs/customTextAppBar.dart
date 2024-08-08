// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CustomTextAppBar extends StatelessWidget {
  final String text;
  final Color fontColor;
  const CustomTextAppBar({
    Key? key,
    required this.text,
    required this.fontColor,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontFamily: 'Nunito',
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
