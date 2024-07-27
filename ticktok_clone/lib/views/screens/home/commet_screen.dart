

import 'package:flutter/material.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

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
                child:  ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context,index){ 
                  return ListTile( 

                    leading:  CircleAvatar( 
                      backgroundColor: Colors.black,
                      backgroundImage: NetworkImage(""),

                    ),
                    title: Row( 
                      children: [ 
                        Text("User name",
                          style: TextStyle( 
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        Text("Comt disc",
                          style: TextStyle( 
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                        ),
                          ),
                      ],
                    ),

                    subtitle: Row( 

                      children: [ 
                        Text(
                          "date",
                          style: TextStyle( 
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        const SizedBox(width: 20,),
                               Text(
                          "12 likes",
                          style: TextStyle( 
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                    trailing: InkWell(
                      onTap: (){},
                      child: Icon(Icons.favorite,
                        color: Colors.red,
                      
                      )),
                  );
                })
              
              )
            ], 
          ),
        ),
      ),
    );
  }
}