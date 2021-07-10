
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  final String Msgto;

  NewMessage(this.Msgto);
   @override
   _NewMessageState createState() => _NewMessageState();
 }

 class _NewMessageState extends State<NewMessage> {
  final _controller =TextEditingController();
  String _entredMessage=" ";

  _sendMessage()async{
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    String ud=userData['username'];
    FirebaseFirestore.instance.collection('chat').add(
        {
          'text':_entredMessage,
          'createdAt':Timestamp.now(),
          'username':ud,
          'userId':user.uid,
          'Msgto':widget.Msgto,
        }
    );
   /* final userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    FirebaseFirestore.instance.collection('chat').add(
        {
          'text':_entredMessage,
          'createdAt':Timestamp.now(),
          'username':userData['username'],
          'userId':user.uid,
        }
    );*/
    _controller.clear();
    setState(() {
      _entredMessage="";

    });
  }
   @override
   Widget build(BuildContext context) {
     return Container(
       margin:EdgeInsets.only(top:8),
       padding:EdgeInsets.all(8),
       child:Row(
         children:[
           Expanded(child: TextField(

             controller:_controller,
             autocorrect:true,
             enableSuggestions:true,
             decoration:InputDecoration(
               enabledBorder: UnderlineInputBorder(
                 borderSide:BorderSide(color:Colors.black),
               ),
                 hintText:'Send a message...'),
             onChanged:(val){
               setState(() {
                 _entredMessage=val;

               });
             },
           )),
           IconButton(
             color:Colors.redAccent,
             icon:Icon(Icons.send),
             onPressed:_entredMessage.trim().isEmpty?null:_sendMessage,

           )
         ]
       )
     );
   }
 }
