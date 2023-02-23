import 'package:flutter/material.dart';
import '../resources/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  const MealDetailScreen({super.key});
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 8,
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, "Ingridients"),
              buildContainer(
                ListView.builder(
                  itemBuilder: ((context, index) {
                    return Card(
                      color: Colors.yellow,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(
                          selectedMeal.ingredients[index],
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildSectionTitle(context, "Steps"),
              buildContainer(
                ListView.builder(
                  itemBuilder: ((context, index) {
                    return Column(children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      const Divider(),
                    ]);
                  }),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ],
          ),
        ));
  }
}
