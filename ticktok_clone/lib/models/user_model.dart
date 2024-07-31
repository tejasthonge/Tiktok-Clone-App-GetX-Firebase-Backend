

 import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{

  String username;
  String email;
  String password;
  String imagUrl;
  String uid;

  UserModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.password,
    required this.imagUrl,

  });

  Map<String, dynamic> toJson() {
    return {
      'uid' : uid,
      'username': username,
      'email': email,
      'password': password,
      'imagUrl': imagUrl,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return UserModel(
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      password: data['password'] ?? '',
      imagUrl: data['imagUrl'] ?? '',
      uid: data['uid'] ?? '',
    );
  }
 }