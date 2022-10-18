import 'package:flutter/material.dart';

import '../models/meal.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  static const routeName = '/search-screen';
  final List<Meal> allFood;

  CustomSearchDelegate(this.allFood);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, query);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final allFoundFood = allFood.where(
      (meals) => meals.title.startsWith(query),
      );

    return ListView.builder(
      itemCount: allFoundFood.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(allFoundFood.elementAt(index).title),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final allFoundFoodSuggestions = allFood.where(
      (mealsSuggestion) => mealsSuggestion.title.contains(
        query.toLowerCase(),
      ),
    );

    return ListView.builder(
      itemCount: allFoundFoodSuggestions.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(allFoundFoodSuggestions.elementAt(index).title),
        onTap: (){
          query = allFoundFoodSuggestions.toString();
          close(context, query);
        }
      ),
    );
  }
}
