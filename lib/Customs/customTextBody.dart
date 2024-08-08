// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CustomTextBody extends StatelessWidget {
  final String text;
  const CustomTextBody({
    Key? key,
    required this.text,
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
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
