

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:ticktok_clone/constants/constants.dart';
import 'package:ticktok_clone/views/screens/add_vidieo_post/confirem_screen.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  pickVideo({required ImageSource source, required BuildContext context})async{
    XFile? _addedVideo =await ImagePicker().pickVideo(source: source);
    if(_addedVideo != null){
      Get.to(()=>ConfirmScreen(
        videoFile: File(_addedVideo.path),
        videoPath: _addedVideo.path,
      ));
    }else{
      Get.snackbar("Video Not Added", "please add a video");
    }
  }

  showOptionsDilogOption({required BuildContext context}){
    return showDialog(context: context, builder: (context){
      return SimpleDialog(
         

        children: [ 
          SimpleDialogOption( 
            onPressed: (){
              pickVideo(source: ImageSource.gallery, context: context);
              Navigator.of(context).pop();

            },
            child:const Row( 
              children: [ 
                Icon(Icons.image),
                 SizedBox(width: 7,),
                Text("Gallery",style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
           SimpleDialogOption( 
            onPressed: (){
              pickVideo(source: ImageSource.camera, context: context);
              Navigator.of(context).pop();
            },
            child:const Row( 
              children: [ 
                Icon(Icons.camera),
                SizedBox(width: 7,),
                Text("Camera",style: TextStyle(fontSize: 20),)
              ],
            ),
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center( 
        child: InkWell( 
          onTap: ()=>showOptionsDilogOption(context: context),
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