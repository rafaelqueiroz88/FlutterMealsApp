import 'package:flutter/material.dart';

import './main_drawer.dart';
import './categories.dart';
import './favorites.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final List<Map<String, Object>> _tabs = [
    {'tab': const Categories(), 'title': 'Categories'},
    {'tab': const Favorites(), 'title': 'Your Favorites'},
  ];
  int _selectedTabIndex = 0;

  void _selectedTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1, // default: 0
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('${_tabs[_selectedTabIndex]['title']}'),
          // bottom: const TabBar(
          //   tabs: [
          //     Tab(icon: Icon(Icons.category), text: 'Categories'),
          //     Tab(icon: Icon(Icons.star), text: 'Favorites'),
          //   ],
          // ),
        ),
        /**
         * For a AppBar bottom Tabs
         */
        // body: const TabBarView(
        //   children: [
        //     Categories(),
        //     Favorites(),
        //   ],
        // ),
        drawer: const MainDrawer(),
        /**
         * For bottom tabbar
         */
        body: _tabs[_selectedTabIndex]['tab'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amber,
          backgroundColor: Colors.pink,
          // gives a transition effect
          // type: BottomNavigationBarType.shifting,
          currentIndex: _selectedTabIndex,
          onTap: _selectedTab,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
          ],
        ),
      ),
    );
  }
}
