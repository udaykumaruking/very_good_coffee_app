// lib/screens/favorites_page.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_constants.dart';
import '../providers/coffee_image_provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<CoffeeImageProvider>(
        builder: (context, imageProvider, child) {
          return FutureBuilder<List<File>>(
            future: imageProvider.getSavedImages(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No saved images found'));
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final imageFile = snapshot.data![index];
                    return GridTile(
                      child: Container(
                        margin: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: textBrown,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadiusDirectional.only(
                                topEnd: Radius.circular(20),
                                topStart: Radius.circular(20),
                              ),
                              child: Image.file(
                                imageFile,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                height: 120,
                                width: double.infinity,
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                imageProvider.deleteImage(imageFile.path);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Image deleted')),
                                );
                              },
                              label: const Text('Delete'),
                              icon: const Icon(Icons.delete),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
