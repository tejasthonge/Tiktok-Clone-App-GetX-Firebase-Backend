import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ticktok_clone/constants/constants.dart';
import 'package:ticktok_clone/models/video_model.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  Future<File?> _compressVideo({required String path}) async {
    final compressedVideo = await VideoCompress.compressVideo(
      path,
      quality: VideoQuality.MediumQuality,
    );
    return compressedVideo?.file;
  }

  Future<String> _uploadVideosToStorage({
    required String id,
    required String videoPath,
  }) async {
    final compressedVideo = await _compressVideo(path: videoPath);
    if (compressedVideo == null) {
      throw Exception("Video compression failed");
    }

    Reference ref = FirebaseStorage.instance.ref().child("videos").child(id);
    UploadTask uploadTask = ref.putFile(compressedVideo);
    TaskSnapshot taskSnapshot = await uploadTask;
    String videoUrl = await taskSnapshot.ref.getDownloadURL();
    return videoUrl;
  }

  Future<Uint8List?> _getThumbnail({required String path}) async {
    final thumbnail = await VideoCompress.getByteThumbnail(path);
    return thumbnail;
  }

  Future<String> _uploadVideoThumbnailToStorage({
    required String id,
    required String videoPath,
  }) async {
    final thumbnail = await _getThumbnail(path: videoPath);
    if (thumbnail == null) {
      throw Exception("Thumbnail generation failed");
    }

    Reference ref = FirebaseStorage.instance.ref().child("thumbnails").child(id);
    UploadTask uploadTask = ref.putData(thumbnail);
    TaskSnapshot taskSnapshot = await uploadTask;
    String thumbnailUrl = await taskSnapshot.ref.getDownloadURL();
    return thumbnailUrl;
  }

  Future<void> uploadVideoInFirebase({
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
      // Getting the videos id
      int len = allDocs.docs.length;
      String videoId = "video $len";

      // Uploading video to Firebase Storage and getting its URL
      String videoUrl = await _uploadVideosToStorage(
        id: videoId,
        videoPath: videoPath,
      );

      // Uploading thumbnail to Firebase Storage and getting its URL
      String thumbnailUrl = await _uploadVideoThumbnailToStorage(
        id: videoId,
        videoPath: videoPath,
      );

      VideoModel videoModel = VideoModel(
        username: (userDoc.data()! as Map<String, dynamic>)["username"],
        uid: uid,
        id: videoId,
        profilePhoto: (userDoc.data()! as Map<String, dynamic>)["imageUrl"],
        videoUrl: videoUrl,
        thumbnailUrl: thumbnailUrl,
        songName: songName,
        caption: caption,
        likes: [],
        commentCount: 0,
        shareCount: 0,
      );

      await firestore.collection("videos").doc(videoId).set(videoModel.toJson());
      EasyLoading.showSuccess("Successfully Uploaded video!");
    } catch (e) {
      log(e.toString());
      EasyLoading.showError(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}
