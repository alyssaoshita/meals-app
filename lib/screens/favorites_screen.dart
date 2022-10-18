import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          Meal m = favoriteMeals[index];
          return MealItem(
            id: m.id,
            title: m.title,
            imageUrl: m.imageUrl,
            duration: m.duration,
            complexity: m.complexity,
            affordability: m.affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
