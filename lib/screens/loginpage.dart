import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motogenie_app/bottom_navigation.dart';
import 'package:motogenie_app/screens/forgotpassword.dart';
import 'package:motogenie_app/screens/signuppage.dart';
import 'package:motogenie_app/data_models/uihelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Please fill in all fields",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Future.delayed(Duration(seconds: 2));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Login Successful",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.green.shade500,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
      );
    } on FirebaseAuthException catch (ex) {
      print("🔥 FirebaseAuthException Code: ${ex.code}");
      print("🔥 FirebaseAuthException Message: ${ex.message}");

      String errorMessage;

      switch (ex.code) {
        case 'user-not-found':
          errorMessage = "This email ID is not registered";
          break;
        case 'wrong-password':
        case 'invalid-credential':
          errorMessage = "Incorrect email or password";
          break;
        case 'invalid-email':
          errorMessage = "Invalid email address";
          break;
        case 'user-disabled':
          errorMessage = "This user account has been disabled";
          break;
        default:
          errorMessage = "Unexpected error: ${ex.message}";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            errorMessage,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UiHelper.CustomImages(),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: Column(
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  UiHelper.CustomTextField(
                    emailController,
                    "Email",
                    Icons.mail,
                    false,
                  ),
                  UiHelper.CustomTextField(
                    passwordController,
                    "Password",
                    Icons.password,
                    true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPassword(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      UiHelper.CustomButton(() {
                        login(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                      }, "LogIn"),
                      SizedBox(
                        height: 50,
                        width: 170,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            shadowColor: Colors.deepOrange.shade200,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              showDragHandle: true,
                              isScrollControlled: true,
                              context: context,
                              builder:
                                  (context) =>
                                      Signuppage(firstnameController: null),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  UiHelper.CustomLogin(),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      "🇮🇳 App Proudly made in India",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
