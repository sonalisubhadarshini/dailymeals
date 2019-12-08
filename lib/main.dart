import './screen/tabs_screen.dart';

import './screen/meal_detailed_screen.dart';

import './screen/category_meals_screen.dart';

import './screen/categories_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
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
        '/': (ctxt) => TabsScreen(),
        CategoryMealsScreen.routeName : (ctxt) => CategoryMealsScreen(),
        mealdetailedScreen.routeName : (ctxt) => mealdetailedScreen(),
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



