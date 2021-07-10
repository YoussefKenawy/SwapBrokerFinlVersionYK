import 'package:fire99/chat/user.dart';
import 'package:fire99/chat/database.dart';
import 'package:fire99/chat/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(Search());

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchEditingController = new TextEditingController();
  QuerySnapshot searchResultSnapshot;

  bool isLoading = false;
  bool haveUserSearched = false;

  initiateSearch() async {
    databaseMethods.getUserbyUserName(searchEditingController.text).then((val) {
      setState(() {
        searchResultSnapshot = val;
      });
      //searchResultSnapshot = snapshot;
    });
  }

  Widget searchList() {
    return haveUserSearched
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchResultSnapshot.documents.length,
            itemBuilder: (context, index) {
              return searchTile(
                  // Firestore.instance.collection('users').document(result.user.uid).
                  userName:
                      "name", //searchResultSnapshot.documents[index].data["name"],
                  userEmail: "email");

              //searchResultSnapshot.documents[index].data["email"],
            })
        : Container();
  }

  @override
  void initState() {
    initiateSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Container(
            color: Colors.grey,
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Container(
                  width:200,
                  height:200,
                  padding:EdgeInsets.all(10),
                  child: searchTile()), 
                Expanded(
                    child: TextField(
                  controller: searchEditingController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: ("Search user.."),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                  ),
                )),
                GestureDetector(
                  onTap: () {
                    initiateSearch();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        const Color(0x36FFFFFF),
                        const Color(0x0FFFFFFF),
                      ]),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Image.asset('assets/se1.png'),
                  ),
                ),
                //  
               // 
              ],
            )),
      ),
    );
  }
}

class searchTile extends StatelessWidget {
  final String userName;
  final String userEmail;

  searchTile({this.userName, this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        child: Row(children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(userName, style: TextStyle(color: Colors.white)),
                Text(userEmail, style: TextStyle(color: Colors.white)),
              ]),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30),
            ),
            //padding: EdgeInsets.symmetric(horizontal: 16, vertical:14),
            child: Text("Message"),
          )
        ]));
  }
}
