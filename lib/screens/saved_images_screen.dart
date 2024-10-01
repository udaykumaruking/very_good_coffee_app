// lib/screens/saved_images_screen.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/coffee_image_provider.dart';

class SavedImagesScreen extends StatelessWidget {
  const SavedImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var imageProvider = Provider.of<CoffeeImageProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Saved Coffee Images')),
      body: FutureBuilder<List<File>>(
        future: imageProvider.getSavedImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No saved images found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final imageFile = snapshot.data![index];
                return ListTile(
                  leading: Image.file(imageFile),
                  title: Text(imageFile.path.split('/').last),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      imageProvider.deleteImage(imageFile.path);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Image deleted')),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
