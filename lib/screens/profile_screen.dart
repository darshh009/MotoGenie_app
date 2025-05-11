import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motogenie_app/data_models/loginpage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 4,
                color: Colors.grey.shade200,
              ),
            ],
          ),
        ),
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.deepOrange.shade100),
            height: MediaQuery.of(context).size.height * 0.24,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                // Offer Text
                Positioned(
                  left: 10,
                  top: 10,
                  child: Text(
                    "You Get ₹300,\nYour Friend Gets ₹200!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ),

                // Profile Banner Image
                Positioned(
                  top: 10,
                  left: MediaQuery.of(context).size.width * 0.61,
                  child: Image.asset(
                    "assets/images/profile_banner.png",
                    height: 120,
                    width: 140,
                  ),
                ),

                // Earnings Info Text
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.6,
                  left: MediaQuery.of(context).size.width * 0.03,
                  child: Text(
                    "Members Earned Up to ₹1 Lakh \nby introducing their friends and family to MotoGenie",
                    style: TextStyle(fontSize: 12),
                  ),
                ),

                // Buttons Row
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // WhatsApp Button
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            minimumSize: const Size(160, 40),
                          ),
                          onPressed: () {
                            // Add WhatsApp sharing functionality here
                          },
                          label: const Text(
                            "WhatsApp",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          icon: const FaIcon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(width: 12),

                        // Info Button (Renamed from "WhatsApp")
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            minimumSize: const Size(160, 40),
                          ),
                          onPressed: () {
                            // Add info functionality here
                          },
                          label: const Text(
                            "More Info",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          icon: const FaIcon(
                            FontAwesomeIcons.infoCircle,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 380.0, right: 10, left: 10),
            child: ListTile(
              tileColor: Colors.deepOrangeAccent.shade200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              leading: FaIcon(
                FontAwesomeIcons.powerOff,
                color: Colors.white,
                size: 20,
              ),
              title: Text(
                'Log Out',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 20,
              ),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.deepOrange,
                      behavior: SnackBarBehavior.floating,
                      content: Text(
                        "Logged Out Successfully!",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      duration: Duration(seconds: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
