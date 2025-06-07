import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:motogenie_app/data_models/uihelper.dart';
import 'loginpage.dart';

class Signuppage extends StatefulWidget {
  Signuppage({required firstnameController, key});
  static TextEditingController firstnameController = TextEditingController();

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signUp(String email, String password) async {
    if (email == "" && password == "") {
      UiHelper.CustomAlertBox(context, "Enter Required Fields!");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((Value) {
              Future.delayed(Duration(seconds: 2));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Registered successfully"),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 2),
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            });
      } on FirebaseAuthException catch (ex) {
        UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // UiHelper.CustomImages(),
          Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            children: [
              Expanded(
                child: UiHelper.CustomTextField(
                  firstnameController,
                  "First name",
                  Icons.person_2,
                  false,
                ),
              ),
              Expanded(
                child: UiHelper.CustomTextField(
                  lastnameController,
                  "Last name",
                  Icons.person_2,
                  false,
                ),
              ),
            ],
          ),

          UiHelper.CustomTextField(
            phoneController,
            "Phone No.",
            Icons.phone,
            false,
          ),
          UiHelper.CustomTextField(emailController, "Email", Icons.mail, false),
          UiHelper.CustomTextField(
            passwordController,
            "Password",
            Icons.password,
            true,
          ),
          SizedBox(height: 20),

          /*  Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Container(
                width: MediaQuery.of(context).size.width/1.25,
                height: 60,
                child: UiHelper.CustomButton((){
                  signUp(emailController.text.toString(), passwordController.text.toString());
                }, "Sign Up"),
              ),
            ),*/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /* SizedBox(height: 50,width: 170,
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    }, child: Text("LogIn",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepOrange),)),
                  ),*/
              UiHelper.CustomButton(() {
                signUp(
                  emailController.text.toString(),
                  passwordController.text.toString(),
                );
              }, "Sign Up"),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
