import 'package:flutter/material.dart';

import '../core.dart';

openIconSnackBar(ScaffoldMessengerState scaffoldMessenger, String text,
    [Widget icon = const Icon(
      Icons.check_circle,
      color: tertiaryColor,
    )]) {
  scaffoldMessenger.showSnackBar(
    SnackBar(
      backgroundColor: primaryColor,
      behavior: SnackBarBehavior.floating,
      elevation: 20.0,
      margin: const EdgeInsets.all(24.0),
      content: Row(
        children: [
          icon,
          const SizedBox(
            width: 5,
          ),
          Text(text)
        ],
      ),
      duration: const Duration(milliseconds: 2500),
    ),
  );
}
