import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire99/chat/cat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fire99/login.dart';
import 'package:fire99/saveImage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'imgs.dart';

class Present extends StatefulWidget {
  @override
  _PresentState createState() => _PresentState();
}

class _PresentState extends State<Present> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController des = TextEditingController();

  TextEditingController price = TextEditingController();

  TextEditingController ctg = TextEditingController();

  TextEditingController img = TextEditingController();
  File _image;
  int _value = 1;
  List<String> _ctg = ['Sports', 'Tech', 'Clothes', 'Accessories'];
  String _selectedCtg;
  String _url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                    Text("       Sw",style:TextStyle(color:Colors.lightBlue,fontWeight:FontWeight.bold,fontSize:21)),
                    Text("ap",style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize:21)),
                    Text("  Broker",style:TextStyle(color:Colors.lightBlue,fontWeight:FontWeight.bold,fontSize:21)),

                  ],
                ))
            ),
            //backgroundColor: Colors.lightBlueAccent,
            actions: <Widget>[
              IconButton(
                  color:Colors.cyanAccent,
                  icon: Icon(Icons.filter_5_outlined,size:34,),

                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return cat();
                        }));

                  })]
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children:[
            Column(children: <Widget>[
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.lightBlueAccent,
                    backgroundImage: _image == null ? null : FileImage(_image),
                    radius: 70,
                  ),
                  GestureDetector(
                    child: Icon(Icons.camera_alt),
                    onTap: pickImage,
                  )
                ],
              ),

              Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: name,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        //
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: price,
                      decoration: InputDecoration(
                        hintText: 'Price',

                        // errorText: 'Please Fill Price Input',
                        hasFloatingPlaceholder: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        focusColor: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButtonHideUnderline(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: DropdownButton(
                          dropdownColor: Colors.white,
                          //value: _value,
                          style: TextStyle(color: Colors.grey[800]),
                          // isExpanded:true,
                          underline: Container(height: 2, color: Colors.white),
                          hint: Text(
                              'Select Category'), // Not necessary for Option 1
                          value: _selectedCtg,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedCtg = newValue;
                            });
                          },
                          items: _ctg.map((category) {
                            return DropdownMenuItem(
                              child: new Text(category),
                              value: category,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      controller: des,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width:100,
                      child: RaisedButton(
                          color: Colors.lightBlueAccent,

                          shape: StadiumBorder(),
                          splashColor: Colors.red,
                          child: Text(
                            'Present Item',

                            style: TextStyle(color: Colors.white,fontSize:21),
                          ),

                          onPressed: ()  async {

                           /* var currentUser =
                                FirebaseAuth.instance.currentUser;


                            var storageImage = FirebaseStorage.instance
                                .ref()
                                .child(_image.path);

                            var task = storageImage.putFile(_image);

                            _url = await (await task.onComplete)
                                .ref
                                .getDownloadURL();


                            Firestore.instance.collection('chat').document()


                                .setData({
                              'name': name.text,
                              'img': _url.toString(),
                              'des': des.text,
                              'category': valuechoose,
                              'price': price.text,
                              'kind': kind.text,
                              'user': {
                                'uid': currentUser.uid,
                                'email': currentUser.email,
                              }
                            });*/

                          }),
                    ),
                  ])
            ],
            ),
          ],
        )
    );
  }

  Future pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }
}