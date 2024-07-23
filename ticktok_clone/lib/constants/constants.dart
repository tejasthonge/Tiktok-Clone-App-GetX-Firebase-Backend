

// COLORS


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ticktok_clone/controllers/auth/auth_conttoler.dart';

const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;


//Firebase constants objects 

var auth = FirebaseAuth.instance;
var firestore = FirebaseFirestore.instance;
var firestoreStorage = FirebaseStorage.instance;



//Contorllers
var authConttoler = AuthController.instance;
