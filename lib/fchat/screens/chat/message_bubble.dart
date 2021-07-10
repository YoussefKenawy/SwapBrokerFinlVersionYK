import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MessgaeBubble extends StatefulWidget {

  final String name;
  final String owner;
  final String sender;
  final String des;
  final String product;
  final String img;



  MessgaeBubble(this.name,this.owner,this.sender,this.des,this.product,this.img);

  @override
  _MessgaeBubbleState createState() => _MessgaeBubbleState();


}

class _MessgaeBubbleState extends State<MessgaeBubble> {


 int lin;
 String accept ="Accept";
 String refuse ="Refused";
 bool press = true;
 SharedPreferences prefs ;
 @override
 void initState() {
   super.initState();

   //getData();
 }

  saveData(String acc, String ref) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('accept',acc);
     prefs.setString('refuse',ref);
  }

  getData()async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      accept =prefs.getString('accept');
      refuse=prefs.getString('refuse');
    });
  }

    @override
    Widget build(BuildContext context) {
       return   Container(
         child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget>[
              Container(
                decoration:BoxDecoration(
                  color: Colors.lightBlueAccent[200],
                  borderRadius:BorderRadius.only(
                    topLeft:Radius.circular(14),
                    topRight:Radius.circular(14),
                    bottomLeft:Radius.circular(14),
                    bottomRight:Radius.circular(14),

                  ),
                ),
                  width:270,
                  height:760,
                  padding:EdgeInsets.symmetric(vertical:10,horizontal:16),
                  margin:EdgeInsets.symmetric(vertical:4,horizontal:8),

                child:  Column(
                    crossAxisAlignment: //!widget.isMe ? CrossAxisAlignment.start :
                    CrossAxisAlignment.end,
                    children:<Widget>[
                      Text(
                        " about :  "+ widget.des ,
                        style:TextStyle(color:Colors.black,fontSize:20,fontWeight:FontWeight.w900),
                      ),
                      Text(
                        " sender : " + widget.owner,
                        style:TextStyle(color:Colors.black,fontSize:20,fontWeight:FontWeight.w900),
                      ),
                      Text(
                        " product :  "+ widget.name ,
                        style:TextStyle(color:Colors.black,fontSize:20,fontWeight:FontWeight.w900),
                      ),

                      Container(
                        height:200,
                        width:300,
                        child: Card(
                            child:Image.network(widget.img)
                        ),
                      ),


                      RaisedButton(
                          color:Colors.green,

                            onPressed: () async {


                                      },



                                    /*  showDialog(
                                          context: context,
                                          builder: (_) => new AlertDialog(
                                            title: new Text(" Done "),
                                            content: new Text(" "),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text('Ok'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();

                                                },

                                              )
                                            ],
                                          ));*/








                              /* Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return Search4(widget.usname);
                                    }));*/


                         child:Text("OK",style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),)


                        ),






                      ]
                    ),
              )
            ]

          ),
       );


    }
}
