import '../model/meal.dart';

import '../widget/main_drawer.dart';
import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorite_screen.dart';

class BottomTabScreen extends StatefulWidget{

  final List<Meal> favoritedMeals;

  BottomTabScreen(this.favoritedMeals);

  @override
  _BottomTabScreenState createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen> {
   List<Map<String, Object>> _pages;

  

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages =[
    {'page' : CategoriesScreen(),'title' : 'Categories'},
    {'page': FavoriteScreen(widget.favoritedMeals), 'title' : 'Your Favourite',}
  ];
    // TODO: implement initState
    super.initState();
  }

void _selectPage(int index){

  setState(() {
    _selectedPageIndex = index;
  });

}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
       
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(

          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favorities'),
            ),
          ],
        ),
      );
   
  }
}