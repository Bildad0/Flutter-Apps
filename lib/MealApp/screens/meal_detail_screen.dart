import 'dart:math';

import 'package:flutter/material.dart';
import '../resources/dummy_data.dart';

class MealDetailScreen extends StatefulWidget {
  static const routeName = '/meal-detail';

  const MealDetailScreen({super.key});

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  late Color _bgColor;
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.blue,
      Colors.blueGrey,
      Colors.cyan,
      Colors.deepOrangeAccent,
      Colors.amber,
      Colors.brown
    ];

    _bgColor = availableColors[Random().nextInt(availableColors.length)];
    super.initState();
  }

  Widget buildSectionTitle(BuildContext context, String text1, String text2) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text1,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                color: _bgColor.withOpacity(0.7),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
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
      height: 250,
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
          backgroundColor: _bgColor,
          scrolledUnderElevation: 8,
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 150,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(
                  context, "Ingridients", "Time: ${selectedMeal.duration} min"),
              buildContainer(
                ListView.builder(
                  itemBuilder: ((context, index) {
                    return Card(
                      color: _bgColor.withOpacity(0.4),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(
                          "${index + 1}).  ${selectedMeal.ingredients[index]}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildSectionTitle(
                context,
                "Steps",
                "",
              ),
              buildContainer(
                ListView.builder(
                  itemBuilder: ((context, index) {
                    return Column(children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: _bgColor,
                          child: Text(
                            "${index + 1}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      const Divider(),
                    ]);
                  }),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ));
  }
}
