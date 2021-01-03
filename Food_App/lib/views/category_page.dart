import 'package:Food_App/data/fake_data.dart';
import 'package:Food_App/views/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  static const String routeName = '/CategoriesPage';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView(
      padding: EdgeInsets.all(12),
      children: FAKE_CATEGORIES
          .map((eachCategory) => CategoryItem(
                category: eachCategory,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
