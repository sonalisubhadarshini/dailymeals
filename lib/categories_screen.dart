import './categories_item.dart';

import './dummy_categories.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Meals"),
    
      ),
      body: GridView(

      padding: EdgeInsets.all(10),
      children: DUMMY_CATEGORIES.
     map(
      (catData) => Categoriesitem(
        catData.id,
        catData.title, 
        catData.color,
        
        
        )
        ).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3/ 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      ),));
  }

}