import 'package:flutter/material.dart';

class CustomTextTitle extends StatelessWidget {
  final String text;
  const CustomTextTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 35,
          fontFamily: "Nunito",
        ),
      ),
    );
  }
}
