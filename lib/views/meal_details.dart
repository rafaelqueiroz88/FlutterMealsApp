import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/meal-details';

  const MealDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text(mealId)),
      body: Container(
        child: Text('Meal Details $mealId'),
      ),
    );
  }
}
