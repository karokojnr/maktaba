import 'package:flutter/material.dart';

import '../../core/core.dart';

ThemeData getAppTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: tertiaryColor,
    primaryColor: primaryColor,
    primarySwatch: Colors.teal,
    appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(
          color: tertiaryColor,
        )),
  );
}
