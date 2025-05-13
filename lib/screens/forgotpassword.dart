
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motogenie_app/data_models/uihelper.dart';
import 'loginpage.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  forgotpassword(String email)async{
    if(email==""){
      return UiHelper.CustomAlertBox(context, "Enter An Email To Reset Password");
    }
    else{
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     // backgroundColor: Color(0xff14141d),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            UiHelper.CustomImages(),
            Center(child: Text("Reset Password",style: TextStyle(color: Colors.deepOrange,fontSize: 45,fontWeight:FontWeight.bold),)),
            SizedBox(height: 50,),
            UiHelper.CustomTextField(emailController, "Emails", Icons.mail, false),
            SizedBox(height: 30,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 50,width: 170,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                  }, child: Text("LogIn",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepOrange),)),
                ),
                UiHelper.CustomButton((){
                  forgotpassword(emailController.text.toString());
                }, 'Reset')
              ],)

          ],
        ),
      ),
    );
  }
}
