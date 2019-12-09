import '../widget/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget{
 static const routeName = '/filters';
 final Function saveFilters;
 final Map<String, bool> currentFilters;

 FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {



  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;


  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
     _vegan = widget.currentFilters['vegan'];
    _vegeterian = widget.currentFilters['vegeterian'];

     super.initState();
  }


  Widget _buildSwitchListTitle(String title, String description, bool currentValue, Function updateValue){
    return      SwitchListTile(
                title: Text(title),
                value: currentValue,
                subtitle: Text(
                  description
                ),
                onChanged: updateValue,
              
              );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(icon: Icon(
            Icons.save
          ),
          onPressed: () {
            final selectedFilters = {

    'gluten': _glutenFree,
    'lactose': _lactoseFree,
    'vegan' : _vegan,
    'vegeterian': _vegeterian,

  
            };
            widget.saveFilters(selectedFilters);
            },)
        ],
      ),
      drawer: MainDrawer(),
      body:Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal Section.',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
         _buildSwitchListTitle('Gluten-free', 'Only include Gluten-Free meals', 
         _glutenFree, 
         (newValue){
           setState(() {
             _glutenFree = newValue;
           },
           );
         },
         ),
          _buildSwitchListTitle('lactose-free', 'Only include lactose-Free meals', 
         _lactoseFree, 
         (newValue){
           setState(() {
             _lactoseFree = newValue;
           },
           );
         },
         ),

          _buildSwitchListTitle('vegan', 'Only include vegan meals', 
         _vegan, 
         (newValue){
           setState(() {
             _vegan = newValue;
           },
           );
         },
         ),

          _buildSwitchListTitle('Vegeterian', 'Only include vegeterian meals', 
         _vegeterian, 
         (newValue){
           setState(() {
             _vegeterian = newValue;
           });
         }),
         
            ],
          ),
        ),
      ],)
    );
  }
}