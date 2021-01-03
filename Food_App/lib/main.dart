import 'package:Food_App/views/FoodsPage.dart';
import 'package:Food_App/views/category_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Food App with Navigation',
      initialRoute: '/',
      routes: {
        '/CategoryPage': (context) => CategoriesPage(),
        '/FoodsPage': (context) => FoodsPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Food\'s categories',
          ),
        ),
        body: SafeArea(
          child: CategoriesPage(),
        ),
      ),
    );
  }
}
