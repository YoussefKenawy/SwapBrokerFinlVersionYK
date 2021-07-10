import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire99/fchat/accept.dart';
import 'package:fire99/showdetails.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




class MessgaeBubble2 extends StatefulWidget {

  /*final mob;
  final location;
  final time;*/
  final product2;
  final img2;
  final String name;
  final String owner;
  final String sender;
  final String des;
  final String product;
  final String img;



   MessgaeBubble2(
     //  this.mob,this.location,this.time,

       this.name,this.owner,this.sender,this.des,this.product, this.product2,this.img,this.img2);

  @override
  _MessgaeBubbleState createState() => _MessgaeBubbleState();


}

class _MessgaeBubbleState extends State<MessgaeBubble2> {


  int lin;
  String accept ="Accept";
  String refuse ="Refused";
  bool press = true;
  SharedPreferences prefs ;
  String ok="SHOW DETAILS";
  @override
  void initState() {
    super.initState();
    //getData();
    if(widget.des=='your order is accepted')
    {
      accept="SHOW DETAILS";
      refuse=" ";
    }
    if(widget.des=='your order is refused')
    {
      accept="";
      refuse="ok and delete";
    }
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
          mainAxisAlignment:  //MainAxisAlignment.center :
          MainAxisAlignment.start,
          children:<Widget>[
            Container(
              decoration:BoxDecoration(
                color:Colors.pink,
                //!widget.isMe ? Colors.lightBlueAccent[200]:
                //Theme.of(context).accentColor,
                borderRadius:BorderRadius.only(
                  topLeft:Radius.circular(14),
                  topRight:Radius.circular(14),
                  bottomLeft://widget.isMe ? Radius.circular(0) :
                  Radius.circular(14),
                  bottomRight://widget.isMe ? Radius.circular(0) :
                  Radius.circular(14),

                ),
              ),
              width:340,
              height:550,
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
                      " sender : " + widget.sender,
                      style:TextStyle(color:Colors.black,fontSize:20,fontWeight:FontWeight.w900),
                    ),
                    Text(
                      " product :  "+ widget.product ,
                      style:TextStyle(color:Colors.black,fontSize:20,fontWeight:FontWeight.w900),
                    ),

                    Container(
                      height:160,
                      width:300,
                      child: Card(
                        child:Image.network(widget.img)
                      ),
                    ),
                    Text(
                      " product2 :  "+ widget.product2 ,
                      style:TextStyle(color:Colors.black,fontSize:20,fontWeight:FontWeight.w900),
                    ),
                    Container(
                      height:160,
                      width:300,
                      child: Card(
                          child:Image.network(widget.img2)
                      ),
                    ),
                   /* Container(
                      height:200,
                      width:300,
                      child: Card(
                          child:Image.network(widget.img2)
                      ),
                    ),*/

                    RaisedButton(
                        color:Colors.deepPurple,

                        onPressed: () async {
                          if (accept != 'SHOW DETAILS') {
                            var currentUser =
                                FirebaseAuth.instance.currentUser;
                            final user = FirebaseAuth.instance.currentUser;
                            final userData = await FirebaseFirestore.instance
                                .collection('users').doc(user.uid).get();
                            String ud = userData['email'];
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return accept2
                                    (widget.owner, widget.sender,
                                      widget.product, widget.img,
                                      widget.product2, widget.img2);
                                }));

                            /*Firestore.instance.collection('order').document()
                              .setData({
                            'email': widget.email+"Accepted",
                            'money':widget.money+"Accepted",

                          });*/


                            /* Firestore.instance.collection('chat').where("email", isEqualTo:widget.email).get().then((snapshot){
                            snapshot.docs.last.reference.delete();

                          });*/
                          }


                          else if (accept == 'SHOW DETAILS') {


                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return showdetails(
                                      "your order is accepted",
                                      widget.img,
                                      widget.img2, widget.product,
                                      widget.product2);
                                }));
                            /* Firestore.instance.collection('chat').where("name", isEqualTo:widget.name).get().then((snapshot){
                              snapshot.docs.last.reference.delete();*/
                            // });
                          }





                          /* Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return Search4(widget.usname);
                                    }));*/


                        },
                      child:Text(accept,style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),)

                        ),

                   RaisedButton(
                     color:Colors.deepOrange,
                     onPressed:()async{
      var currentUser =
          FirebaseAuth.instance.currentUser;
     await Firestore.instance.collection('chat').document()

          .setData({
        "x":"x",
        'product':widget.product,
        'product2':widget.product2,
        'img2':widget.img2,
        'location': "",
        'name':widget.product,
        'des':'your order is refused',
        'owner':widget.sender,
        'sender':widget.owner,
        'img': widget.img,
        'mob': "",
        'category':"",
        'time': "",
        'notes': "",
        'user': {
          'uid': currentUser.uid,
          'email': currentUser.email,
          //   'name':currentUser.toString(),

        }
      });

      Firestore.instance.collection('chat').where("name", isEqualTo:widget.name).get().then((snapshot){
        snapshot.docs.last.reference.delete();
      });

                       if (refuse== 'ok and delete') {
                       Firestore.instance.collection('chat').
                       where("product2", isEqualTo: widget.product2)
                           .get()
                           .then((snapshot) {
                       snapshot.docs.first.reference.delete();
                       });
                       }
    },

                       child:Text(refuse,style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),)

                   )

    //                 Container(
    //                   child: RaisedButton(
    //                       color:Colors.pinkAccent,
    //
    //                       onPressed: () async {
    //
    //
    //
    //                         var currentUser =
    //                             FirebaseAuth.instance.currentUser;
    //                         // final user = FirebaseAuth.instance.currentUser;
    //                         final userData = await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get();
    //
    //                /*     Firestore.instance.collection('order').document()
    //     .setData({
    // 'adress': "your Order is Accepted",
    // 'city':" ",
    // 'product':widget.name2,
    // 'price':widget.price2,
    // 'descripion':" ",
    // 'img':"",
    // 'notes': " ",
    // 'Msgto':widget.username,
    // 'name':userData['username'],
    // 'user': {
    // 'uid': currentUser.uid,
    // 'email': currentUser.email,
    //
    // }
    //
    // });*/
    //
    //
    //
    // Firestore.instance.collection('order').where("", isEqualTo:userData['username'],).get().then((snapshot){
    // snapshot.docs.first.reference.delete();
    //
    //
    //                         });
    //                       },
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //                       child:Text("ok",style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),)
    //
    //
    //                   ),
    //                 ),


                  ]
              ),
            )
          ]

      ),
    );


  }
}
