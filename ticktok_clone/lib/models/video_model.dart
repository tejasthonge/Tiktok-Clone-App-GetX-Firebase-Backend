

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class VideoModel {

  String username;
  String uid;
  String id;
  String profilePhoto;

  String videoUrl;
  String thumbnailUrl;
  String songName;
  String caption;

  List likes;
  int commentCount;
  int shareCount;

  VideoModel({ 
    required this.username,
    required this.uid,
    required this.id,
    required this.profilePhoto,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.songName,
    required this.caption,
    required this.likes,
    required this.commentCount,
    required this.shareCount,
  });


  Map<String,dynamic> toJson()=>{
    "username":username,
    "uid": uid,
    "id": id,
    "profilePhoto": profilePhoto,
    "videoUrl": videoUrl,
    "thumbnailUrl": thumbnailUrl,
    "songName": songName,
    "caption": caption,
    "likes": likes,
    "commentCount": commentCount,
    "shareCount": shareCount,

  };

  static VideoModel fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return VideoModel(
      username: data['username'] as String,
      uid: data['uid'] as String,
      id: data['id'] as String,
      profilePhoto: data['profilePhoto'] as String,
      videoUrl: data['videoUrl'] as String,
      thumbnailUrl: data['thumbnailUrl'] as String,
      songName: data['songName'] as String,
      caption: data['caption'] as String,
      likes: data['likes'] as List<String>,
      commentCount: data['commentCount'] as int,
      shareCount: data['shareCount'] as int,
    );
  }
  
  
}