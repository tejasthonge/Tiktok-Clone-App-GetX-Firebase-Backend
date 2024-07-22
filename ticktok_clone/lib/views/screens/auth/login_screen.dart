

import 'package:flutter/material.dart';
import 'package:ticktok_clone/constants/constants.dart';
import 'package:ticktok_clone/views/screens/auth/signup_sceen.dart';
import 'package:ticktok_clone/views/widgets/text_input_fields.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("TickTok Clone",
              style: TextStyle( 
                color: buttonColor,
                fontSize: 35,
                fontWeight: FontWeight.w900
              ),
            ),
            const Text(
              "Login",
              style: TextStyle( 
                fontSize: 25,
                fontWeight: FontWeight.w900
              )
            ),
            const SizedBox(height: 40,),
            Container(
              
              // height: 40,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: TextInputField(controller:_emailTEC  ,lebelText: "Email",prefixIconData: Icons.email,),

            ),
            Container(
              
              // height: 40,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: TextInputField(controller:_passwordTEC  ,isObscure: true,lebelText: "Password",prefixIconData: Icons.lock,),

            ),
            const SizedBox( 
              height: 30,
            ),
            InkWell(

              enableFeedback: false,  //due to that background color when pressing the button is removed
              onTap: (){

              },
              child: Container( 
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width -40,
                height: 50,
                decoration: BoxDecoration( 
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(5),
                ), 
                child: Text("Login",
                  style: TextStyle( 
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                Text("Dont\'t Have an Account?",),
                TextButton(onPressed: (){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>SignupScreen(),
                    ),
                  );
                }, child: Text("Create Account "))
              ],
            )
            

          ],
        ),
      ),
    );
  }
}