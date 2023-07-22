import 'package:flutter/material.dart';

import '../core.dart';

class PrimaryTextButton extends StatelessWidget {
  const PrimaryTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
  });

  final VoidCallback? onPressed;
  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? tertiaryColor,
          ),
        ),
      ),
    );
  }
}
