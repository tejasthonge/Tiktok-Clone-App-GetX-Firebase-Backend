

// COLORS


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ticktok_clone/controllers/auth/auth_conttoler.dart';
import 'package:ticktok_clone/views/screens/add_vidieo_post/add_post_screen.dart';
import 'package:ticktok_clone/views/screens/home/home_screen.dart';
import 'package:ticktok_clone/views/screens/profile/profile_screen.dart';
import 'package:ticktok_clone/views/screens/search/search_screen.dart';

const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

//pages
var pages=[
  
  HomeScreen(),
  SearchScreen(),
  AddPostScreen(),
  Text("Message Screen"),
  ProfileScreen(uid: authConttoller.user.uid,),
];

//Firebase constants objects 

var auth = FirebaseAuth.instance;
var firestore = FirebaseFirestore.instance;
var firestoreStorage = FirebaseStorage.instance;



//Contorllers
var authConttoller = AuthController.instance;
