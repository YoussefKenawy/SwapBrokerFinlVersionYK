import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fire99/chat/cat.dart';
import 'package:fire99/posts.dart';
import 'package:fire99/swaping.dart';
import 'package:fire99/swapping2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import 'add_post.dart';
import 'login.dart';

class showdetails extends StatefulWidget{
  final dss;
  final img;
  final img2;
  final product;
  final product2;



  showdetails(this.dss,this.img, this.img2, this.product, this.product2);

  @override
  _Action_State createState() => _Action_State();
}

class _Action_State extends State<showdetails> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor:Colors.white,
      appBar: AppBar(
          backgroundColor:Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title:Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    // Colors.white,
                    Colors.white,
                    //Colors.lightBlueAccent,

                    // Colors.lightBlueAccent,
                    Colors.white,
                  ])),
              height:30,
              child: Center(child: Row(
                children: [
                  Text("   Sw",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:21)),
                  Text("ap",style:TextStyle(color:Colors.red,fontWeight:FontWeight.w600,fontSize:21)),
                  Text("  Broker",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:21)),

                ],
              ))
          ),
          //backgroundColor: Colors.lightBlueAccent,
          /*actions: <Widget>[
            IconButton(
                color:Colors.red,
                icon: Icon(Icons.apps,size:34,),

                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return cat2();
                      }));

                }),

            SizedBox(
                width:7
            ),
            IconButton(
                color:Colors.black,
                icon: Icon(Icons.apps_sharp,size:34,),

                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return cat();
                      }));
                })
          ]*/
      ),

        body: Container(
          color:Colors.grey[850],
          child: Column(
              children: [

                SizedBox(
                  height:16,
                ),
             /*   Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(

                      hintText:"ex : camera , t shirt , mobile",
                      prefixIcon: InkWell(child: Icon(Icons.search),
                        onTap:(){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return cs(_searchController.text.toLowerCase());
                              }));
                          //   ),
                        },
                      ),

                    ),
                  ),
                ),*/
                SizedBox(
                  width:7,
                ) ,






                Flexible(

                  child: Expanded(

                    child: StreamBuilder(
                        stream:
                        Firestore.instance.collection('chat')
                       .where("des",isEqualTo:widget.dss)
                         //   .orderBy("img",descending:true )
                            .snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) return Center(child: Text('Loading'));
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return new Text('Loading...');
//.where("category", isEqualTo:"tec")
                            default:
                              return ListView.builder(
                                  itemCount: snapshot.data.documents.length,
                                  itemBuilder: (context, index) {
                                    DocumentSnapshot posts = snapshot.data.documents[index];

                                    // (profile.imgUrl == null) ? AssetImage('images/user-avatar.png') : NetworkImage(profile.imgUrl)
                                    return Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          height: 220,
                                          color: Colors.grey[850],
                                          width: MediaQuery.of(context).size.width / 1.1,
                                          child: InkWell(
                                            child: Card(
                                              child:
                                              Container(
                                                //backgroundImage: (profile.imgUrl == null) ? AssetImage('images/user-avatar.png') : NetworkImage(profile.imgUrl)
                                                child:
                                                Image.network(widget.img,
                                                    fit: BoxFit.fill),

                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          height: 220,
                                          color: Colors.white10,
                                          width: MediaQuery.of(context).size.width / 1.1,
                                          child: InkWell(
                                            child: Card(
                                              child:
                                              Container(
                                                //backgroundImage: (profile.imgUrl == null) ? AssetImage('images/user-avatar.png') : NetworkImage(profile.imgUrl)
                                                child:
                                                Image.network(widget.img2,
                                                    fit: BoxFit.fill),

                                              ),
                                            ),

                                          ),
                                        ),
                                       Column(
                                         children:<Widget>[
                                           Row(
                                             children: [
                                               SizedBox(
                                                 width:5,
                                               ),
                                               Text('Location : ',style:TextStyle(color:Colors.white,fontSize:22,fontWeight:FontWeight.w900),),
                                               Text(posts.data()['location'] ??" ",style:TextStyle(color:Colors.white,fontSize:22,fontWeight:FontWeight.w900),),
                                             ],
                                           ),
                                           Row(
                                             children: [
                                               SizedBox(
                                                 width:5,
                                               ),
                                               Text('time to swap  : ',style:TextStyle(color:Colors.white,fontSize:22,fontWeight:FontWeight.w900),),
                                               Text(posts.data()['time'] ??" ",style:TextStyle(color:Colors.white,fontSize:22,fontWeight:FontWeight.w900),),
                                             ],
                                           ),
                                           Row(
                                             children: [
                                               SizedBox(
                                                 width:5,
                                               ),
                                               Text('mobile number : ',style:TextStyle(color:Colors.white,fontSize:22,fontWeight:FontWeight.w900),),
                                               Text(posts.data()['mob'] ??" ",style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),),
                                             ],
                                           ),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               //  SizedBox(width: 20.0/3),


                                               FlatButton.icon(onPressed: () {

                                                 var currentUser =
                                                     FirebaseAuth.instance.currentUser;
                                                 Firestore.instance.collection('save the deal').document()
                                                     .setData({
                                                   'location': posts.data()['location'] ,
                                                   'img': widget.img,
                                                   'img2':widget.img2,
                                                   'curent':currentUser.email,
                                                   'product': widget.product,
                                                   'product2': widget.product2,
                                                   'time':posts.data()['time'],
                                                   'mob':posts.data()['mob'],
                                                   'user': {
                                                     'uid': currentUser.uid,
                                                     'email': currentUser.email,
                                                   }
                                                 });

                                               },
                                                 icon: Icon(Icons.adjust_sharp, color: Colors.redAccent,size:32,),
                                                 height: 12,
                                                 // width:50,

                                                 label: Text(" save the deal" , style: TextStyle(color: Colors.red , fontSize: 21,fontStyle:FontStyle.italic),
                                                 ),
                                               ),

                                             ],

                                           ),


                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               //  SizedBox(width: 20.0/3),


                                               FlatButton.icon(onPressed: () {

                                                 sendWhatsApp('2'+posts.data()['mob'],'hello i am using swap broker app and want to make a deal with you');

                                               },
                                                 icon: Icon(Icons.messenger_rounded, color: Colors.greenAccent,size:32,),
                                                 height: 12,
                                                 // width:50,

                                                 label: Text(" chatting " , style: TextStyle(color: Colors.green , fontSize: 21,fontStyle:FontStyle.italic),
                                                 ),
                                               ),

                                             ],

                                           ),









                                         ]
                                       )
                                      /*  Container(
                                          padding: EdgeInsets.all(10),
                                          child: ListTile(
                                            // leading: Image.network(posts.data()['img']),
                                            title: Text(posts.data()['location'] ,
                                                style: TextStyle(color: Colors.redAccent)),
                                            subtitle: Container(
                                                height:30,
                                                child: Text("DESCRIPTION:" + posts.data()['des'] )),
                                            trailing: Text(posts.data()['notes']),
                                          ),
                                        ),*/
                                      ],
                                    );
                                  });
                          }
                        }
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: CurvedNavigationBar(

                      color:Colors.white,
                      backgroundColor:Colors.grey[850],
                      //buttonBackgroundColor:Colors.blue,
                      items:<Widget>[

                        Icon(Icons.home,size:24,color:Colors.black),
                        Icon(Icons.add_box,size:24,color:Colors.red),
                        Icon(Icons.messenger_rounded,size:24,color:Colors.blue),
                        Icon(Icons.account_circle,size:24,color:Colors.purple),
                      ],

                      animationCurve:Curves.bounceOut,
                      onTap:(index){

                        if(index==1)
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return AddPost();
                              }));


                        }


                      }


                  ),
                )

              ]),
        ),



    );
  }


sendWhatsApp(String phone,String msg)async{

    String url(){
      if(Platform.isAndroid){
        return 'whatsapp://send?phone=$phone&text=$msg';
        //  return 'whatsapp://wa.me/$phone/?text=${Uri.parse(msg)}';
      }
      else{
        return 'whatsapp://send?phone=$phone&text=$msg';
        //  return 'whatsapp://send?$phone=phone&text=$msg';
        //   return 'whatsapp://wa.me/$phone&text=$msg';
      }
    }

    await canLaunch(url())?launch(url()) : ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('there is no whats app in your device')));


  }
}