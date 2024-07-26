



import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItemWidget extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerItemWidget({super.key, required this.videoUrl});

  @override
  State<VideoPlayerItemWidget> createState() => _VideoPlayerItemWidgetState();
}

class _VideoPlayerItemWidgetState extends State<VideoPlayerItemWidget> {
  late VideoPlayerController videoPlayerController ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController =  VideoPlayerController.network(
      widget.videoUrl 
    )..initialize().then((value) {
      videoPlayerController.play();
      videoPlayerController.setVolume(1);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      
      width: size.width,
      height: size.height,
      decoration: BoxDecoration( 
        color: Colors.black
      ),
      child: VideoPlayer(
        videoPlayerController
      ),

    );
  }
}