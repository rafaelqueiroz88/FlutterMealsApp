import 'package:flutter/material.dart';
import './main_drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const Filters(this.currentFilters, this.saveFilters, {super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    // use ! sign at the end to avoid error: A value of type 'bool?' can't be assigned to a variable of type 'bool'.
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, void Function(bool)? updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filtros'), actions: [
        IconButton(
          onPressed: () {
            final selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            };

            widget.saveFilters(selectedFilters);
          },
          icon: const Icon(Icons.save),
        )
      ]),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text('Find your fav meals!',
              style: Theme.of(context).textTheme.titleSmall),
        ),
        Expanded(
            child: ListView(
          children: [
            _buildSwitchListTile(
                'Gluten Free', 'Gluten Free recipes only', _glutenFree,
                (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            }),
            _buildSwitchListTile(
                'Vegetarian', 'Vegetarian recipes only', _vegetarian,
                (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            }),
            _buildSwitchListTile('Vegan', 'Vegan recipes only', _vegan,
                (newValue) {
              setState(() {
                _vegan = newValue;
              });
            }),
            _buildSwitchListTile(
                'Lactose Free', 'Lactose Free recipes only', _lactoseFree,
                (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            }),
          ],
        ))
      ]),
    );
  }
}
