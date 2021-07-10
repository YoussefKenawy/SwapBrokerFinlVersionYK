import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'message_bubble2.dart';

class Messages2 extends StatefulWidget {
  final String owner;


  Messages2(this.owner);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages2> {


  getData()async{

    CollectionReference usersref =FirebaseFirestore.instance.collection('users');
    await usersref.get().then((value){
      value.docs.forEach((element)
      {
        print(element.data);
      });
    });

  }


  @override
  Widget build(BuildContext context) {

    return  StreamBuilder(
        stream: FirebaseFirestore.instance.collection('chat')
        // .snapshots(),
        //  .orderBy('username', descending: true)
          .where("owner",isEqualTo:widget.owner)
          // .where("mode",isNotEqualTo:"x")
          // .where("des",isNotEqualTo:"your order is accepted")
            .snapshots(),

        //.orderBy('createdAt', descending: true)
        //.snapshots(),
        // . where("username",isEqualTo:Msgto).snapshots(),
        // . where( 'username' == Msgto )
        //.orderBy('username', descending: true)
        //.snapshots(),
        //.where("username",isEqualTo:IsMe).snapshots(),
        //.where("username",isEqualTo:Msgto) .snapshots(),
        // .where("username",isEqualTo:'kaiba' )
        builder:(ctx,snapShot){
          if(snapShot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          final docs =snapShot.data.docs;
          int len=docs.length;
          final user = FirebaseAuth.instance.currentUser;
          return ListView.builder(
              reverse:true,
              itemCount:docs.length,
              itemBuilder:(ctx,index)=>
              /* Container(
                      padding:EdgeInsets.all(8),
                   child:Text( docs[index]['adress']),
                    ),*/
              Container(

                child: MessgaeBubble2(

                /*  docs[index]['mob']??"x",
                  docs[index]['location']??"x",
                  docs[index]['time']??"x",*/

                  docs[index]['name'],
                  docs[index]['owner'],
                  docs[index]['user']['email'],
                  docs[index]['des'],
                  docs[index]['product'],
                  docs[index]['product2'],
                  docs[index]['img'],
                 docs[index]['img2']

                ),
              )
          );
        });



  }
}
