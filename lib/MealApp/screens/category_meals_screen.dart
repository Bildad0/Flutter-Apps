import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  const CategoryMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("The recipes")),
      body: const Center(
        child: Text(
          "Meals are prepared in the kitchen",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
