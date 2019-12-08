import 'package:flutter/material.dart';

class mealdetailedScreen extends StatelessWidget {
  static const routeName = '/meal-details';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(title: Text('$mealId'),),

      body: Center(
        child: Text('The meal - $mealId'),
      ),
    );
  }
}
