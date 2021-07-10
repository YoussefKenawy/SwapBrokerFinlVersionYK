
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:fire99/chat/cat.dart';
import 'package:flutter/material.dart';
import 'package:fire99/login.dart';
import 'package:fire99/saveImage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'imgs.dart';

class AddPost extends StatefulWidget {
  String name, price, des, imgLocation, category , kinds;

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  //String imagepath;
  String valuechoose;
  String valuechoose2;
  List listitem =["sports","tec","clothes","accessories","others"];
  List listitem2=['A','B','C','D'];
  @override
  void initState() {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController des = TextEditingController();

  TextEditingController price = TextEditingController();

  TextEditingController cat = TextEditingController();

  TextEditingController img = TextEditingController();

  TextEditingController kind = TextEditingController();
  File _image;
  String _url;

  sendData2() async {
    if (_formkey.currentState.validate()) {
      var storageImage = FirebaseStorage.instance.ref().child(_image.path);

      var task = storageImage.putFile(_image);

      _url = await (await task.onComplete).ref.getDownloadURL();

      await Firestore.instance.collection('posts5').add({
        'name': name.text,
        'img': _url.toString,
        'category': valuechoose,
        'price': price.text,
        'kind': kind.text
      });
    }
  }

  @override
  void dispose() {
    name.dispose();
    des.dispose();
    price.dispose();
    kind.dispose();
    super.dispose();
  }
  updatePost(String ID) {
    Firestore.instance.collection('posts5').document(ID).setData({
      'title': "Title Edited",
      'description': "Description Edited"
    }).then((value) {
      print('record updated successflly');
    });
  }
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
           /* actions: <Widget>[
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

        body:
        Container(
            padding: EdgeInsets.all(10),
             color:Colors.grey[850],
            child:
            Form(
                key: _formkey,
                child: ListView(children: <Widget>[
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),



                      GestureDetector(
                          child: Icon(Icons.add_photo_alternate,size: 40,color:Colors.red),
                          onTap: pickImage
                      ),
                      SizedBox(
                        width: 30,
                      ),

                      CircleAvatar(
                        backgroundColor:Colors.white,
                        backgroundImage:
                        _image == null ? null : FileImage(_image),
                        radius: 80,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        child: Icon(Icons.clear,size: 40,color:Colors.red),
                        onTap: clearr,
                      ),
                      /*
SizedBox(
  height:200,
  width:200,
  child:InkWell(
  child: Container(decoration: BoxDecoration(
  image: DecorationImage(image: AssetImage('assets/addphoto.png')),
  borderRadius: BorderRadius.all(Radius.circular(200))
  ),

  ),
  onTap:(){pickImage();
 setState(() {
  _image == null ? null : FileImage(_image);
 });


  },


  ),

),
*/






                    ],
                  ),

                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: name,style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),
                        decoration: InputDecoration(
                            hintText: 'Product Name',hintStyle:TextStyle(color:Colors.white,fontSize:21,fontWeight:FontWeight.w500),

                            border:OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),

                            )
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Product Name ';
                          }

                        },



                      ),


                      SizedBox(
                        height:15,
                      ),

                      TextFormField(
                        controller: des,style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),
                        decoration: InputDecoration(
                            hintText: 'Description',hintStyle:TextStyle(color:Colors.white,fontSize:21,fontWeight:FontWeight.w500),
                            border:OutlineInputBorder(

                              borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(60.0),

                            )


                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Description';
                          }
                        },
                      ),
                      SizedBox(
                        height:15,
                      ),


                      Container(
                        padding: EdgeInsets.only(left:25,right:25),
                        decoration:BoxDecoration(border: Border.all(color:Colors.grey,width:1)
                            ,borderRadius: BorderRadius.circular(45)),
                        child:   DropdownButton(

                          hint: Text("Select Class",style:TextStyle(color:Colors.white,fontSize:21,fontWeight:FontWeight.w500),),

                          icon: Icon(Icons.arrow_drop_down,color:Colors.red),

                          iconSize: 36,

                          isExpanded: true,
                          underline: SizedBox(),

                          value: valuechoose2,style:TextStyle(color:Colors.red,fontSize:17,fontWeight:FontWeight.w900),
                          onChanged:(newvalue)
                          {
                            setState(() {
                              valuechoose2=newvalue;
                            });

                          },

                          items: listitem2.map((valueitem){

                            return DropdownMenuItem(value: valueitem,

                              child: Text(valueitem),


                            );

                          }).toList(),


                        ),

                      ),


                      SizedBox(
                          height:15
                      ),

                      Container(
                        padding: EdgeInsets.only(left:25,right:25),
                        decoration:BoxDecoration(border: Border.all(color:Colors.grey,width:1)
                            ,borderRadius: BorderRadius.circular(25)),
                        child:   DropdownButton(

                          hint: Text("Select Category",style:TextStyle(color:Colors.white,fontSize:21,fontWeight:FontWeight.w500),),

                          icon: Icon(Icons.arrow_drop_down,color:Colors.red),

                          iconSize: 36,

                          isExpanded: true,
                          underline: SizedBox(),

                          value: valuechoose,style:TextStyle(color:Colors.red,fontSize:17,fontWeight:FontWeight.w900),
                          onChanged:(newvalue)
                          {
                            setState(() {
                              valuechoose=newvalue;
                            });

                          },

                          items: listitem.map((valueitem){

                            return DropdownMenuItem(value: valueitem,

                              child: Text(valueitem),


                            );

                          }).toList(),


                        ),

                      ),
                      SizedBox(
                        height:15,
                      ),
                      Container(
                        width:200,
                        child: RaisedButton(
                            color: Colors.white,

                            shape: StadiumBorder(),
                            splashColor: Colors.red,
                            child: Text(
                              'Share Post',
                              style: TextStyle(color: Colors.black,fontSize:21),
                            ),

                            onPressed: () async {


                              if (_formkey.currentState.validate()) {
                                var currentUser =
                                    FirebaseAuth.instance.currentUser;


                                var storageImage = FirebaseStorage.instance
                                    .ref()
                                    .child(_image.path);

                                var task = storageImage.putFile(_image);

                                _url = await (await task.onComplete)
                                    .ref
                                    .getDownloadURL();


                                Firestore.instance.collection('posts5').document()

                                    .setData({
                                  'name': name.text,
                                  'img': _url.toString(),
                                  'des': des.text,
                                  'category': valuechoose,
                                  'class':valuechoose2,
                                 // 'price': price.text,
                                 // 'kind': kind.text,
                                   'prof':currentUser.email,
                                  'user': {
                                    'uid': currentUser.uid,
                                    'email': currentUser.email,
                                  }
                                });

                              }
                            }),
                      ),
                      /* RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          'images',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return HomeImg();
                            }),
                          );
                        },
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          'Delete Post',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formkey.currentState.validate()) {
                            // Delete post

                            Firestore.instance
                                .collection('posts5')
                                .document('Wefs9XsNTeND7UXW7aXi')
                                .delete()
                                .then((onValue) {
                              print('Post Deleted Successfully');
                            });
                          }
                        },
                      )*/
                    ],
                  )
                ]))));
  }

  Future pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    //set state bt3ml update kol shwya

    setState(() {
      _image = image;
    });
  }




  Future uploadImage(context) async {
    try {
      FirebaseStorage storage =
      FirebaseStorage(storageBucket: 'gs://fire999-6d8b9.appspot.com');

      StorageReference ref = storage.ref().child(_image.path);
      StorageUploadTask storageUploadTask = ref.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('success'),
      ));
      String url = await taskSnapshot.ref.getDownloadURL();
      print('url $url');
      setState(() {
        _url = url;
      });
    } catch (ex) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(ex.message),
      ));
    }
  }
  Future clearr() {

    setState(() {
      _image = null;
    });
  }

}
