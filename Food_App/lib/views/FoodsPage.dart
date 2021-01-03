import 'package:Food_App/data/fake_data.dart';
import 'package:Food_App/data/food.dart';
import 'package:Food_App/models/category.dart';
import 'package:flutter/material.dart';

class FoodsPage extends StatelessWidget {
  static const String routeName = '/FoodsPage';
  Category category;

  FoodsPage({this.category});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Map<String, Category> arguments = ModalRoute.of(context).settings.arguments;
    this.category = arguments['category'];
    List<Food> foods = FAKE_FOODS
        .where((food) => food.categoryId == this.category.id)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Foods from ${category.content}'),
      ),
      body: Center(
        child: Center(
          child: ListView.builder(itemBuilder: (context, index) {}),
        ),
      ),
    );
  }
}
