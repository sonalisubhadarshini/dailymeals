import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
         appBar: AppBar(
           title: Text("The Recieps"),
         ),

           body: Center(
        child: Text(
          "The Reciepes for the Category!"
          ),
          ),
    );
  }

}