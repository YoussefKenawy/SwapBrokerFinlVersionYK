import 'package:fire99/messages/screens/home_screen.dart';
import 'package:flutter/material.dart';




class MyApp99 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}