import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee/marquee.dart';
import 'package:motogenie_app/data_models/benefits.dart';
import 'package:motogenie_app/data_models/faq_data.dart';
import 'package:motogenie_app/data_models/pricing_data.dart';
import 'package:motogenie_app/screens/razorpay.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  _PremiumScreenState createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  int activeIndex = 0;
  bool isAnnual = false;
  int selectedIndex = 0;
  late RazorPayService _razorPayService=RazorPayService(context: context);
  String? activeSubscriptionName;
  DateTime? activeTill;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorPayService = RazorPayService(context: context);
  }




  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorPayService.dispose();
  }


  void _onCheckout() {
    final selectedPlan = PricingData.plans[selectedIndex];
    int amount = isAnnual ? selectedPlan['annual'] : selectedPlan['monthly'];
    String planName = selectedPlan['name'];
    final endDate = isAnnual
        ? DateTime.now().add(Duration(days: 365))
        : DateTime.now().add(Duration(days: 30));

    _razorPayService.openCheckout(amount: amount, planName: planName);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"),
                  fit: BoxFit.cover,
                ),
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 255, 215, 0),
                    width: 1,
                  ),
                ),
              ),

              /// Overlaying content inside the image container
              child: Stack(
                alignment: Alignment.center,
                children: [
                  /// Animated Banner
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.03,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.asset(
                        "assets/images/animated_banner.png",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),

                  /// Text Overlay inside Container
                  Positioned(
                    bottom: 29, // Adjust spacing from bottom
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.2,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        "Join Genie Elite – Elevate Your\nTwo-Wheeler Experience",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xfffff5ee),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.lato().fontFamily,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),





                  Positioned(
                    bottom: -2,
                    child: Container(
                      height: 27,
                      width: MediaQuery.of(context).size.width * 1.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Color(0xfffaebd7),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: Marquee(
                          text:
                          "Limited Offer: Get 10% Off on Annual Subscription",
                          velocity: 40.0,
                          blankSpace: 50,
                          pauseAfterRound: Duration(seconds: 3),
                          crossAxisAlignment: CrossAxisAlignment.center,
                          scrollAxis: Axis.horizontal,
                          startPadding: 20,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.orange.shade900,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "Why",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Go",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Elite ?",
                    style: TextStyle(
                      color: Color(0xffd1ac3f),
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            // benefitCard(
            //   "assets/images/washing.jpg",  // Replace with your image path
            //   "Exclusive Perks",                  // Replace with the benefit title
            //   "Enjoy priority support\n andexclusive offers",
            //   context// Replace with the description
            // ),
            CarouselSlider.builder(
              itemCount: BenefitsData.benefits.length,
              itemBuilder: (context, index, realIndex) {
                return benefitCard(
                  BenefitsData.benefits[index]['image']!,
                  BenefitsData.benefits[index]['title']!,
                  BenefitsData.benefits[index]['description']!,
                  context,
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                height: 230,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlayCurve: Curves.easeInOutExpo,
                autoPlayAnimationDuration: Duration(seconds: 2),
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Center(child: smoothIndicator()),
            SizedBox(height: 20),
            Center(
              child: priceToggle(isAnnual, (value) {
                setState(() {
                  isAnnual = value;
                });
              }),
            ),
            SizedBox(height: 6),
            Center(
              child: Text(
                "*Select your Plan*",
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),


            SizedBox(height: 7),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  PricingData.plans.length,
                      (index) => SizedBox(
                    width: 300, // Adjust width as needed
                    child: pricingCard(context, index, isAnnual, selectedIndex, () {
                      setState(() {
                        selectedIndex = index;
                      });
                      showModalBottomSheet(


                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          final startDate = DateTime.now();
                          final isAnnualSelected = isAnnual;
                          final price = isAnnualSelected
                              ? PricingData.plans[index]['annual']
                              : PricingData.plans[index]['monthly'];
                          final endDate =
                          isAnnualSelected
                              ? DateTime(
                            startDate.year + 1,
                            startDate.month,
                            startDate.day,
                          )
                              : DateTime(
                            startDate.year,
                            startDate.month + 1,
                            startDate.day,
                          );
                          String formattedDate = DateFormat(
                            'd MMMM y',
                          ).format(endDate);
                          String startFormatted = DateFormat(
                            'd MMMM y',
                          ).format(startDate);
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.46,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 15, top: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${PricingData.plans[index]['name']} Plan",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color:
                                        PricingData.plans[index]['highlight1'] ==
                                            true
                                            ? Colors.blue.shade900
                                            : (PricingData
                                            .plans[index]['highlight2'] ==
                                            true
                                            ? Colors.orange.shade700
                                            : Color(0xffd1ac3f)),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        height: 120,
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.85,
                                        decoration: BoxDecoration(
                                          color: Colors.orange.shade50,
                                          borderRadius: BorderRadius.circular(
                                            7,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 5,
                                              color: Colors.grey.shade500,
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Billing Cycle",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  FaIcon(
                                                    FontAwesomeIcons.rotate,
                                                    size: 22,
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 12),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Starting Date: ",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  Text(
                                                    startFormatted,
                                                    style: TextStyle(
                                                      color:
                                                      Colors
                                                          .deepOrange
                                                          .shade800,
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Text(
                                                    "End Date: ",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  Text(
                                                    formattedDate,
                                                    style: TextStyle(
                                                      color:
                                                      Colors
                                                          .deepOrange
                                                          .shade800,
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:14),
                                    Container(
                                        width: MediaQuery.of(context).size.width*0.9,
                                        child: Text("Note: Autopay will be deducted automatically on each billing cycle.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontStyle: FontStyle.italic,
                                                color: Colors.red.shade600
                                            ))),
                                    SizedBox(height:7),

                                    Row(
                                      children: [
                                        Text("Price: ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontFamily: GoogleFonts.poppins().fontFamily
                                          ),),

                                        Text("₹${price}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: PricingData.plans[index]['highlight1'] ==
                                                  true
                                                  ? Colors.blue.shade900
                                                  : (PricingData
                                                  .plans[index]['highlight2'] ==
                                                  true
                                                  ? Colors.deepOrange.shade700
                                                  : Color(0xffd1ac0f)),
                                              fontFamily: GoogleFonts.poppins().fontFamily
                                          ),),


                                      ],
                                    ),
                                    SizedBox(height: 10),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 14),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 10,
                                              minimumSize: Size(330,45),
                                              backgroundColor: PricingData.plans[index]['highlight1'] ==
                                                  true
                                                  ? Colors.blue.shade900
                                                  : (PricingData
                                                  .plans[index]['highlight2'] ==
                                                  true
                                                  ? Colors.deepOrange.shade400
                                                  : Color(0xffd1ac0f)),
                                              foregroundColor: Colors.white,
                                              splashFactory: InkRipple.splashFactory

                                          ),

                                          onPressed:_onCheckout

                                          , child: Text("Checkout",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: GoogleFonts.poppins().fontFamily
                                          ))),
                                    )


                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }, PricingData.plans[index]),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "FAQs",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.orange.shade800,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.49,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 10),
                shrinkWrap: true,
                itemCount: FaqData.faqList.length,
                itemBuilder: (context, index) {
                  return faqTile(context, index, FaqData.faqList[index]);
                },
              ),
            ),
            Center(
              child: Text(
                "🇮🇳 App Proudly made in India",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            SizedBox(height: 18),
          ],
        ),
      ),
    );
  }

  /// benefit card widget
  Widget benefitCard(
      String imagePath,
      String title,
      description,
      BuildContext context,
      ) => Container(
    margin: EdgeInsets.only(left: 15, right: 15),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(blurRadius: 6, spreadRadius: 2, color: Colors.grey.shade900),
      ],
      borderRadius: BorderRadius.circular(20),
    ),
    width: MediaQuery.of(context).size.width * 0.72,
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 230,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Container(
          height: 230,
          margin: EdgeInsets.only(top: 165),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(12),
            ),
            color: Color(0xff000080),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 10),
                Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffd1ac3f),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    description,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xfffffaf0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  /// smooth indicators
  Widget smoothIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: 5,
    effect: ExpandingDotsEffect(
      dotHeight: 10,
      dotWidth: 10,
      dotColor: Colors.grey.shade500,
      activeDotColor: Colors.orange,
    ),
  );
}

