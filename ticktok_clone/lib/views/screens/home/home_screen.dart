import 'package:flutter/material.dart';
import 'package:ticktok_clone/views/screens/home/widgets/circle_animation_widget.dart';
import 'package:ticktok_clone/views/screens/home/widgets/video_player_item.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  buildProfilePhoto({required String profilePhoto}) {
    return SizedBox( 
      width: 60,
      height: 60,
      child: Stack( 
        children: [ 
          Positioned(
            left: 5,
            child: Container( 
              height: 50,
              width: 50,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration( 
                color: Colors.white ,
                borderRadius: BorderRadius.circular(25),

              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular( 25),
                child: Image( 
                    fit: BoxFit.cover,
                
                  image: NetworkImage( 
                    profilePhoto,
                  ),
                ),
              ),
            ) )
        ],
      ),
    );
  }

  buildMusicAlbum({required String profilePhoto}){
    return SizedBox( width: 60,height: 60,
    
      child: Column( 
        children: [ 
          Container( 
            height: 50,
            width: 50,
            padding: EdgeInsets.all(11),
            decoration: BoxDecoration( 
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient( 
                colors: const [ 
                  Colors.grey,
                  Colors.white
                ]
              )
            ),
            child: ClipRRect( 
              borderRadius: BorderRadius.circular(25),
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(profilePhoto),),
            ),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Scaffold( 

      body: PageView.builder(
        itemCount:2 ,
        controller: PageController(initialPage: 0,viewportFraction: 1),
        scrollDirection: Axis.vertical,
        itemBuilder: ((context, index) {

        return Stack( 
          children: [ 
            // VideoPlayerItemWidget(videoUrl:"" ,),

            Column( 
              children: [ 
                const SizedBox( 
                  height: 100,
                ),
                Expanded(
                  child:Row( 
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(child:  Container(

                        margin: EdgeInsets.only(left: 20),
                        child: Column( 
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                          children: [ 
                           Text("userName",
                            style: TextStyle( 
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                           ),

                           Text("Caption",
                            style: TextStyle( 
                              fontSize: 15,
                              color: Colors.white,
                            ),
                           ),

                           Row( 
                            children: [ 
                              const Icon(Icons.music_note,
                                size: 20,
                                color: Colors.white,
                              ),
                                Text("song name",
                            style: TextStyle( 
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                           ),
                            ],
                           )
                          ],),
                      )
                      ),

                      Container( 
                        width: 100,
                        margin: EdgeInsets.only(top: size.height/5),

                        child: Column( 

                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [ 
                            buildProfilePhoto(profilePhoto: ""),
                           
                            Column( 
                              children: [ 
                                InkWell( 
                                  onTap: (){},
                                  child:  Icon(Icons.favorite,color: Colors.red,size: 40,),
                                ),
                                const SizedBox(height: 7,),
                                Text( 
                                  "2,333",
                                  style: TextStyle(fontWeight: FontWeight.w600,color:Colors.white),
                                ),

                           
                              ],
                            ),
                             Column( 
                              children: [ 
                                InkWell( 
                                  onTap: (){},
                                  child:  Icon(Icons.comment,color: Colors.white,size: 40,),
                                ),
                                const SizedBox(height: 7,),
                                Text( 
                                  "23",
                                  style: TextStyle(fontWeight: FontWeight.w600,color:Colors.white),
                                ),

                           
                              ],
                            ),
                             Column( 
                              children: [ 
                                InkWell( 
                                  onTap: (){},
                                  child:  Icon(Icons.reply,color: Colors.white,size: 40,),
                                ),
                                const SizedBox(height: 7,),
                                Text( 
                                  "4",
                                  style: TextStyle(fontWeight: FontWeight.w600,color:Colors.white),
                                ),

                           
                              ],
                            ),
                            CircularAnimetionWidget(childWidget: buildMusicAlbum(profilePhoto: ""),)
                          ],
                        ),

                      )
                    ],
                  )  
                )
              ],
            )
          ],
        );
      })),

    );
  }
}