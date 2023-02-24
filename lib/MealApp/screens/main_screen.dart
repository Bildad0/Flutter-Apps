// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './category_screen.dart';
import './favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);
  final List<Meal> favoriteMeals;
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> _pages = [
      {"page": const CategoriesScreen(), "title": "Categories"},
      {
        "page": FavoriteScreen(favoriteMeals: widget.favoriteMeals),
        "title": "Favourites"
      }
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
        foregroundColor: Theme.of(context).primaryColor,
        title: Text(_pages[_selectedPageIndex]['title'] as String),
        elevation: 0,
        scrolledUnderElevation: 5,
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
            icon: const Icon(
              Icons.category,
            ),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
            icon: const Icon(
              Icons.star,
            ),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
