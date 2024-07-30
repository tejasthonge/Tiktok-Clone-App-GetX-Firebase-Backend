




import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {

  String username;
  String comment;
  final datePublished;
  List likes;
  String profilePhoto;
  String uid;
  String id;

  CommentModel( 
    {
      required this.username,
      required this.comment,
      required this.datePublished,
      required this.likes,
      required this.profilePhoto,
      required this.uid,
      required this.id,

    }
  );

  Map<String, dynamic> toJson() =>{ 
    'username':username,
    'comment': comment,
    'datePublished': datePublished.millisecondsSinceEpoch,
    'likes': likes,
    'profilePhoto': profilePhoto,
    'uid': uid,
    'id': id,
  };


  static CommentModel fromSnapshot(DocumentSnapshot snapshot){
    
    final data = snapshot.data() as Map<String, dynamic>;
    return CommentModel(
      username: data['username']?? "",
      comment: data['comment'] ?? "",
      datePublished: DateTime.fromMillisecondsSinceEpoch(data['datePublished']),
      likes: data['likes'] ?? [],
      profilePhoto: data['profilePhoto'] ?? "",
      uid: data['uid'] ?? '',
      id: data['id']  ?? '',
    );
  }
}