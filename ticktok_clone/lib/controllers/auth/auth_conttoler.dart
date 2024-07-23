import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ticktok_clone/constants/constants.dart';
import 'package:ticktok_clone/models/user_model.dart';

class AuthController extends GetxController {
  late Rx<File?> _pickedImage ;
  File? get pickedImage => _pickedImage.value;
  static AuthController instance = Get.find();
  void pickImage({required ImageSource source})async{
    XFile? pickedImage =  await ImagePicker().pickImage(source:source);
    if(pickedImage !=null){
      Get.snackbar("Profile Picture", "You have selected a profile picture successfully!");
    }else{
      Get.snackbar("Profile Picture", "You didn't select a profile picture!");
    }
    _pickedImage = Rx<File>(File(pickedImage!.path));
  }

  //resitor
  void registerUser({
    required String username,
    required String password,
    required String email,
    File? image,
  }) async {
    try {
      if (username.isNotEmpty &&
          password.isNotEmpty &&
          email.isNotEmpty &&
          image != null) {
        UserCredential userCredential = await auth
            .createUserWithEmailAndPassword(email: email, password: password);
        String imgUrl = await uplodProImage(image: image);

        await storeDatainFirebaseFirestore(
          userMode: UserModel(uid: userCredential.user!.uid, username: username, email: email, password: password, imagUrl: imgUrl)
        );

        Get.snackbar("Account Created Successfully", "please login now");

      }
      else {
        Get.snackbar("Please fill all fields", "try again");
      }
    } catch (e) {
      Get.snackbar("Some error Occured!", e.toString());
    }
  }

  Future<String> uplodProImage({required File image}) async {
    Reference ref =
        firestoreStorage.ref().child("profilePic").child(auth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  storeDatainFirebaseFirestore({
    required UserModel userMode
  }) async {
    DocumentReference ref =
        firestore.collection("user").doc(auth.currentUser!.uid);
    await ref.set(userMode.toJson());
  }


  void loginUser(
    {
      required String email,
      required String password,
    }
  )async{
    try {
      
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Login Succsefull!", "");
    }
    
    on FirebaseAuthException catch(e) {
      Get.snackbar(e.code, "Try again to login ");
    }

  }
}
