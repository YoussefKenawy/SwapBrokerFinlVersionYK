  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'message_bubble.dart';

class Messages extends StatefulWidget {
  final String owner;



  Messages(this.owner);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {


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
             .where("mode",isEqualTo:"x")
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
                     color: Color.fromRGBO(41, 30, 83, 1),
                       child: MessgaeBubble(
                           docs[index]['name'],
                           docs[index]['owner'],
                           docs[index]['user']['email'],
                           docs[index]['des'],
                           docs[index]['product'],
                           docs[index]['img']
                ),
                   )
            );
          });



  }
}
