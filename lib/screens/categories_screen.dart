import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';
import 'search_screen.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search from meals'),
        actions: [
          IconButton(
            onPressed: () async {
              await showSearch(
                context: context,
                delegate: CustomSearchDelegate(DUMMY_MEALS),
              );
              setState(
                () {
                  DUMMY_MEALS.map(
                    (finalData) => MealItem(
                      id: finalData.id,
                      title: finalData.title,
                      imageUrl: finalData.imageUrl,
                      duration: finalData.duration,
                      complexity: finalData.complexity,
                      affordability: finalData.affordability,
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (catData) =>
                  CategoryItem(catData.id, catData.title, catData.color),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
