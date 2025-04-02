import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> guaranteeItems = [
    {
      "icon": Icon(Icons.local_shipping, color: Colors.blueAccent),
      "text": "Free Pickup Drop",
      "color": Colors.blue.shade50,
    },
    {
      "icon": Icon(Icons.settings, color: Colors.purple),
      "text": "Genuine Parts",
      "color": Colors.purple.shade50,
    },
    {
      "icon": Icon(Icons.verified, color: Colors.green),
      "text": "30 Days Warranty",
      "color": Colors.green.shade50,
    },
    {
      "icon": Icon(Icons.wallet, color: Colors.deepOrange),
      "text": "Affordable Prices",
      "color": Colors.amber.shade50,
    },
  ];
  final CarouselSliderController _controller = CarouselSliderController();
  int currentindex = 0;
  List srcimage = [
    AssetImage('Assets/images/firstimage.png'),
    AssetImage('Assets/images/secondimage.png'),
    AssetImage('Assets/images/thirdimage.png'),
    AssetImage('Assets/images/fourthimage.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MOTO GENIE', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange,
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.deepOrange,
          child: Column(
            children: [
              Column(
                children: [
                  CarouselSlider.builder(
                    carouselController: _controller,
                    itemCount: srcimage.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                      int realindex,
                    ) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image(
                              image: srcimage[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.25,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration: Duration(seconds: 2),
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentindex = index;
                        });
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: AnimatedSmoothIndicator(
                      activeIndex: currentindex,
                      count: srcimage.length,
                      effect: ScrollingDotsEffect(
                        activeDotColor: Colors.black87,
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: Colors.white,
                      ),
                      onDotClicked: (index) => _controller.animateToPage(index),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 100),
                        child: Text(
                          'Doorstep Autocare Services',
                          style: TextStyle(
                            color: Colors.deepOrange.shade900,
                            fontSize: 20,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 5,
                          color: Colors.white,
                          child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            padding: EdgeInsets.all(10),
                            children: [
                              ServiceCard(
                                "Basic Wash",
                                'Assets/images/basicwash.png',
                                () {},
                              ),
                              ServiceCard(
                                "Periodic Service",
                                'Assets/images/periodicservice.png',
                                () {},
                              ),
                              ServiceCard(
                                "Brake Care",
                                'Assets/images/brakecare.png',
                                () {},
                              ),
                              ServiceCard(
                                "Tyres & Wheel Care",
                                'Assets/images/tyresandwheelcare.png',
                                () {},
                              ),
                              ServiceCard(
                                "Shine & Coat",
                                'Assets/images/shineandcoat.png',
                                () {},
                              ),
                              ServiceCard(
                                "Batteries",
                                'Assets/images/batteries.png',
                                () {},
                              ),
                              ServiceCard(
                                "Accessories",
                                'Assets/images/accessories.png',
                                () {},
                              ),
                              ServiceCard(
                                "Denting & Painting",
                                'Assets/images/dentingandpainting.png',
                                () {},
                              ),
                              ServiceCard(
                                "Electrical Maintainence",
                                'Assets/images/electricalmaintainence.png',
                                () {},
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 250),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 5,
                          width: MediaQuery.of(context).size.width,

                          decoration: BoxDecoration(color: Colors.grey.shade50),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 23),
                            child: Column(
                              children: [
                                Text(
                                  'Moto Genie Guarantee',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.roboto().fontFamily,
                                    fontSize: 20,
                                    color: Colors.deepOrange.shade900,
                                  ),
                                ),
                                SizedBox(height: 10),
                                SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,

                                    itemCount: guaranteeItems.length,
                                    itemBuilder: (context, index) {
                                      return buildGuaranteeItem(
                                        guaranteeItems[index]["icon"],
                                        guaranteeItems[index]["text"],
                                        guaranteeItems[index]["color"],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  const ServiceCard(this.title, this.iconPath, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, width: 70, height: 70),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

Widget buildGuaranteeItem(icon, String text, Color bgColor) {
  return Container(
    width: 130,
    height: 100,
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(right: 20),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(height: 5),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
