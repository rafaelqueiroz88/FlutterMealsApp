import 'package:flutter/material.dart';

import '../mocks/categories_mock.dart';
import '../widgets/category_item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delicious'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Colors.black,
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: mockedCategories
            .map(
              (cat) => CategoryItem(
                cat.id,
                cat.title,
                cat.color,
              ),
            )
            .toList(),
      ),
    );
  }
}
