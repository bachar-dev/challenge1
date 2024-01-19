import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

BottomNavigationBar buildBottomNavigationBar() {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.yellow.shade900,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.yellow,
    selectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w900),
    unselectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w900),
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: "SEARCH"),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border), label: "FAVORITE"),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings), label: "SETTINGS"),
    ],
  );
}


