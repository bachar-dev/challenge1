import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o3d/o3d.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List tags = [
    "nike1",
    "nike2",
    "nike3",
  ];
  List sizes = [
    "39",
    "40",
    "41",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "NIKE AIR 101",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade900,
      body: Stack(
        children: [
          Positioned(
            bottom: 300,
            left: 0,
            right: 0,
            child: Transform.rotate(
              angle: pi / 2,
              child: Transform.scale(
                scale: 2,
                child: Text(
                  "NIKE AIR",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 250,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Hero(
                  tag: "nike1",
                  child: Image.asset("assets/Red Shoe.png"),
                ),
              ],
            ),
          ),
          Positioned(
            top: 150,
            left: 10,
            right: 270,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.white,
                            width: currentIndex == index ? 4 : 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          sizes[index],
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        )),
                      ),
                    ),
                  );
                }),
          ),
          const Positioned(
            bottom: -60,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 240,
              child: O3D.asset(
                src: "assets/nike_shoe_box.glb",
                autoPlay: true,
                autoRotate: false,
                disableTap: true,
                disablePan: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
