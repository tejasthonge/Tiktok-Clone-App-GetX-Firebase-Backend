import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ticktok_clone/constants/constants.dart';
import 'package:ticktok_clone/controllers/auth/auth_conttoler.dart';
import 'package:ticktok_clone/firebase_options.dart';
import 'package:ticktok_clone/views/screens/auth/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  ).whenComplete(() {
    Get.put(AuthController());  // by using this we are trying to do that as intilise the fireabse the we are intilies auth controller the resion is all this authitentiction depends on the firebase 
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clone',
     theme: ThemeData.dark().copyWith( 
      scaffoldBackgroundColor: backgroundColor
     ),
      home: LoginScreen(),
    builder: EasyLoading.init()
    );
  }
}
