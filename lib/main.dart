// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'PersonalExpenseApp/main.dart';
import 'WhatsAppCloneApp/screens/home.dart';

Future<void> main() async {
  await dotenv.load();

  WidgetsFlutterBinding.ensureInitialized();

  //to set specific orientation for your App.
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);

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
      home: const HomePage(title: 'Personal Expenses App'),
      //home: const MyHomePage(title: 'WhatsApp'),
    );
  }
}
