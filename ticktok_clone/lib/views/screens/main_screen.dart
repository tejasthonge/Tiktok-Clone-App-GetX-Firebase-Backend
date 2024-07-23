import 'package:flutter/material.dart';
import 'package:ticktok_clone/constants/constants.dart';
import 'package:ticktok_clone/views/widgets/custum_icon_widge.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

  setIndex(int index){
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setIndex(value);
        },
        currentIndex:_pageIndex ,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: CustomIconWidge(),
            label: "",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Messages",
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),

        ],
      ),
      body: Center(child: pages[_pageIndex])
    );
  }
}
