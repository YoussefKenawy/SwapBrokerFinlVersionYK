import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'file:///D:/flutter%20projects2020/fire99/lib/chating.dart';
import 'package:fire99/chat/usersaction.dart';
import 'package:fire99/chating.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fire99/actions.dart';
import 'package:fire99/login.dart';

class Search4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts Screen'),
        actions: <Widget>[
          RaisedButton(
              child: Text(
                'Log Out',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }),
        ],
      ),
      drawer: Dw(),
      body: StreamBuilder(
          stream: Firestore.instance.collection('users').where("name", isNotEqualTo:null).snapshots(),
          builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return Center(child: Text('Loading'));
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Text('Loading...');

              default:
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot users = snapshot.data.documents[index];

                      return Column(
                        children: <Widget>[
                          
                          Container(
                            height:80,
                            padding: EdgeInsets.all(10),
                            child: Card(
                                   child: Row(
                                     children:<Widget>[
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Text(users.data()['name']==null? '' : users.data()['name']),
                                       ),
                                       SizedBox(
                                         width:190,
                                       ),
                                          InkWell(child: 
                                          Text('Message',style:TextStyle(color:Colors.blue)
                                          ),
                                          onTap:() {
                            Navigator.push(
                             context,
                            MaterialPageRoute(builder: (context) => Chating()),
                        );
                                          },
                                          ),
                                     ]
                                   )
                            ),

                          ),
                        ],
                      );
                    });
            }
          }),
    );
  }
}

/*Future uploadImage(context) async {
    try {
      FirebaseStorage storage =
          FirebaseStorage(storageBucket: 'gs://fire999-6d8b9.appspot.com');

      var _image;
            StorageReference ref = storage.ref().child(_image.path);
      StorageUploadTask storageUploadTask = ref.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('success'),
      ));
      String url = await taskSnapshot.ref.getDownloadURL();
      print('url $url');
     
    } catch (ex) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(ex.message),
      ));
    }
    */
// }
class Dw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: Text('SwapBroker@gmail.com',
              style: TextStyle(color: Colors.white)),
          accountName: Text('Broker', style: TextStyle(color: Colors.white)),
          currentAccountPicture: CircleAvatar(child: (Icon(Icons.person))),
          decoration: BoxDecoration(
              //color:Colors.black,
              image: DecorationImage(
                  image: AssetImage("assets/sw3.jpeg"), fit: BoxFit.cover)),
        ),
        ListTile(
          title: Text("about App", style: TextStyle(color: Colors.black)),
          leading: Icon(Icons.info, color: Colors.blue, size: 25),
          onTap: () {},
        ),
        ListTile(
          title: Text("Settings", style: TextStyle(color: Colors.black)),
          leading: Icon(Icons.settings, color: Colors.blue, size: 25),
          onTap: () {},
        ),
        ListTile(
          title: Text("Settings", style: TextStyle(color: Colors.black)),
          leading: Icon(Icons.settings, color: Colors.blue, size: 25),
          onTap: () {},
        ),
      ]),
    );
  }
}