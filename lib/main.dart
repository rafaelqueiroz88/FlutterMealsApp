import 'package:flutter/material.dart';

import 'mocks/categories_mock.dart';
import 'models/meal.dart';
import './views/tabs.dart';
import './views/filters.dart';
import './views/category_meals.dart';
import './views/meal_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = mockedMeals;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      // ! sign at the end will test if true also not null
      _availableMeals = mockedMeals.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

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
        '/': (context) => const Tabs(),
        CategoryMeals.routeName: (context) => CategoryMeals(_availableMeals),
        MealDetails.routeName: (context) => const MealDetails(),
        Filters.routeName: (context) => Filters(_filters, _setFilters),
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
        return MaterialPageRoute(
            builder: (con) => CategoryMeals(_availableMeals));
      },
      // if a route fail to build, it will run this
      // is recommend to use a custom page to tells user that an error occurs
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (con) => CategoryMeals(_availableMeals));
      },
    );
  }
}
