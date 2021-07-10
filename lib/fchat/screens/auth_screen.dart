  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'AuthForm.dart';

class AuthScreen extends StatefulWidget {


  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final _auth =FirebaseAuth.instance;

  bool isLoading=false;


  void _submitAuthForm(String email,String password, String username, bool isLogin, BuildContext ctx) async{
    UserCredential authResult;
    try {

      setState(() {
        isLoading=true;
      });
      if(isLogin){
         authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      }
      else{
        authResult  = await _auth.createUserWithEmailAndPassword(email: email, password: password);

         await  FirebaseFirestore.instance.collection('users').doc(authResult.user.uid).set({
          'username':username,
          'password':password,
          // 'img_url':url,
        });

      }

    }
    on FirebaseAuthException catch(e){

      String message = "error Occurred";
      if(e.code =="weak-password"){
        message= 'the password is too weak';
      }
      else if(e.code =='email-already-in-use'){
        message ='the account is already exist for that email';

      }

      else if(e.code =='user-not-found'){
        message= 'User not found';

      }
      else if(e.code =='wrong-password'){
        message ='that is Wrong password' ;

      }

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content:Text(message,style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),),
          backgroundColor:Colors.black));

      setState(() {
        isLoading=false;
      });
    }
    catch(e){
      print(e);
      setState(() {
        isLoading=false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.redAccent,
      body:AuthForm(_submitAuthForm,isLoading),
    );
  }
}
