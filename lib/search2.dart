import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire99/searchservices.dart';
import 'package:flutter/material.dart';
//import 'package:firee99/searchservice.dart';

void main() => runApp(new search2());

class search2 extends StatefulWidget {
  @override
  _search2State createState() => _search2State();
}

class _search2State extends State<search2> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var queryResultSet = [];
  var tempSearchStore = [];
  TextEditingController searchController=TextEditingController();
  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['name'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('Firestore search'),
        ),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (val) {
                initiateSearch(val);
               searchController=val as TextEditingController;

              },

              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.arrow_back),
                    iconSize: 20.0,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),


                  contentPadding: EdgeInsets.only(left: 25.0),
                  hintText: 'Search by name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0))),
            ),

          ),
          RaisedButton(onPressed:(){

            return buildResultCard(searchController);



          }),
          SizedBox(height: 10.0),
          GridView.count(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              primary: false,
              shrinkWrap: true,
              children: tempSearchStore.map((element) {
                return buildResultCard(element);
              }).toList())
        ]));
  }
}
    Widget buildResultCard(data) {
      return Flexible(
        //   child:  Expanded(
        child: StreamBuilder(
            stream:
            Firestore.instance.collection('posts5').snapshots(),
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

                        return Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 10,
                              color: Colors.white10,
                              width: MediaQuery.of(context).size.width / 1.1,

                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                // leading: Image.network(posts['img']),
                                title: Text(posts['name'],
                                    style: TextStyle(color: Colors.redAccent)),
                                subtitle: Text("DESCRIPTION:" + posts['des']),
                                trailing: Text(posts['price'] + "\$"),
                              ),
                            ),

                          ],
                        );
                      });
              }
            }
        ),
      );

    }


