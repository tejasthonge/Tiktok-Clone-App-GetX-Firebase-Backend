

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ticktok_clone/constants/constants.dart';
import 'package:ticktok_clone/controllers/videos/comment_controller.dart';
import 'package:ticktok_clone/models/comment_modal.dart';
import 'package:ticktok_clone/models/user_model.dart';
import 'package:timeago/timeago.dart' as tago;
class CommentScreen extends StatefulWidget {
  final String id;
  const CommentScreen({super.key, required this.id});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  late TextEditingController _commentTEC;
  
  @override
  void initState() {
    super.initState();
    _commentTEC = TextEditingController();
    _commentController.updatePostID(postId: widget.id);
  }


  final  CommentController _commentController = Get.put(CommentController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(

      body: SingleChildScrollView( 

        child: SizedBox( 
          height: size.height,
          width: size.width,


          child:  Column( 
            children: [ 
              Expanded(
                child:  Obx(
                  () {
                    return ListView.builder(
                      itemCount:_commentController.listComment.length,
                      itemBuilder: (context,index){ 
                        CommentModel commentModel = _commentController.listComment[index];
                      return ListTile( 
                    
                        leading:  CircleAvatar( 
                          backgroundColor: Colors.black,
                          backgroundImage: NetworkImage(
                            commentModel.profilePhoto
                          ),
                    
                        ),
                        title: Row( 
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ 
                            Text(
                              
                              commentModel.username,
                            
                              style: TextStyle( 
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            const SizedBox(width: 20,),
                            SizedBox(
                              width: 100,
                              child: Text(commentModel.comment,
                                style: TextStyle( 
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500
                              ),
                                ),
                            ),
                          ],
                        ),
                    
                        subtitle: Row( 
                    
                          children: [ 
                            Text(
                              tago.format(commentModel.datePublished),
                              style: TextStyle( 
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                            const SizedBox(width: 20,),
                                   Text(
                              "${commentModel.likes.length.toString()} likes",
                              style: TextStyle( 
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: (){
                            _commentController.likeComment(commentModel.id);
                          },
                          child: 
                              commentModel.likes.contains(auth.currentUser!.uid)?
                          Icon(Icons.favorite,
                            color:
                             Colors.red
                             ,
                          
                          ):
                          Icon(Icons.favorite_border,
                            color:
                             Colors.grey
                             ,
                          
                          )),
                      );
                    });
                  }
                )
              
              ),
              const Divider(),
              ListTile(
                title: TextFormField(
                  controller: _commentTEC,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Comment',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                trailing: TextButton(
                  onPressed: (){
                    _commentController.postComment(commentText: _commentTEC.text.trim());

                  },
                      // commentController.postComment(_commentTEC.text),
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ], 
          ),
        ),
      ),

    );
  }
}