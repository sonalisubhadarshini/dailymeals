import '../widget/meal_item.dart';

import '../model/meal.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget{

  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if(favoriteMeals.isEmpty){
  return Center(
      child: Text('You have no favorites Yet!'),
    );
    }else{
      return  ListView.builder(
          itemBuilder: (ctxt, index) {
            return MealItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                imageUrl: favoriteMeals[index].imageUrl,
                duration: favoriteMeals[index].duration,
                complexity: favoriteMeals[index].complexity,
                affordability: favoriteMeals[index].affordability,
                );
                
            //  MealItem(title : categoryMeals[index].title,imageUrl: categoryMeals[index].imageUrl,duration: categoryMeals[index].duration, complexity: categoryMeals[index].complexity, affordability: categoryMeals[index].affordability,
          },
          itemCount: favoriteMeals.length,
      );
    }
  
  }

}