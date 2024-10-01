// import 'package:flutter/material.dart';
// import 'image_loader_screen.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Very Good Coffee',
//       theme: ThemeData(primarySwatch: Colors.brown),
//       home: ImageLoaderScreen(),
//     );
//   }
// }

// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/coffee_image_provider.dart';
import 'screens/image_loader_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CoffeeImageProvider(),
      child: MaterialApp(
        title: 'Very Good Coffee',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: ImageLoaderScreen(),
      ),
    );
  }
}
