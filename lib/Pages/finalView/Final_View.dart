import 'package:challenge1/Pages/details_page.dart';
import 'package:challenge1/widgets/Home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/home_page_options.dart';

class FinalView extends StatefulWidget {
  const FinalView({super.key});

  @override
  State<FinalView> createState() => _FinalViewState();
}

class _FinalViewState extends State<FinalView> {
  List shoes = [
    "assets/Red Shoe.png",
    "assets/Red Shoe.png",
    "assets/Red Shoe.png",
  ];
  List tags = [
    "nike1",
    "nike2",
    "nike3",
  ];
  List title = [
    "NIKE JORDAN 101",
    "NIKE JORDAN 102",
    "NIKE Jordan 103",
  ];
  late PageController controller;
  int pageIndex = 0;

  @override
  void initState() {
    controller = PageController(viewportFraction: 0.7);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      appBar: buildAppBar(),
      backgroundColor: Colors.grey.shade900,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Options(),
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
              itemCount: shoes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: pageIndex == index ? 20 : 60,
                  ),
                  child: Transform.translate(
                    offset: Offset(pageIndex == index ? 15 : 40, 0),
                    child: LayoutBuilder(
                      builder: (context, constrains) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const DetailsPage()));
                          },
                          child: AnimatedContainer(
                            margin: EdgeInsets.only(
                                top: pageIndex == index ? 30 : 60, bottom: 110),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            duration: const Duration(milliseconds: 230),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  top: 30,
                                  left: 20,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const Text("NIKE AIR"),
                                      Text(
                                        title[index],
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20),
                                      ),
                                      const Text("143\$"),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 150,
                                  left: 0,
                                  right: 0,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        "JORDAN",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 45,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "AIR",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 45,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 50,
                                  right: -60,
                                  child: Hero(
                                    tag: tags[index],
                                    child: Image.asset(
                                      shoes[index],
                                      height: 400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}