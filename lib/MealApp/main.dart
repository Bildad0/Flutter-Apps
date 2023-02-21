import 'package:flutter/material.dart';

import 'screens/category_screen.dart';

class MealsApp extends StatefulWidget {
  const MealsApp({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  State<MealsApp> createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const CategoriesScreen(),
    );
  }
}
