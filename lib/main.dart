import './dummy_categories.dart';

import './screen/filters_screen.dart';

import './screen/bottom_tap_screen.dart';
import './screen/meal_detailed_screen.dart';

import './screen/category_meals_screen.dart';

import './screen/categories_screen.dart';
import 'package:flutter/material.dart';

import './model/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan' : false,
    'vegeterian': false,

  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

void _setFilters(Map<String, bool> filterData){
setState(() {
  _filters = filterData;
  _availableMeals = DUMMY_MEALS.where((meal){
    if(_filters['gluten'] && !meal.isGlutenFree){
       return false;
    }
    if(_filters['lactose'] && !meal.isLactoseFree){
       return false;
    }
    if(_filters['vegan'] && !meal.isVegan){
       return false;
    }
    if(_filters['vegeterian'] && !meal.isVegetarian){
       return false;
    }
    return true;
 
  }).toList();
});
}

void _toggleFavorite(String mealId){
  final existingIndex = 
     _favoriteMeals.indexWhere((meal) => meal.id == mealId);

     if(existingIndex >= 0){
       setState(() {
         _favoriteMeals.removeAt(existingIndex);
       });
     }else{
       setState(() {
         _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),);

       });
     }
}

bool _isMealFavorite(String id){
  return _favoriteMeals.any((meal) => meal.id == id);
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "DailyMeals",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromARGB(225, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
             body1: TextStyle(
               color: Color.fromRGBO(20, 51, 51, 1),
             ),
             body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)
             ),
             title: TextStyle(
              fontSize: 24,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
             ),
        ),
      ),
      // home: CategoriesScreen(),

      initialRoute: '/',
      routes: {
        '/': (ctxt) => BottomTabScreen(_favoriteMeals),
        CategoryMealsScreen.routeName : (ctxt) => CategoryMealsScreen(_availableMeals),
        mealdetailedScreen.routeName : (ctxt) => mealdetailedScreen(_toggleFavorite,_isMealFavorite),
        FiltersScreen.routeName : (ctxt) => FiltersScreen(_filters,_setFilters),
      },

      onGenerateRoute: (settings){
        print(settings.arguments);
        // if(settings.name == '/meal-detail'){
        //   return ...;

        // }else if(settings.name == '/something-else'){
        //   return ...;
        // }

     //   return MaterialPageRoute(builder: (ctxt)  => CategoriesScreen());
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctxt)  => CategoriesScreen());
      },




    );
  }
}



