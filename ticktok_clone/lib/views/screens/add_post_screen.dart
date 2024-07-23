

import 'package:flutter/material.dart';
import 'package:ticktok_clone/constants/constants.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center( 
        child: InkWell( 
          onTap: (){
            
          },
          child: Container( 
            alignment: Alignment.center,
            width: 190,
            height: 50,
            decoration: BoxDecoration( 
              color: buttonColor
            ),
            child: const Text(
              "Add Video",
              style: TextStyle( 
                color: Colors.black,
                fontSize: 20,fontWeight: FontWeight.bold 
              ),
            ),
          ),
        ),
      ),
    );
  }
}