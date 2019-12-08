import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget{

  final String categoryId;
  final String categoryTitle;

CategoryMealsScreen(this.categoryId, this.categoryTitle);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
         appBar: AppBar(
           title: Text(categoryTitle),
         ),

           body: Center(
        child: Text(
          "The Reciepes for the Category!"
          ),
          ),
    );
  }

}