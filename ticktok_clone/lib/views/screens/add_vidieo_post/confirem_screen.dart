

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticktok_clone/controllers/videos/upload_video_controller.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile ;
  final String videoPath;
  const ConfirmScreen({super.key,required this.videoFile, required this.videoPath});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  final UploadVideoController _uploadVideoController = Get.put(UploadVideoController());
  final TextEditingController _songNameTEC = TextEditingController();
  final TextEditingController _captionTEC = TextEditingController();

  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.file(widget.videoFile);
    _videoPlayerController.initialize();
    _videoPlayerController.play();
    _videoPlayerController.setVolume(1);
    _videoPlayerController.setLooping(true);
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column( 

        children: [ 
          const SizedBox( height: 40,),
           SizedBox(height: MediaQuery.of(context).size.height/1.5,
            width: MediaQuery.of(context).size.width,
            child: VideoPlayer( 
              _videoPlayerController
            ),
           ),
           const SizedBox(height: 30,),
           SingleChildScrollView( 
            child: Column( 

              children: [ 
                TextFormField( 
                  controller: _songNameTEC,
                  decoration: InputDecoration( 
                    labelText: 'Song Name',
                    icon: Icon(Icons.music_note)
                  ),
                ),
                TextFormField( 
                  controller: _captionTEC,
                  decoration: InputDecoration( 
                    labelText: 'Caption',
                    icon: Icon(Icons.closed_caption )
                  ),
                ),
                const SizedBox( height: 10,),
                ElevatedButton(onPressed:  (){

                  _uploadVideoController.uploadVideoInFireabase(songName: _songNameTEC.text.trim(), caption: _captionTEC.text.trim(), videoPath: widget.videoPath);
                }, child: Text("Share"))


              ],
            ),
           )
        ],
      ),
    );
  }
}