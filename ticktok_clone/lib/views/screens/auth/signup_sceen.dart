

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ticktok_clone/constants/constants.dart';
import 'package:ticktok_clone/views/screens/auth/login_screen.dart';
import 'package:ticktok_clone/views/widgets/text_input_fields.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _userNameTEC = TextEditingController();
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 150,),
            
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
          
                      authConttoller.pickedImage ==null?
                      const CircleAvatar( 
                        radius: 65,
                        backgroundImage:
                          
                         NetworkImage( 
                          // 'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQNvWDvQb_rCtRL-p_w329CtzHmfzfWP0FIw&s"
                        ),
                      ):SizedBox( 
                        height:130 ,
                        width: 130,
                        child: ClipRRect( 
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            fit: BoxFit.cover,
                            authConttoller.pickedImage!,
          
                          )
                        ),
                      ),
                      Positioned( 
                        bottom: -5,
                        right: -4,
                        child: IconButton(onPressed:()=>authConttoller.pickImage(source: ImageSource.gallery), icon: const Icon(Icons.add_a_photo,color:Colors.grey)),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
            
                   Container(
                    
                    // height: 40,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: TextInputField(controller:_userNameTEC  ,lebelText: "User Name",prefixIconData: Icons.person,),
            
                  ),
                  Container(
                    
                    // height: 40,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: TextInputField(controller:_emailTEC  ,lebelText: "Email",prefixIconData: Icons.email,),
            
                  ),
                  Container(
                    
                    // height: 40,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: TextInputField(controller:_passwordTEC  ,isObscure: true,lebelText: "Password",prefixIconData: Icons.lock,),
            
                  ),
                  const SizedBox( 
                    height: 30,
                  ),
                  InkWell(
            
                    enableFeedback: false,  //due to that background color when pressing the button is removed
                    onTap: (){
                      authConttoller.registerUser(username: _userNameTEC.text.trim(), password: _passwordTEC.text.trim(), email: _emailTEC.text.trim(),image: authConttoller.pickedImage) ;
                    },
                    child: Container( 
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width -40,
                      height: 50,
                      decoration: BoxDecoration( 
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(5),
                      ), 
                      child: const Text("Sign Up",
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
                      const Text("Already have an Account!",),
                      TextButton(onPressed: (){
                        Get.off(LoginScreen());
            
                      }, child: const Text("Login?"))
                    ],
                  )
                  
            
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}