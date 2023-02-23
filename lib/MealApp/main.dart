import 'package:flutter/material.dart';

import 'screens/category_screen.dart';

class MealsApp extends StatefulWidget {
  const MealsApp({super.key});

  @override
  State<MealsApp> createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 8,
        title: const Text('Awuor\'s Cafe'),
      ),
      body: const CategoriesScreen(),
    );
  }
}
