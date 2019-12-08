import '../widget/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget{
 static const routeName = '/filters';


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
      ),
      drawer: MainDrawer(),
      body:Center(
        child: Text("Filter")
        ),
    );
  }

}