import 'package:flutter/material.dart';

import '../core.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.text,
    this.loader,
  });
  final String? text;
  final Widget? loader;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          loader ??
              const CircularProgressIndicator(
                value: 20.0,
                color: primaryColor,
              ),
          const SizedBox(
            height: 20.0,
          ),
          if (text != null)
            Text(
              text ?? '',
            )
        ],
      ),
    );
  }
}