/// widget for pricingToggle
Widget priceToggle(bool isAnnual, Function(bool) onChanged) {
  return Stack(
    children: [
      ToggleButtons(
        selectedColor: Colors.white,
        fillColor: Color(0xff85440c),
        isSelected: [!isAnnual, isAnnual],
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        constraints: BoxConstraints(minWidth: 100, minHeight: 30),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              'Monthly',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              'Annual (Save 10%)',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
        ],
        onPressed: (int index) {
          onChanged(!isAnnual);
        },
      ),
    ],
  );
}

/// Price Widget
Widget pricingCard(
    BuildContext context,
    int index,
    bool isAnnual,
    int selectedIndex,
    VoidCallback onSelect,
    Map<String, dynamic> plan,
    ) => GestureDetector(
  onTap: onSelect,
  child: Stack(
    children: [
      Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        height: 220,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: selectedIndex == index ? Colors.green : Colors.white,
              width: selectedIndex == index ? 4 : 0.5,
            ),
          ),
          color:
          plan['highlight1'] == true
              ? Colors.blue.shade100
              : (plan['highlight2'] == true
              ? Color(0xffffc87c)
              : (plan['highlight3'] == true
              ? Color(0xffd1ac3f)
              : Colors.grey)),
          elevation: 4,
          shadowColor: Color(0xfffaf0e6),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  plan['name'],
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '"₹"${isAnnual ? plan['annual'] : plan['monthly']} / ${isAnnual ? 'Year' : 'Month'}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.orange.shade900,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Column(
                  children:
                  plan['features'].map<Widget>((feature) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 16,
                          ),
                          SizedBox(width: 8),
                          Text(feature, style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    shadowColor: Colors.blue.shade200,
                    elevation: 5,
                    backgroundColor:
                    selectedIndex == index
                        ? Colors.green
                        : Colors.blue.shade900,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Upgrade Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      if (selectedIndex == index)
        Positioned(
          top: MediaQuery.of(context).size.height * 0.01,
          right: MediaQuery.of(context).size.width * 0.07,
          child: Lottie.asset("assets/animations/confirmed.json", width: 50),
        ),
    ],
  ),
);

Widget faqTile(BuildContext context, int index, Map<String, String> faq) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.blue.shade200),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            faq['question'] ?? 'No question available',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff1d2951),
            ),
          ),
          backgroundColor: const Color(0xfffffff0),
          collapsedIconColor: Colors.blue.shade700,
          iconColor: Colors.orange.shade600,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 5, right: 12),
              child: Text(
                faq['answer'] ?? 'No answer available',
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
