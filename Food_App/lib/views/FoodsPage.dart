import 'package:Food_App/models/category.dart';
import 'package:flutter/material.dart';

class FoodsPage extends StatelessWidget {
  Category category;

  FoodsPage({this.category});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Foods from ${category.content}'),
      ),
      body: Center(
        child: Text(
          'This show Foods\'s list',
          style: TextStyle(fontSize: 25, fontFamily: 'Redressed'),
        ),
      ),
    );
  }
}
