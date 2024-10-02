// import 'package:abc/providers/coffee_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/app_constants.dart';
import '../providers/coffee_image_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var imageProvider = Provider.of<CoffeeImageProvider>(context);
    // final coffeeProvider = Provider.of<CoffeeProvider>(context);
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 50, 20, 0),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: 'Find the ',
              style: GoogleFonts.jost(
                textStyle: const TextStyle(fontSize: 40),
                color: textBlack,
              ),
              children: [
                TextSpan(
                  text: 'Best Coffee',
                  style: TextStyle(
                    color: textBrown,
                    fontWeight: FontWeight.w900,
                    decoration: TextDecoration.underline,
                    letterSpacing: 2,
                  ),
                ),
                TextSpan(
                  text: ' to your taste',
                  style: GoogleFonts.jost(
                    textStyle: const TextStyle(fontSize: 40),
                    color: textBlack,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(40),
                color: textWhite),
            child: Column(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadiusDirectional.only(
                      topEnd: Radius.circular(40),
                      topStart: Radius.circular(40),
                    ),
                    color: textBlack,
                  ),
                  child: imageProvider.isLoading
                      ? Center(
                          child: Text(
                            'Loading',
                            style: GoogleFonts.jost(
                              textStyle: const TextStyle(fontSize: 40),
                              color: textWhite,
                            ),
                          ),
                        )
                      : imageProvider.currentImage != null
                          ? ClipRRect(
                              borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(40),
                                topStart: Radius.circular(40),
                              ),
                              child: Image.file(
                                imageProvider.currentImage!,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            )
                          : Text(
                              'No image loaded',
                              style: GoogleFonts.jost(
                                textStyle: const TextStyle(fontSize: 40),
                                color: textWhite,
                              ),
                            ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     ElevatedButton.icon(
                //       onPressed: () {
                //         imageProvider.loadNewImage();
                //       },
                //       label: Text(
                //         'Load Image',
                //         style: GoogleFonts.poppins(
                //           fontSize: 16,
                //           color: textBrown,
                //           fontWeight: FontWeight.w400,
                //           letterSpacing: 1,
                //         ),
                //       ),
                //       icon: const Icon(
                //         Icons.refresh_rounded,
                //       ),
                //       style: ButtonStyle(
                //         padding: const WidgetStatePropertyAll(
                //           EdgeInsets.fromLTRB(15, 8, 15, 8),
                //         ),
                //         foregroundColor: WidgetStatePropertyAll(textBrown),
                //         backgroundColor: WidgetStatePropertyAll(textWhite),
                //         shadowColor: WidgetStatePropertyAll(textBrown),
                //         side: WidgetStateProperty.all(
                //           BorderSide(
                //               color: textBrown,
                //               width: 2.0,
                //               style: BorderStyle.solid),
                //         ),
                //       ),
                //     ),
                //     ElevatedButton.icon(
                //       onPressed: () {
                //         imageProvider.saveImage();
                //         ScaffoldMessenger.of(context).showSnackBar(
                //           SnackBar(content: Text('Image Saved')),
                //         );
                //       },
                //       label: Text(
                //         'Save Image',
                //         style: GoogleFonts.poppins(
                //           fontSize: 16,
                //           color: textWhite,
                //           fontWeight: FontWeight.w400,
                //           letterSpacing: 1,
                //         ),
                //       ),
                //       icon: const Icon(
                //         Icons.save_alt_rounded,
                //       ),
                //       style: ButtonStyle(
                //         padding: const WidgetStatePropertyAll(
                //           EdgeInsets.fromLTRB(15, 8, 15, 8),
                //         ),
                //         foregroundColor: WidgetStatePropertyAll(textWhite),
                //         backgroundColor: WidgetStatePropertyAll(textBrown),
                //         shadowColor: WidgetStatePropertyAll(textBrown),
                //       ),
                //     ),
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildActionButton(
                      label: 'Load Image',
                      icon: Icons.refresh_rounded,
                      onPressed: () => imageProvider.loadNewImage(),
                      buttonColor: textWhite,
                      textColor: textBrown,
                    ),
                    buildActionButton(
                      label: 'Save Image',
                      icon: Icons.save_alt_rounded,
                      onPressed: () {
                        imageProvider.saveImage();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Image Saved')),
                        );
                      },
                      buttonColor: textBrown,
                      textColor: textWhite,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget buildActionButton({
  required String label,
  required IconData icon,
  required VoidCallback onPressed,
  required Color buttonColor,
  required Color textColor,
}) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    label: Text(
      label,
      style: GoogleFonts.poppins(
        fontSize: 16,
        color: textColor,
        fontWeight: FontWeight.w400,
        letterSpacing: 1,
      ),
    ),
    icon: Icon(icon),
    style: ButtonStyle(
      padding: const WidgetStatePropertyAll(
        EdgeInsets.fromLTRB(15, 8, 15, 8),
      ),
      foregroundColor: WidgetStatePropertyAll(textColor),
      backgroundColor: WidgetStatePropertyAll(buttonColor),
    ),
  );
}
