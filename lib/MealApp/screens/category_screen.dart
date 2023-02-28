import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../resources/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static const routeName = "/categories";

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(
              title: catData.title,
              color: catData.color,
              id: catData.id,
            ),
          )
          .toList(),
    );
  }
}
