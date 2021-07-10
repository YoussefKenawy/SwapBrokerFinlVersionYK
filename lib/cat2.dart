import 'package:fire99/P3.dart';
import 'package:fire99/P4.dart';
import 'package:fire99/p2.dart';
import 'package:fire99/p5.dart';
import 'package:fire99/posts2.dart';
import 'package:fire99/posts3.dart';
import 'package:fire99/posts4.dart';
import 'package:fire99/posts5.dart';
import 'package:fire99/posts6.dart';
import 'package:flutter/material.dart';


class cat2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

          body:
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  // Colors.white,
                  Colors.black,
                  // Colors.cyanAccent,

                  // Colors.lightBlueAccent,
                  Colors.black,
                ])),
            child: ListView(
              children:<Widget> [
                Container(
                  child: SizedBox(
                    height:30,
                  ),
                ),
                Container(

                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          // Colors.white,
                          Colors.black,
                          // Colors.lightBlueAccent,

                          // Colors.lightBlueAccent,
                          Colors.black,
                        ])),
                    height:60,
                    child: Column(
                      children: [

                        SizedBox(
                          height:4,
                        ),
                        Center(child: Text("Select Class",style:TextStyle(color:Colors.white,fontSize:25,fontWeight:FontWeight.w700))),
                      ],
                    )),

              //  Center(child: Text("~~~~~~~~~",style:TextStyle(color:Colors.red,fontSize:24,fontStyle:FontStyle.italic))),
                SizedBox(
                  height:10,
                ),
                Container(
                  width:170,
                  height:100,
                  child: InkWell(
                    child: Card(
                        color:Colors.black,
                        child:ListView(
                          scrollDirection: Axis.horizontal,
                          children:<Widget>[
                            SizedBox(
                              width:50,
                            ),
                            Center(child: Text("A",style:TextStyle(color:Colors.white,fontSize:26,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold))),
                            SizedBox(
                              width:60,
                            ),
                            Image.asset('assets/aaa.jfif'),
                          ],
                        )
                    ),
                    onTap:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return p2();
                          }));
                    },
                  ),
                ),

                Container(
                  width:170,
                  height:100,
                  child: InkWell(
                    child: Card(
                        color:Colors.black,
                        child:ListView(
                          scrollDirection: Axis.horizontal,
                          children:<Widget>[
                            SizedBox(
                              width:50,
                            ),
                            Center(child: Text("B",style:TextStyle(color:Colors.white,fontSize:28,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold))),
                            SizedBox(
                              width:60,
                            ),
                            Image.asset('assets/bbb.png'),
                          ],
                        )
                    ),
                    onTap:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return p3();
                          }));
                    },
                  ),
                ),

                Container(
                  width:170,
                  height:100,
                  child: InkWell(
                    child: Card(
                        color:Colors.black,
                        child:ListView(
                          scrollDirection: Axis.horizontal,
                          children:<Widget>[
                            SizedBox(
                              width:50,
                            ),
                            Center(child: Text("C",style:TextStyle(color:Colors.white,fontSize:28,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold))),
                            SizedBox(
                              width:60,
                            ),
                            Image.asset('assets/ccc.jfif'),
                          ],
                        )
                    ),
                    onTap:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return p4();
                          }));
                    },
                  ),
                ),
                SizedBox(
                  width:40,
                ),
                Container(
                  width:170,
                  height:100,
                  child: InkWell(
                    child: Card(
                        color:Colors.black,
                        child:ListView(
                          scrollDirection: Axis.horizontal,
                          children:<Widget>[
                            SizedBox(
                              width:50,
                            ),
                            Center(child: Text("D",style:TextStyle(color:Colors.white,fontSize:24,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold))),
                            SizedBox(
                              width:60,
                            ),
                            Image.asset('assets/ddd.jfif'),
                          ],
                        )
                    ),
                    onTap:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return p5();
                          }));
                    },
                  ),
                ),
                SizedBox(
                  height:2,
                ),


              ],
            ),
          )
        /*  GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: <Widget>[
            InkWell(
              child: ListTile(
                title: Image.asset(
                  'assets/sport.jpg',
                  height: 120,
                ),
                subtitle: Text('spots'),
                onTap: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                    return Posts2();
                  }));



                },
              ),
            ),
            InkWell(
              child: ListTile(
                title: Image.asset('assets/tec2.jpg', height: 120),
                subtitle: Text('Technology '),
                onTap: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Posts3();
                      }));

                },
              ),
            ),
            InkWell(
              child: ListTile(
                title: Image.asset('assets/clothes.jpg', height: 120),
                subtitle: Text('Clothes '),
                onTap: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Posts4();
                      }));

                },
              ),
            ),
            InkWell(
              child: ListTile(
                title: Image.asset('assets/tec.jpg', height: 120),
                subtitle: Text('Others'),
                onTap: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Posts6();
                      }));


                },
              ),
            ),

            InkWell(
              child: ListTile(
                title: Image.asset('assets/accs.jpg', height: 120),
                subtitle: Text(' Accessories '),
                onTap: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Posts5();
                      }));



                }




                ,
              ),
            ),

          ],
        ),
        */
        /*ListView(
          children:<Widget> [
            Container(
              height:160,
             width:50,

              child:InkWell(
                child: Card (

                 child:Image.asset('assets/sport.jpg'),

                ),

                  onTap:(){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return p2();
                        }));
                  },

              ),
            ),
            SizedBox(
              height:20,
            ),
            Container(
              height:160,
              width:50,
              child:InkWell(
                child: Card (
                  child:Image.asset('assets/tec2.jpg'),

                ),

                onTap:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return p3();
                      }));
                },

              ),
            ),
            SizedBox(
              height:20,
            ),
            Container(
              height:160,
              width:50,
              child:InkWell(
                child: Card (
                  child:Image.asset('assets/clothes.jpg'),

                ),

                onTap:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return p4();
                      }));
                },

              ),
            ),
            SizedBox(
              height:20
            ),
            Container(
              height:160,
              width:50,
              child:InkWell(
                child: Card (
                  child:Image.asset('assets/accs.jpg'),

                ),

                onTap:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return p5();
                      }));
                },

              ),
            ),
          ],
        ),
        */
      ),
    );
  }
}
