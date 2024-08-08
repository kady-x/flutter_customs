// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String labeltext;
  final String hinttext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool obscureText;
  final void Function()? onTapIcon;

  const CustomTextForm({
    Key? key,
    this.onTapIcon,
    required this.hinttext,
    required this.labeltext,
    required this.iconData,
    required this.valid,
    required this.mycontroller,
    required this.isNumber,
    required this.obscureText,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: TextFormField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(
                decimal: true,
              )
            : TextInputType.text,
        obscureText: obscureText == false ? false : true,
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          hintText: hinttext,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 30,
          ),
          label: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 9,
            ),
            child: Text(
              labeltext,
            ),
          ),
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(
              iconData,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
    );
  }
}
