import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/app_constants.dart';
import '../providers/coffee_image_provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    var imageProvider = Provider.of<CoffeeImageProvider>(context);
    return Center(
      child: FutureBuilder<List<File>>(
        future: imageProvider.getSavedImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No saved images found'));
          } else {
            // return ListView.builder(
            //   itemCount: snapshot.data!.length,
            //   itemBuilder: (context, index) {
            //     final imageFile = snapshot.data![index];
            //     return ListTile(
            //       leading: Image.file(imageFile),
            //       title: Text(imageFile.path.split('/').last),
            //       trailing: IconButton(
            //         icon: Icon(Icons.delete),
            //         onPressed: () {
            //           imageProvider.deleteImage(imageFile.path);
            //           ScaffoldMessenger.of(context).showSnackBar(
            //             SnackBar(content: Text('Image deleted')),
            //           );
            //         },
            //       ),
            //     );
            //   },
            // );
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
                    padding: EdgeInsets.only(bottom: 3),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: textBrown,
                        width: 2.0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusDirectional.only(
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
                              SnackBar(content: Text('Image deleted')),
                            );
                          },
                          label: Text(
                            'Delete',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: dangerDarkRed,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ),
                          icon: const Icon(
                            Icons.delete,
                          ),
                          style: ButtonStyle(
                            padding: const WidgetStatePropertyAll(
                              EdgeInsets.fromLTRB(30, 8, 30, 8),
                            ),
                            foregroundColor:
                                WidgetStatePropertyAll(dangerDarkRed),
                            backgroundColor: WidgetStatePropertyAll(dangerRed),
                            shadowColor: WidgetStatePropertyAll(dangerRed),
                            side: WidgetStateProperty.all(
                              BorderSide(
                                  color: dangerDarkRed,
                                  width: 2.0,
                                  style: BorderStyle.solid),
                            ),
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
      ),
    );
  }
}
