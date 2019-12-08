import 'package:flutter/material.dart';
import '../dummy_categories.dart';

class mealdetailedScreen extends StatelessWidget {
  static const routeName = '/meal-details';
  
  Widget buildSectionTitle(BuildContext context, String text){
      return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
          
                          child: Text(text,
              style: Theme.of(context).textTheme.title,),
            
            
          );
  }

  Widget buildContainer(BuildContext context,Widget child ){
  return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.25,
            width: 300,
            child: child,
  );
           
  }


  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selcetdMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(title: Text('${selcetdMeal.title}'),),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selcetdMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          buildSectionTitle(context, 'ingredients'),
            buildContainer(context,
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5,
                    horizontal: 10),
                    child: Text(selcetdMeal.ingredients[index])),
                ),
                itemCount: selcetdMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'steps'),
            buildContainer(context, ListView.builder(
              itemBuilder: (ctxt, index) => Column(children: [ListTile(
                leading: CircleAvatar(child: Text('# ${(index + 1)}')
                ,),
                title: Text(selcetdMeal.steps[index]),
                ),
                Divider(),
                ],),
              itemCount: selcetdMeal.steps.length,
            ),),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(child: Icon(
        Icons.delete,

      ),
      onPressed: (){
        Navigator.of(context).pop(mealId);
      },
      ),
    );
  }
}
