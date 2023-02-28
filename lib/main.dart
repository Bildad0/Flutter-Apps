// ignore_for_file: unused_import, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'MealApp/models/meal.dart';
import 'MealApp/resources/dummy_data.dart';
import 'MealApp/screens/category_meals_screen.dart';
import 'MealApp/screens/category_screen.dart';
import 'MealApp/screens/filters_screen.dart';
import 'MealApp/screens/main_screen.dart';
import 'MealApp/screens/meal_detail_screen.dart';
import 'MusicApp/music_play_ui.dart';
import 'PersonalExpenseApp/main.dart';
import 'WhatsAppCloneApp/screens/home.dart';

Future<void> main() async {
  await dotenv.load();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        //add fonts later.
        //fontFamily: 'Quicksand',

        secondaryHeaderColor: const Color.fromARGB(255, 87, 157, 90),
        primarySwatch: Colors.purple,
        backgroundColor: const Color.fromARGB(255, 189, 209, 209),
        errorColor: Colors.red,
      ),
      initialRoute: '/', //default route
      routes: {
        '/': (ctx) => TabsScreen(
              favoriteMeals: _favoriteMeals,
            ),
        //'/': (ctx) => const MusicPlayUI(),
        //'/': (ctx) => const HomePage(title: 'Personal Expenses'),
        //'/': (ctx) => const MyHomePage(title: 'WhatsApp'),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(
              toggleFavorite: _toggleFavorite,
              isFavorite: _isMealFavorite,
            ),
        FilterScreen.routeName: (ctx) => FilterScreen(
              currentFilters: _filters,
              saveFilters: _setFilters,
            ),
        CategoriesScreen.routeName: (ctx) => const CategoriesScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
