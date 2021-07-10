import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire99/chat/usersaction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fire99/actions.dart';
import 'package:fire99/login.dart';

class Search3 extends StatefulWidget {
  @override
  _Search3State createState() => _Search3State();
}

class _Search3State extends State<Search3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
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
      body: StreamBuilder(
          stream: Firestore.instance.collection('users').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return Center(child: Text('Loading'));
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Text('Loading...');

              default:
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot users = snapshot.data.documents[index];
                      Map usersdata = users.data();
                     
                      //     factory User.fromDocument(DocumentSnapshot doc, Map docdata)
                      return Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            padding: EdgeInsets.all(10),
                            child: ListTile(
                              // leading: Image.network(posts['img']),
                              title: Text(usersdata['name'],
                                  style: TextStyle(color: Colors.redAccent)),
                              subtitle: Text("Email:" + usersdata['email']),
                              // trailing: Text(posts['price'] + "\$"),
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
