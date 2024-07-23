

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

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    username: json['username'],
    email: json['email'],
    password: json['password'],
    imagUrl: json['imagUrl'],
    uid: json['uid'],
  );
 }