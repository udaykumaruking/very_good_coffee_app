// lib/screens/image_loader_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:very_good_coffee_app/components/bottom_nav_bar.dart';
import 'package:very_good_coffee_app/constants/app_constants.dart';
import '../providers/coffee_image_provider.dart';
import 'favorites_page.dart';
import 'home_page.dart';

class ImageLoaderScreen extends StatefulWidget {
  const ImageLoaderScreen({super.key});

  @override
  State<ImageLoaderScreen> createState() => _ImageLoaderScreenState();
}

class _ImageLoaderScreenState extends State<ImageLoaderScreen> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [HomePage(), FavoritesPage()];

  @override
  Widget build(BuildContext context) {
    Provider.of<CoffeeImageProvider>(context);

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Very Good Coffee'),
        //   actions: [
        //     IconButton(
        //       icon: Icon(Icons.photo_library),
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => SavedImagesScreen()),
        //         );
        //       },
        //     ),
        //   ],
        // ),
        backgroundColor: backgroundColor,
        bottomNavigationBar: MyBottomNavBar(
          onTabChange: (index) => navigateBottomBar(index),
        ),
        body: _pages[_selectedIndex],

        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       imageProvider.isLoading
        //           ? CircularProgressIndicator()
        //           : imageProvider.currentImage != null
        //               ? Image.file(imageProvider.currentImage!)
        //               : Text('No image loaded'),
        //       SizedBox(height: 20),
        //       ElevatedButton(
        //         onPressed: () => imageProvider.loadNewImage(),
        //         child: Text('Load New Coffee Image'),
        //       ),
        //       SizedBox(height: 20),
        //       ElevatedButton(
        //         onPressed: () => imageProvider.saveImage(),
        //         child: Text('Save Current Image'),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
