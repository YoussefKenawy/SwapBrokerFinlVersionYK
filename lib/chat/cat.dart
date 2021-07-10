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

void main() => runApp(cat());

class cat extends StatelessWidget {
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
                   Colors.grey[850],
                  // Colors.cyanAccent,

                  // Colors.lightBlueAccent,
                   Colors.grey[850],
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
                           Colors.grey[850],
                          // Colors.lightBlueAccent,

                          // Colors.lightBlueAccent,
                           Colors.grey[850],
                         ])),
                     height:60,
                     child: Column(
                       children: [

                         SizedBox(
                           height:4,
                         ),
                         Center(child: Text("Select Category",style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w700))),
                       ],
                     )),

                // Center(child: Text("~~~~~~~~~",style:TextStyle(color:Colors.red,fontSize:24,fontStyle:FontStyle.italic))),
                 SizedBox(
                   height:10,
                 ),
                 Container(
                   width:170,
                   height:100,
                   child: InkWell(
                     child: Card(
                       color:Colors.red,
                       child:ListView(
                         scrollDirection: Axis.horizontal,
                         children:<Widget>[
                           SizedBox(
                             width:50,
                           ),
                           Center(child: Text("Technology",style:TextStyle(color:Colors.white,fontSize:26,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold))),
                           SizedBox(
                             width:40,
                           ),
                           Image.asset('assets/tec2.jpg'),
                         ],
                       )
                     ),
                     onTap:(){
                       Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) {
                             return Posts3();
                           }));
                     },
                   ),
                 ),

                 Container(
                   width:170,
                   height:100,
                   child: InkWell(
                     child: Card(
                         color:Colors.red,
                         child:ListView(
                           scrollDirection: Axis.horizontal,
                           children:<Widget>[
                             SizedBox(
                               width:60,
                             ),
                             Center(child: Text("Sports",style:TextStyle(color:Colors.white,fontSize:28,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold))),
                             SizedBox(
                               width:80,
                             ),
                             Image.asset('assets/sport.jpg'),
                           ],
                         )
                     ),
                     onTap:(){
                       Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) {
                             return Posts2();
                           }));
                     },
                   ),
                 ),

                 Container(
                   width:170,
                   height:100,
                   child: InkWell(
                     child: Card(
                         color:Colors.red,
                         child:ListView(
                           scrollDirection: Axis.horizontal,
                           children:<Widget>[
                             SizedBox(
                               width:50,
                             ),
                             Center(child: Text("clothes",style:TextStyle(color:Colors.white,fontSize:28,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold))),
                             SizedBox(
                               width:80,
                             ),
                             Image.asset('assets/clothes.jpg'),
                           ],
                         )
                     ),
                     onTap:(){
                       Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) {
                             return Posts4();
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
                         color:Colors.red,
                         child:ListView(
                           scrollDirection: Axis.horizontal,
                           children:<Widget>[
                             SizedBox(
                               width:24,
                             ),
                             Center(child: Text("Accessories",style:TextStyle(color:Colors.white,fontSize:24,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold))),
                             SizedBox(
                               width:65,
                             ),
                             Image.asset('assets/accs.jpg'),
                           ],
                         )
                     ),
                     onTap:(){
                       Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) {
                             return Posts5();
                           }));
                     },
                   ),
                 ),
                 SizedBox(
                   height:2,
                 ),

                 Container(
                   width:170,
                   height:100,
                   child: InkWell(
                     child: Card(
                         color:Colors.red,
                         child:ListView(
                           scrollDirection: Axis.horizontal,
                           children:<Widget>[
                             SizedBox(
                               width:50,
                             ),
                             Center(child: Text("others",style:TextStyle(color:Colors.white,fontSize:28,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold))),
                             SizedBox(
                               width:90,
                             ),
                             Image.asset('assets/tec.jpg'),
                           ],
                         )
                     ),
                     onTap:(){
                       Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) {
                             return Posts5();
                           }));
                     },
                   ),
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
