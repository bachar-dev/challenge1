import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: Image.asset(
      "assets/nike.png",
    ),
    actions: const [
      Icon(
        Icons.menu,
        color: Colors.white,
      ),
      SizedBox(width: 10),
      Icon(
        Icons.shopping_bag_outlined,
        color: Colors.white,
      ),
      SizedBox(width: 10),
    ],
  );
}
