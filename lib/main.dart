import 'package:flutter/material.dart';
import 'package:simple_grocery_app_using_bloc/feature/home/presentation/home.dart';

// Main function to start the Flutter app
void main() => runApp(new MyApp());

// MyApp is the root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor for the MyApp widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner in the app
      theme: ThemeData(
        primaryColor: Colors.teal, // Set the primary color for the app
      ),
      home: const Home(), // Set the Home widget as the main screen of the app
    );
  }
}
