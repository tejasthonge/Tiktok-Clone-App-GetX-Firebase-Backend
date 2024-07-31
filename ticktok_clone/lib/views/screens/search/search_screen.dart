import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticktok_clone/constants/constants.dart';
import 'package:ticktok_clone/controllers/search/search_controller.dart';
import 'package:ticktok_clone/models/user_model.dart';
import 'package:ticktok_clone/views/screens/profile/profile_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final SearchControllerr _searchController = Get.put(SearchControllerr());
  final TextEditingController _serchedUsenameTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Scaffold(
        
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: TextField( 
              
        
              decoration: InputDecoration(
        
                hintText: "Search",
                hintStyle: TextStyle( 
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                border: InputBorder.none
        
              ),
              onSubmitted: (value) => _searchController.searchUser(typedUser: value),
            ),
          ),
        
        
          body: 
          _searchController.serchedUsers.isEmpty?
          Center( 
            child: Text( 
              "Search for users...", 
            ),
          ):
          
          ListView.builder(
            itemCount: _searchController.serchedUsers.length,
            itemBuilder: (context, index) {
              UserModel user = _searchController.serchedUsers[index];
              return InkWell( 
                onTap: () {
                  Get.to(()=>ProfileScreen(uid: user.uid));
                },
                child: ListTile( 
                  leading: CircleAvatar( 
                    backgroundImage: NetworkImage( 
                      user.imagUrl,
                    ),
                  ),
                  title: Text( 
                    user.username, 
                    style: TextStyle( 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            })
          
        );
      }
    );
  }
}