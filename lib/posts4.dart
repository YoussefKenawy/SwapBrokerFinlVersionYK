import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fire99/P3.dart';
import 'package:fire99/add_post.dart';
import 'package:fire99/cat2.dart';
import 'package:fire99/chat/cat.dart';
import 'package:fire99/chat/search4.dart';
import 'package:fire99/fchat/screens/chat_screen2.dart';
import 'package:fire99/new.dart';
import 'package:fire99/p2.dart';
import 'package:fire99/profile.dart';
import 'package:fire99/provider_widget.dart';
import 'package:fire99/posts.dart';
import 'package:fire99/posts2.dart';
import 'package:fire99/posts3.dart';
import 'package:fire99/posts4.dart';
import 'package:fire99/posts5.dart';
import 'package:fire99/posts6.dart';
import 'package:fire99/search2.dart';
import 'package:fire99/search7.dart';
import 'package:fire99/searching.dart';
import 'package:fire99/wid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'actions.dart';
import 'login.dart';

class Posts4 extends StatefulWidget {
  @override
  _Posts4 createState() => _Posts4();
}

class _Posts4 extends State<Posts4> {
  String allposts;

  String v;
  TextEditingController _searchController = TextEditingController();
  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];
// val date = Calendar.getInstance().time;

  /*@override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }
*/
  /*@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getUsersPastTripsStreamSnapshots();
  }


  _onSearchChanged() {
    searchResultsList();
  }

   */
/*
  searchResultsList() {
    var showResults = [];

    if(_searchController.text != "") {
      for(var tripSnapshot in _allResults){
        var title = tripSnapshot.fromSnapshot(tripSnapshot).title.toLowerCase();

        if(title.contains(_searchController.text.toLowerCase())) {
          showResults.add(tripSnapshot);
        }
      }

    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  getUsersPastTripsStreamSnapshots() async {

    // var data= await Firestore.instance.collection('posts5').document(allposts).collection('posts5').where("searchIndex",arrayContains:_searchController).snapshots();

    //final uid = await Provider.of(context).auth.getCurrentUID();
    /* var data2 = await Firestore.instance
        .collection('')
        .document(data)
        .collection('trips')
        .where("endDate", isLessThanOrEqualTo: DateTime.now())
        .orderBy('endDate')
        .getDocuments();


    setState(() {
      _allResults = data;
    });
*/

    searchResultsList();
    return "complete";
  }
*/





  void filterCategory(value) {}

  @override
  Widget build(BuildContext context) {

    return Scaffold(

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
          actions: <Widget>[
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

          ]
      ),


      drawer: SidebarPage(),

      body:
      Container(
        color:Colors.grey[850],
        child: Column(
            children: [

              SizedBox(
                height:16,
              ),
              Padding(
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
              ),
              SizedBox(
                width:10,
              ) ,






              Flexible(

                child: Expanded(

                  child: StreamBuilder(
                      stream:
                      Firestore.instance.collection('posts5').where("category",isEqualTo:"clothes")
                      //.orderBy("img",descending:true )
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
                                        height: 280,
                                        color:Colors.grey[850],
                                        width: MediaQuery.of(context).size.width / 1.1,
                                        child: InkWell(
                                          child: Card(
                                            child:
                                            Container(
                                              //backgroundImage: (profile.imgUrl == null) ? AssetImage('images/user-avatar.png') : NetworkImage(profile.imgUrl)
                                              child:
                                              Image.network(posts.data()['img'],
                                                  fit: BoxFit.fill),

                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) {
                                                return Action99(
                                                  posts['name'],
                                                  posts['des'],
                                                  posts['class'],
                                                  posts['img'],
                                                  posts['user']['email'],
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: ListTile(
                                          // leading: Image.network(posts.data()['img']),
                                          title: Text(posts.data()['name'],
                                            style:TextStyle(color:Colors.white,fontSize:21,fontWeight:FontWeight.w700),),
                                          subtitle: Container(
                                              height:30,
                                              child: Text("DESCRIPTION : " + posts.data()['des'],style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w500),)),
                                          trailing: Text(" " + posts.data()['class'],style:TextStyle(color:Colors.red,fontSize:24,fontWeight:FontWeight.w500),),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                        }
                      }
                  ),
                ),
              ),
              SizedBox(
                height:30,
              ),
              CurvedNavigationBar(
                  color: Colors.white,
                  backgroundColor: Colors.grey[850],
                  //buttonBackgroundColor:Colors.blue,
                  items: <Widget>[
                    Icon(Icons.home, size: 24, color: Colors.black),
                    Icon(Icons.add_box, size: 24, color: Colors.black),
                    Icon(Icons.messenger_rounded, size: 24, color: Colors.black),
                    Icon(Icons.account_circle, size: 24, color: Colors.black),
                  ],
                  animationCurve: Curves.bounceOut,
                  onTap: (index) async {
                    final user = FirebaseAuth.instance.currentUser;
                    final userData = await Firestore.instance
                        .collection('users')
                        .doc(user.uid)
                        .get();
                    String ud=userData['email'];
                    if (index == 1) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return AddPost();
                          }));
                    } else if (index == 2) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return ChatScreen2(ud);
                          }));
                    }
                    else if (index == 3) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return profile(ud);
                          }));
                    }
                  }),

            ]),
      ),



    );
  }
}
