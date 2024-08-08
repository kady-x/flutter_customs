// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;
  final Color fontColor;
  const CustomTextSignUpOrSignIn({
    Key? key,
    required this.textone,
    required this.texttwo,
    required this.fontColor,
    required this.onTap,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textone,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: TextStyle(
              color: fontColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
