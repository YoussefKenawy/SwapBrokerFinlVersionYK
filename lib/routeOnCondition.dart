import 'package:fire99/home.dart';
import 'package:fire99/saveCredentials.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dashboard.dart';

Future routeOnCondition({BuildContext context, bool isRememberMe}) async {
  if (isRememberMe) {
    String email = await getEmail();
    String password = await getPassword();

    //do the login automatically and push to the dashboard.

    try {
      var result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (result != null) {
        // pushReplacement
        print('welcome');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
    } on PlatformException catch (err) {
      var msg = "Something went wrong, please try again.";
      if (err != null) {
        msg = err.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    } on FirebaseAuthException catch (err) {
      var msg = "Something went wrong, please try again.";
      if (err != null) {
        msg = err.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    }
  }
}
