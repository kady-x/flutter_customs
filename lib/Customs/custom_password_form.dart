import 'package:flutter/material.dart';

class CustomPasswordForm extends StatefulWidget {
  const CustomPasswordForm({
    super.key,
    required this.hinttext,
    required this.labeltext,
    required this.iconData,
    this.mycontroller,
    required this.valid,
    required this.isNumber,
    required this.obscureText,
    this.onTapIcon,
    required Null Function(dynamic value) onSaved,
  });

  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool obscureText;
  final void Function()? onTapIcon;

  @override
  State<CustomPasswordForm> createState() => _CustomPasswordForm();

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: TextFormField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        obscureText: obscureText == false ? false : true,
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
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

class _CustomPasswordForm extends State<CustomPasswordForm> {
  final passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
    );
  }
}
