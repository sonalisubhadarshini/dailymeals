import 'package:flutter/material.dart';
import './dummy_categories.dart';

class CategoryMealsScreen extends StatelessWidget{

  static const routeName = '/category-meals';

//   final String categoryId;
//   final String categoryTitle;

// CategoryMealsScreen(this.categoryId, this.categoryTitle);


  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);

    }).toList();


    // TODO: implement build
    return Scaffold(
         appBar: AppBar(
           title: Text(categoryTitle),
         ),

           body: ListView.builder(
             itemBuilder: (ctxt, index){
           
           return Text(categoryMeals[index].title);
               
             }, itemCount: categoryMeals.length,
           )
    );
  }

}