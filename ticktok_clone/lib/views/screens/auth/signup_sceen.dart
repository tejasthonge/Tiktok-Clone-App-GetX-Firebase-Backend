

import 'package:flutter/material.dart';
import 'package:ticktok_clone/constants/constants.dart';
import 'package:ticktok_clone/views/widgets/text_input_fields.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _userNameTEC = TextEditingController();
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
              "Sign Up",
              style: TextStyle( 
                fontSize: 25,
                fontWeight: FontWeight.w900
              )
            ),
            const SizedBox(height: 20,),
            Stack( 

              children: [ 
                CircleAvatar( 
                  radius: 65,
                  backgroundImage: NetworkImage( 
                    // 'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQNvWDvQb_rCtRL-p_w329CtzHmfzfWP0FIw&s"
                  ),
                ),
                Positioned( 
                  bottom: -5,
                  right: -4,
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo,color:Colors.grey)),
                )
              ],
            ),
            const SizedBox(height: 10,),

             Container(
              
              // height: 40,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: TextInputField(controller:_userNameTEC  ,lebelText: "User Name",prefixIconData: Icons.person,),

            ),
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
                child: Text("Registor",
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
                Text("Already have an Account!",),
                TextButton(onPressed: (){}, child: Text("Login?"))
              ],
            )
            

          ],
        ),
      ),
    );
  }
}