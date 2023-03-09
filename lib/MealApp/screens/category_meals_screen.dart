import 'package:flutter/material.dart';

import '../../main.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  const CategoryMealScreen({
    Key? key,
    required this.availableMeals,
  }) : super(key: key);
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title']!;
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedData = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
        foregroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Text(
          categoryTitle,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
