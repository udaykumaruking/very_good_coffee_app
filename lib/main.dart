// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/coffee_image_provider.dart';
import 'screens/image_loader_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CoffeeImageProvider(),
      child: MaterialApp(
        title: 'Very Good Coffee',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          scaffoldBackgroundColor: Colors.grey[200],
          textTheme: TextTheme(
            displayLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(fontSize: 16, color: Colors.brown),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: TextStyle(fontSize: 16),
            ),
          ),
        ),
        home: const ImageLoaderScreen(),
      ),
    );
  }
}
