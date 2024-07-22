import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ticktok_clone/constants/constants.dart';
import 'package:ticktok_clone/firebase_options.dart';
import 'package:ticktok_clone/views/screens/auth/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clone',
     theme: ThemeData.dark().copyWith( 
      scaffoldBackgroundColor: backgroundColor
     ),
      home: LoginScreen(),
    );
  }
}
