

import "package:cloud_firestore/cloud_firestore.dart";
import "package:get/get.dart";
import "package:ticktok_clone/constants/constants.dart";
import "package:ticktok_clone/models/video_model.dart";


class VideoController extends GetxController{

  final Rx<List<VideoModel>> _videoList = Rx<List<VideoModel>>([]); 
  List<VideoModel> get  videoList=>_videoList.value;


  @override
  void onInit() {
    super.onInit();
    _videoList.bindStream(
        firestore.collection('videos').snapshots().map((QuerySnapshot query) {
      List<VideoModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(
          VideoModel.fromSnapshot(element),
        );
      }
      return retVal;
    }));
  }
}