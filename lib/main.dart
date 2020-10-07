import 'package:flutter/material.dart';
import 'AlQuran.dart';

void main() {
  runApp(MaterialApp(
    title: "Al-Quran XII RPL",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Al-Quran XII RPL",
      home: AlQuran(),
    );
  }
}

