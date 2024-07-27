




import 'package:get/get.dart';
import 'package:ticktok_clone/models/comment_modal.dart';

class CommentController extends GetxController{ 

  final Rx<List<CommentModel>> _listComment =Rx<List<CommentModel>>([]);

  List<CommentModel> get listComment=> _listComment.value;

  String _postID = "";
  updatePostID({required String postId}){
    _postID = postId;
    getComment();
  }

  getComment()async{

  }

  //
  postComment({
    required String commentText,
  })async{

    
  }

}