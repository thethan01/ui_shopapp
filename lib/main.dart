import 'package:flutter/material.dart';
import 'package:ui_shopapp/constants.dart';
import 'package:ui_shopapp/screens/home/home_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get index => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App UI',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor:  kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity

      ),
      home:  const HomeScreen(),

    );
  }
}

