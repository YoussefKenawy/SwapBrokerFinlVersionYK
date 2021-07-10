import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:fire99/add_post.dart';
import 'package:fire99/login.dart';

class Action77 extends StatefulWidget{
  final name;
  final email;
  
 

  Action77(this.name, this.email, 
     );

  @override
 _Action_State createState() => _Action_State();
}

class _Action_State extends State<Action77> {
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body:Container(
                child:Column(
                  children: [
                   
                    Container(
                       height:120,
                       color:Colors.white38,
                      child: Card(
                         
                          child: Column(
                            children: [
                              Text(
                              widget.name,style:TextStyle(fontSize:26,color:Colors.black)),

                               Text(
                              widget.email,style:TextStyle(fontSize:20,color:Colors.red)),
                            ],
                          ),
                      ),
                    ),
                  // Text(widget.email,style:TextStyle(fontSize:20,color:Colors.blue)),
                   //Text(widget.name,style:TextStyle(fontSize:18,color:Colors.red)),
                  ],
                ),
               
              
          ),
          
      );
    
  }
}
