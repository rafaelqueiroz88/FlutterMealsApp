import 'package:flutter/material.dart';

import '../mocks/categories_mock.dart';
import '../widgets/meal_item.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  const CategoryMeals({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = mockedMeals.where((meal) {
      return meal.categories.contains(categoryId.toString());
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemBuilder: (con, index) {
          return MealItem(
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
