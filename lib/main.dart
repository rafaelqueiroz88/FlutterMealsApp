import 'package:flutter/material.dart';

import './views/categories.dart';
import './views/category_meals.dart';
import './views/meal_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delicious Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline4: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: const Categories(),
      routes: {
        '/': (context) => const Categories(),
        CategoryMeals.routeName: (context) => const CategoryMeals(),
        MealDetails.routeName: (context) => const MealDetails(),
      },
      // if you try to access an unknow route, it will return this route as default
      onGenerateRoute: (settings) {
        /**
         * this could be used to customize routes
         *
         * if (settings.name == '/some-route') {
         *   return ...;
         * } else {
         *   return ...;
         * }
         */
        return MaterialPageRoute(builder: (con) => const CategoryMeals());
      },
      // if a route fail to build, it will run this
      // is recommend to use a custom page to tells user that an error occurs
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (con) => const CategoryMeals());
      },
    );
  }
}
