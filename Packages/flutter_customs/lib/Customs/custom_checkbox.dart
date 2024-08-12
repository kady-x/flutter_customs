import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final String text;
  final String linktext;
  final bool initialValue;
  final bool value;
  final String? Function(bool?)? valid;
  final void Function(bool?)? onChanged;
  final void Function()? onTap;

  const CustomCheckbox({
    Key? key,
    required this.text,
    required this.linktext,
    required this.initialValue,
    required this.value,
    required this.onChanged,
    required this.valid,
    this.onTap,
  }) : super(key: key);

  @override
  CustomCheckboxState createState() => CustomCheckboxState();
}

class CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      FormField<bool>(
                        initialValue: widget.initialValue,
                        validator: widget.valid,
                        builder: (state) {
                          return Checkbox(
                            value: widget.value,
                            onChanged: widget.onChanged,
                          );
                        },
                      ),
                      Text(widget.text),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          widget.linktext,
                          style: const TextStyle(
                            fontSize: 13,
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Builder(
                    builder: (context) {
                      final state = context
                          .findAncestorStateOfType<FormFieldState<bool>>();
                      if (state?.errorText != null) {
                        return Text(
                          state!.errorText!,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.red,
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
