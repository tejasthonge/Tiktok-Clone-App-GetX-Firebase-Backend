import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ticktok_clone/constants/constants.dart';
import 'package:ticktok_clone/models/video_model.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
    Future<File> _compressVideo({required String path}) async {
    final MediaInfo? compressedVideo = await VideoCompress.compressVideo(
      path,
      quality: VideoQuality.LowQuality,
    );
    if (compressedVideo == null || compressedVideo.file == null) {
      throw Exception("Failed to compress video");
    }
    return compressedVideo.file!;
  }

  Future<String> _uploadVideosToStorage({
    required String id,
    required String videoPath,
  }) async {
    Reference ref = firestoreStorage.ref().child("videos").child(id);

    // Ensure the compressed video file is obtained
    File compressedVideoFile = await _compressVideo(path: videoPath);
    UploadTask uploadTask = ref.putFile(compressedVideoFile);

    TaskSnapshot taskSnapshot = await uploadTask;
    String videoUrl = await taskSnapshot.ref.getDownloadURL();
    return videoUrl;
  }



  _getThubnail({required String path}) async {
    final thumbnail = await VideoCompress.getFileThumbnail(path);
    return thumbnail;
  }

  _uploadVideoThumbnailToStorage(
      {required String id, required String videoPath}) async {
    Reference ref = firestoreStorage.ref().child("thubnails").child(id);
    UploadTask uploadTask = ref.putFile(await _getThubnail(path: videoPath));
    TaskSnapshot taskSnapshot = await uploadTask;
    String thubnailUrl = await taskSnapshot.ref.getDownloadURL();
    return thubnailUrl;
  }

  uploadVideoInFireabase({
    required String songName,
    required String caption,
    required String videoPath,
  }) async {
    EasyLoading.show();
    try {
      String uid = auth.currentUser!.uid;

      DocumentSnapshot userDoc =
          await firestore.collection("users").doc(uid).get();
      var allDocs = await firestore.collection("videos").get();
      //geting the videos id
      int len = allDocs.docs.length;
      String videoId = "video $len";
      // uploading video to firebase storage and getting its url
      String videoUlr = await _uploadVideosToStorage(
        id: videoId,
        videoPath: videoPath,
      );

      String thubnailUrl = await _uploadVideoThumbnailToStorage(
        id: videoId,
        videoPath: videoPath,
      );
      VideoModel videoModel = VideoModel(username: (userDoc.data()! as Map<String,dynamic>)["username"], uid: uid, id: videoId, profilePhoto:  (userDoc.data()! as Map<String,dynamic>)["imagUrl"], videoUrl: videoUlr, thumbnailUrl: thubnailUrl, songName: songName, caption: caption, likes: [], commentCount: 0, shareCount: 0);

      await firestore.collection("videos").doc(videoId).set(videoModel.toJson());
      EasyLoading.showSuccess("Successfully Uploaded video!");
      EasyLoading.dismiss();
      Get.back();

     } catch (e) {
      
      log(e.toString());
      print("--------------------------------");

      EasyLoading.showError(e.toString());
      EasyLoading.dismiss();
     }
  }
}
