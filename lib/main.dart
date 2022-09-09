import 'package:chaupai_sahib/homescreen.dart';
import 'package:chaupai_sahib/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //This is test
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chaupai Sahib',
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      home: HomeScreen()
    );
  }
}

