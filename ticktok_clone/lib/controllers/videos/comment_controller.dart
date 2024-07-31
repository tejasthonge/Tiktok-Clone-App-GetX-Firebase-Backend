import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ticktok_clone/constants/constants.dart';
import 'package:ticktok_clone/models/comment_modal.dart';

class CommentController extends GetxController {
  final Rx<List<CommentModel>> _listComment = Rx<List<CommentModel>>([]);

  List<CommentModel> get listComment => _listComment.value;

  String _postID = "";
  updatePostID({required String postId}) {
    _postID = postId;
    getComment();
  }

  getComment() async {
    _listComment.bindStream(firestore
        .collection("videos")
        .doc(_postID)
        .collection("comments")
        .snapshots()
        .map((QuerySnapshot query) {
      List<CommentModel> retVal = [];

      for (var ele in query.docs) {
        retVal.add(CommentModel.fromSnapshot(ele));
      }
      return retVal;
    }));
  }

  //
  postComment({
    required String commentText,
  }) async {
    try {
      if (commentText.isNotEmpty) {
        EasyLoading.show(status: "Plsase waite");

        DocumentSnapshot userDoc = await firestore
            .collection("users")
            .doc(auth.currentUser!.uid)
            .get();
        var allDoc = await firestore
            .collection("videos")
            .doc(_postID)
            .collection("comments")
            .get();
        int len = allDoc.docs.length;
        String commentID = "comment $len";
        CommentModel commentModel = CommentModel(
            username: (userDoc.data() as dynamic)["username"],
            comment: commentText,
            datePublished: DateTime.now(),
            likes: [],
            profilePhoto: (userDoc.data() as dynamic)["imagUrl"],
            uid: auth.currentUser!.uid,
            id: commentID);

        await firestore
            .collection("videos")
            .doc(_postID)
            .collection("comments")
            .doc(commentID)
            .set(commentModel.toJson());

        // update comment count in video collection
        DocumentSnapshot comDoc =
            await firestore.collection("videos").doc(_postID).get();
        await firestore.collection("videos").doc(_postID).update(
            {"commentCount": (comDoc.data() as dynamic)["commentCount"] + 1});
        EasyLoading.showSuccess("Done");
      }
    } catch (e) {
      Get.snackbar(
          e.toString(), "Some Error occurred while Commting to the Video");
    }

    EasyLoading.dismiss();
  }

  likeComment(String id) async {
    var uid = authConttoller.user.uid;
    DocumentSnapshot doc = await firestore
        .collection('videos')
        .doc(_postID)
        .collection('comments')
        .doc(id)
        .get();

    if ((doc.data()! as dynamic)['likes'].contains(uid)) {
      await firestore
          .collection('videos')
          .doc(_postID)
          .collection('comments')
          .doc(id)
          .update({
        'likes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await firestore
          .collection('videos')
          .doc(_postID)
          .collection('comments')
          .doc(id)
          .update({
        'likes': FieldValue.arrayUnion([uid]),
      });
    }
  }
}
