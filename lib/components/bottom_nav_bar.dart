import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../constants/app_constants.dart';

class MyBottomNavBar extends StatefulWidget {
  void Function(int)? onTabChange;

  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  bool isHomeActive = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: textWhite,
        boxShadow: [
          BoxShadow(
            color: textBlack.withOpacity(0.15),
            blurRadius: 24,
          ),
        ],
      ),
      child: GNav(
          // backgroundColor: textWhite,
          onTabChange: (value) => widget.onTabChange!(value),
          color: textBrown,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          textSize: 24,
          tabs: [
            GButton(
              onPressed: () {
                setState(
                  () {
                    isHomeActive = true;
                  },
                );
              },
              icon: isHomeActive
                  ? Icons.dashboard_rounded
                  : Icons.dashboard_outlined,
              iconActiveColor: textBrown,
              textColor: textBrown,
              iconSize: 40,
              gap: 10,
              text: 'Home',
              textStyle: GoogleFonts.poppins(
                fontSize: 20,
                color: textBrown,
                fontWeight: FontWeight.w600,
              ),
            ),
            GButton(
              onPressed: () {
                setState(
                  () {
                    isHomeActive = false;
                  },
                );
              },
              icon: isHomeActive
                  ? Icons.favorite_border_outlined
                  : Icons.favorite_rounded,
              gap: 10,
              text: 'Favorites',
              textStyle: GoogleFonts.poppins(
                fontSize: 20,
                color: textBrown,
                fontWeight: FontWeight.w600,
              ),
              iconActiveColor: textBrown,
              textColor: textBrown,
              iconSize: 40,
            )
          ]),
    );
  }
}
