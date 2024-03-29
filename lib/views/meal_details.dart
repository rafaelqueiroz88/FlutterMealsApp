import 'package:flutter/material.dart';

import '../mocks/categories_mock.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/meal-details';

  final void Function(String)? toggleFavorite;
  final Function isFavorite;

  const MealDetails(this.toggleFavorite, this.isFavorite, {super.key});

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return (Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = mockedMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      selectedMeal.ingredients[index],
                    ),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // use ! sign right after function to avoid possible null value
        onPressed: () => toggleFavorite!(mealId),
        child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
