import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:motogenie_app/bottom_navigation.dart';
import 'package:motogenie_app/screens/checkuser.dart';
import 'package:motogenie_app/screens/loginpage.dart';
import 'package:motogenie_app/screens/premium_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  bool _showProgress = false; // Initial opacity for fade-in animation

  @override
  void initState() {
    super.initState();

    // Fade-in effect for logo
    Timer(Duration(milliseconds: 700), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _showProgress = true;
      });
    });

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CheckUser()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(30, 59, 141, 153),
              Color.fromARGB(30, 107, 107, 131),
              Color.fromARGB(30, 170, 75, 107),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Fade-in animation for the logo
            AnimatedOpacity(
              duration: Duration(seconds: 3),
              opacity: _opacity,
              child: Image.asset("assets/images/logo.png"),
              curve: Curves.easeOut,
            ),
            // Circular Progress Indicator
            if (_showProgress)
              Positioned(
                top: MediaQuery.of(context).size.height * 0.7,
                key: UniqueKey(),
                child: Lottie.asset(
                  "assets/animations/bike.json",
                  width: 150,
                  height: 150,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
