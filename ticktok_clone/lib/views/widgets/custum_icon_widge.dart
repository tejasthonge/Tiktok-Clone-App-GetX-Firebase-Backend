import 'package:flutter/material.dart';

class CustomIconWidge extends StatelessWidget {
  const CustomIconWidge({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 45,
      child: Stack(
        children: [
          Container(
            width: 38,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(
                255,
                250,
                45,
                108,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          Container(
            width: 38,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(
                255,
                32,
                211,
                234,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          Center(
            child: Container(
              width: 38,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
