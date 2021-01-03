import 'package:Food_App/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  Category category;

  CategoryItem({this.category});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Color _color = this.category.color;

    return Container(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_color.withOpacity(0.7), _color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          color: _color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              this.category.content,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
