import 'package:flutter/material.dart';

void customBottomSheet(BuildContext context, List<Widget> widgets) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: widgets,
        ),
      );
    },
  );
}
