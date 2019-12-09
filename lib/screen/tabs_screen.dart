import '../screen/favorite_screen.dart';

import '../screen/categories_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget{
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(title: Text('Meals'),
        bottom: TabBar(tabs: <Widget>[
          Tab(
            icon: Icon(
              Icons.category,
            ),
            text: 'Categories',
          ),
          Tab(
            icon: Icon(
              Icons.star,
          
            ),
            text: 'Favorities',
          ),
        ],),
        ),
        body: TabBarView(children: <Widget>[
         // CategoriesScreen(), (required)
          //FavoriteScreen(), (required)
        ],),
      ),
    );
  }
}