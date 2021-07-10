
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_screen.dart';
import 'chat_screen.dart';

class main2 extends StatelessWidget {

  final String Msgto;
  main2(this.Msgto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder(
        stream:FirebaseAuth.instance.authStateChanges(),
        builder:(ctx,snapShot){
          if(snapShot.hasData){
            return ChatScreen(Msgto);
          }
          else
            {
              return AuthScreen();
            }
        }
      )
    );
  }
}
