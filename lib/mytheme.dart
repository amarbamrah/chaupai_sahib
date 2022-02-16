import 'package:flutter/material.dart';

class MyTheme{
  static final darkTheme=ThemeData(
    scaffoldBackgroundColor: Colors.black87,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.white)
  );

  static final lightTheme=ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    appBarTheme: AppBarTheme(backgroundColor: Colors.white,iconTheme: IconThemeData(color: Colors.black87),
    titleTextStyle: TextStyle(color: Colors.black87))
  );
}