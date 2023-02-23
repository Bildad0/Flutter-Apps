// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '/MealApp/screens/meal_detail_screen.dart';

import 'MealApp/screens/category_meals_screen.dart';
import 'MealApp/screens/category_screen.dart';
import 'MealApp/screens/main_screen.dart';
import 'MusicApp/music_play_ui.dart';
import 'PersonalExpenseApp/main.dart';
import 'WhatsAppCloneApp/screens/home.dart';

Future<void> main() async {
  await dotenv.load();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        //add fonts later.
        //fontFamily: 'Quicksand',

        secondaryHeaderColor: const Color.fromARGB(255, 87, 157, 90),
        primarySwatch: Colors.purple,
        backgroundColor: Colors.transparent,
        errorColor: Colors.red,
      ),
      //home: const MusicPlayUI(),
      //home: const HomePage(title: 'Personal Expenses App'),
      //home: const MyHomePage(title: 'WhatsApp'),

      initialRoute: '/', //default route
      routes: {
        '/': (ctx) => const TabsScreen(),
        CategoryMealScreen.routeName: (ctx) => const CategoryMealScreen(),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
