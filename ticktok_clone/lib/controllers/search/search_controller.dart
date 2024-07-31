
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ticktok_clone/constants/constants.dart';
import 'package:ticktok_clone/models/user_model.dart';

class SearchControllerr extends GetxController{

  final Rx<List<UserModel>> _serchedUsers = Rx<List<UserModel>>([]);

  List<UserModel> get serchedUsers => _serchedUsers.value;


  searchUser({required String typedUser}){
    _serchedUsers.bindStream(
      firestore.collection("users").where(
        "username", isGreaterThanOrEqualTo: typedUser
      ).snapshots().map((QuerySnapshot query) {
        List<UserModel>  listUser =[];
        for (var element in query.docs){
          listUser.add(UserModel.fromSnapshot(element));
        }
        return listUser;
      })
    );
  }

}
