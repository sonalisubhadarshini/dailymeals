import 'package:flutter/material.dart';
import '../dummy_categories.dart';
import '../widget/meal_item.dart';


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
           
           return MealItem(categoryMeals[index].title, categoryMeals[index].imageUrl, categoryMeals[index].duration, categoryMeals[index].complexity, categoryMeals[index].affordability);
              //  MealItem(title : categoryMeals[index].title,imageUrl: categoryMeals[index].imageUrl,duration: categoryMeals[index].duration, complexity: categoryMeals[index].complexity, affordability: categoryMeals[index].affordability,
           
             }, itemCount: categoryMeals.length,
           )
    );
  }

}