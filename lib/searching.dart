

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Searchpage extends StatefulWidget {
  @override
  _SearchpageState createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  TextEditingController searchController=TextEditingController();
  final database =Firestore.instance;
  String searchString;

  @override
  Widget build(BuildContext context) {
    uploadData(String name)async{
      List<String>splitList=name.split(' ');
      List<String> indexList=[];
      for(int i=0;i<splitList.length;i++)
        {
          for(int j=0;j<splitList[i].length+i;j++){
            indexList.add(splitList[i].substring(0,j).toLowerCase());
          }
        }
      database.collection('posts5').add({
        'name':name,
        'searchIndex':indexList

      });


    }
    return Scaffold(
      body:Column(
        children:<Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              onChanged:(val){
                setState(() {

                  searchString=val.toLowerCase();

                });
              },
              controller:searchController,
              decoration:InputDecoration(
                suffixIcon:IconButton(
                  icon:Icon(Icons.clear),
                  onPressed:()=>searchController.clear(),

                ),
                hintText:"Search..",
                hintStyle:TextStyle(color:Colors.blueGrey),
              ),
            ),
          ),

          RaisedButton(
            onPressed:(){

            },
          )


        ,Flexible(

            //   child:  Expanded(
            child: StreamBuilder(

                stream:
                Firestore.instance.collection('posts5').where("name",arrayContains: searchString).snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return Center(child: Text('Loading'));
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return new Text('Loading...');

                    case ConnectionState.done:
                      return new Text('done..');
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
                                  child: InkWell(

                                    /* onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return Action99(
                                        posts['name'],
                                        posts['des'],
                                        posts['price'],
                                        posts['img'],
                                      );
                                    }),
                                  );
                                },

                                */
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: ListTile(
                                    // leading: Image.network(posts['img']),
                                    title: Text(posts['name'],
                                        style: TextStyle(color: Colors.redAccent)),
                                    // subtitle: Text("DESCRIPTION:" + posts['des']),
                                    trailing: Text(posts['price'] + "\$"),
                                  ),
                                ),

                              ],
                            );
                          });
                  }
                }
            ),
          )


      ]));

    }}




/*class xe extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children:<Widget>[
          Container(
            child:TextField(
              controller:
            )
          )
        ]
      )
    )
  }

}
*/

