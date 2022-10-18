import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatefulWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  int _index = 0;

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    //gets meal that user picked
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            //extracted widget to a builder function
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            // buildContainer(
            Stepper(
              currentStep: _index,
              onStepCancel: () {
                if (_index > 0) {
                  setState(() {
                    _index -= 1;
                  });
                }
              },
              onStepContinue: () {
                if (_index <= 0) {
                  setState(() {
                    _index++;
                  });
                }
              },
              onStepTapped: (int index) {
                if (index >= selectedMeal.steps[_index].length) {
                  setState(() {
                    StepState.disabled;
                  });
                } else {
                  setState(() {
                    _index = index;
                  });
                }
              },
              steps: <Step>[
                Step(
                  title: Text('Step 1'),
                  content: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(selectedMeal.steps[_index])),
                ),
                Step(
                  title: Text('Step 2'),
                  content: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(selectedMeal.steps[_index])),
                ),
                Step(
                  title: Text('Step 3'),
                  content: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(selectedMeal.steps[_index])),
                ),
                Step(
                  title: Text('Step 4'),
                  content: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(selectedMeal.steps[_index])),
                  state: _index >= selectedMeal.steps[_index].length
                      ? StepState.disabled
                      : StepState.complete,
                ),
                Step(
                  title: Text('Step 5'),
                  content: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(selectedMeal.steps[_index])),
                ),
                Step(
                  title: Text('Step 6'),
                  content: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(selectedMeal.steps[_index])),
                ),
                Step(
                  title: Text('Step 7'),
                  content: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(selectedMeal.steps[_index])),
                ),
              ],
            ),
            // ListView.builder(
            //   itemCount: selectedMeal.steps.length,
            //   itemBuilder: (ctx, index) => Column(
            //     children: [
            //       ListTile(
            //         leading: CircleAvatar(
            //           child: Text('# ${(index + 1)}'),
            //         ),
            //         title: Text(selectedMeal.steps[index]),
            //       ),
            //       const Divider(),
            //     ],
            //   ),
            // ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget.toggleFavorite(mealId),
        child: Icon(
          widget.isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
