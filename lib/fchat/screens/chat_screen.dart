import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:fire99/adsManger.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'chat/messages.dart';
import 'chat/new_message.dart';

class ChatScreen extends StatefulWidget {

  final String owner;


  ChatScreen(this.owner);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>

{
 // final _nativeAd=NativeAdmobController();


  @override
  void initState(){
    super.initState();


    /*final fbm=FirebaseMessaging();
    fbm.requestNotificationPermissions();
    fbm.configure(onMessage :(msg){
      print(msg);
      return;
    },
      onLaunch:(msg){
      print(msg);
      return;
      },

      onResume:(msg){
      print(msg);
      return;
      }
    );*/
  }
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userData = FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    return Scaffold(
      backgroundColor: Color.fromRGBO(41, 30, 83, 1),
      appBar: AppBar(
        title:

        Center(child: Row(
          children: [
            SizedBox(
                width:40
            ),
            Text('   Fire cash', style: TextStyle(
                color: Colors.white,fontWeight:FontWeight.w900,
                fontStyle: FontStyle.italic,
                fontSize: 20)),
            Text('& guide', style: TextStyle(
                color: Colors.white,fontWeight:FontWeight.w900,
                fontStyle: FontStyle.italic,
                fontSize: 20)),
          ],
        )),
        backgroundColor:Colors.blue[900],
        elevation: 6,

      ),

        body:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
               Color.fromRGBO(41, 30, 83, 1),
                Colors.indigo,
              ])),
            child: Column(
              children:[

              /*  Container(
                    width:290,
                    height:80,
                    child:NativeAdmob(
                      adUnitID:AdsManger.nativeAdunit,
                      numberAds:3,
                      controller: _nativeAd,
                      type:NativeAdmobType.banner,
                    )
                ),*/

                SizedBox(
                  height:5,
                ),
                Text( "Notification",style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900),),
                SizedBox(
                  height:5,
                ),

                SizedBox(
                  height:5,
                ),
                Expanded(
                    child:
                    Container(child: Messages(widget.owner)),
                ),
                SizedBox(
                  height:10,
                ),
              //NewMessage(widget.Msgto),
              ]

            ),

        ),



    );
  }
  Widget displayUser(context,snapshot){
    final docs =snapshot.data.docs;
    final user = FirebaseAuth.instance.currentUser;
    Key key;
    key=docs[snapshot].documentID;
   // key:ValueKey(docs[index].documentID),
  }

}

