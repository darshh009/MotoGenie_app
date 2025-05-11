import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

class UiHelper {
  static CustomTextField(
    TextEditingController controller,
    String text,
    IconData iconData,
    bool toHide,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        obscuringCharacter: '*',
        style: TextStyle(color: Colors.deepOrangeAccent),
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: Colors.deepOrange),
          suffixIcon: Icon(iconData, color: Colors.deepOrange),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  static CustomButton(VoidCallback voidcallback, String text) {
    return SizedBox(
      height: 50,
      width: 170,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          elevation: 5,
          shadowColor: Colors.deepOrange.shade200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: () {
          voidcallback();
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static CustomAlertBox(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Title color
            ),
          ),
          backgroundColor: Colors.blueGrey[900], // Dialog background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Ok", style: TextStyle(color: Colors.blueAccent)),
            ),
          ],
        );
      },
    );
  }

  static CustomUserIcon() {
    return CircleAvatar(
      child: Icon(Icons.supervised_user_circle_rounded, size: 100),
      maxRadius: 50,
      backgroundColor: Colors.transparent,
    );
  }

  static List<String> imgList = [
    "assets/images/bikerepair.png",
    "assets/images/bikerepair2.png",
    "assets/images/bikerepair3.png",
    "assets/images/bikerepair4.png",
  ];

  static List<String> textList = [
    "Two-Wheeler Service At Your Fingertips!",
    "Never let a breakdown slow you down!",
    "Your Bike’s Best Friend!",
    "Live Updates & Expert Guidance",
  ];
  static CustomImages() {
    return CarouselSlider.builder(
      itemCount: imgList.length,
      options: CarouselOptions(
        height: 400,
        enlargeCenterPage: true, // Enlarge center item
        autoPlay: true, // Enable auto-play
        autoPlayAnimationDuration: Duration(seconds: 1),
        aspectRatio: 16 / 9,
        viewportFraction: 1.5, // Show part of next/previous item
      ),
      itemBuilder: (context, index, realIndex) {
        return buildImageWithText(imgList[index], textList[index]);
      },
    );
  }

  static CustomLogin() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [
              Expanded(child: Divider(thickness: 1, color: Colors.black54)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "or Login with",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              Expanded(child: Divider(thickness: 1, color: Colors.black54)),
            ],
          ),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                elevation: 4,
              ),
              onPressed: () {},
              child: Image.asset(
                "assets/images/googleicon.png",
                fit: BoxFit.cover,
                width: 45,
                height: 45,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                elevation: 4,
              ),
              onPressed: () {},
              child: Image.asset(
                "assets/images/appleicon.png",
                width: 45,
                height: 45,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                elevation: 4,
              ),
              onPressed: () {},
              child: Image.asset(
                "assets/images/facebookicon.png",
                width: 45,
                height: 45,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget buildImageWithText(String img, String text) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 250,
          child: Image.asset(img, fit: BoxFit.contain, width: 100),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
