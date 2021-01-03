import 'package:flutter/material.dart';

import 'myapp.dart';

void main() {
  runApp(MaterialApp(
    title: 'Transaction app',
    theme: ThemeData(
      primaryColor: Colors.green,
      accentColor: Colors.blue,
    ),
    home: MyApp(),
  ));
}
