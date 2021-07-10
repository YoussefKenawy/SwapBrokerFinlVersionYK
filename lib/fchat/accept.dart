
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire99/fchat/screens/chat_screen2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:fire99/chat/cat.dart';
import 'package:flutter/material.dart';
import 'package:fire99/login.dart';
import 'package:fire99/saveImage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class accept2 extends StatefulWidget {
  final owner;
  final sender;
  final product;
  final img;
  final product2;
  final img2;



  accept2(this.owner,this.sender,this.product,this.img,this.product2,this.img2);

  String name, price, des, imgLocation, category , kinds;

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<accept2> {
  //String imagepath;
  String valuechoose;
  List listitem =["sports","tec","clothes","accessories","others"];
  @override
  void initState() {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController location = TextEditingController();

  TextEditingController mob = TextEditingController();

  TextEditingController time = TextEditingController();

  TextEditingController cat = TextEditingController();

  TextEditingController img = TextEditingController();

  TextEditingController notes = TextEditingController();
  File _image;
  String _url;

  sendData2() async {
    if (_formkey.currentState.validate()) {
      var storageImage = FirebaseStorage.instance.ref().child(_image.path);

      var task = storageImage.putFile(_image);

      _url = await (await task.onComplete).ref.getDownloadURL();

     /* await Firestore.instance.collection('posts5').add({
        'name': name.text,
        'img': _url.toString,
        'category': valuechoose,
        'price': price.text,
        'kind': kind.text
      });*/
    }
  }

  @override
  void dispose() {
    location.dispose();
    mob.dispose();
    time.dispose();
    notes.dispose();
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
                          //   return cat();
                        }));

                  })]
        ),

        body:
        Container(
            padding: EdgeInsets.all(10),

            child:
            Form(
                key: _formkey,
                child: ListView(children: <Widget>[
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),



                     /* GestureDetector(
                          child: Icon(Icons.camera_alt,size: 40,),
                          onTap: pickImage
                      ),
                      SizedBox(
                        width: 30,
                      ),

                      CircleAvatar(
                        backgroundColor:Colors.lightBlueAccent,
                        backgroundImage:
                        _image == null ? null : FileImage(_image),
                        radius: 80,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        child: Icon(Icons.clear,size: 40,),
                        onTap: clearr,
                      ),*/
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
                      Card(
                        child:Text('All details')
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: location,
                        decoration: InputDecoration(
                            hintText: 'location for swapping',

                            border:OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            )
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter the location ';
                          }

                        },



                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: time,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'time for swapping',
                            border:OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            )



                        ),
                        validator: ( value) {
                          if (value.isEmpty) {
                            return 'Please Enter time ';
                          }
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller:mob,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'your mobile number',
                            border:OutlineInputBorder(

                              borderSide: const BorderSide(color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),

                            )


                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter mobile number';
                          }
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),


                  /*    Container(
                        padding: EdgeInsets.only(left:25,right:25),
                        decoration:BoxDecoration(border: Border.all(color:Colors.grey,width:1)
                            ,borderRadius: BorderRadius.circular(25)),
                        child:   DropdownButton(

                          hint: Text("Select Category"),

                          icon: Icon(Icons.arrow_drop_down),

                          iconSize: 36,

                          isExpanded: true,
                          underline: SizedBox(),

                          value: valuechoose,
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

                      ),*/
                      SizedBox(
                        height: 5,
                      ),

                      TextFormField(
                        controller: notes,
                        decoration: InputDecoration(
                            hintText: 'any notes you want',

                            border:OutlineInputBorder(

                              borderSide: const BorderSide(color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),

                            )
                        ),
                       /* validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Kind ';
                          }

                        },*/
                      ),



                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width:200,
                        child: RaisedButton(
                            color: Colors.lightBlueAccent,

                            shape: StadiumBorder(),
                            splashColor: Colors.red,
                            child: Text(
                              'ok',

                              style: TextStyle(color: Colors.white,fontSize:21),
                            ),

                            onPressed: () async {


                              if (_formkey.currentState.validate()) {
                                final user = FirebaseAuth.instance.currentUser;
                                final userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
                                String ud=userData['email'];


                                FirebaseAuth.instance.currentUser;

                                Firestore.instance.collection('chat').document()
                                    .setData({

                                  "x":"x",
                                  'product':widget.product,
                                  'product2':widget.product2,
                                   'img2':widget.img2,
                                  'location': location.text,
                                  'name':widget.product,
                                  'des':'your order is accepted',
                                 'owner':widget.sender,
                                 'sender':widget.owner,
                                  'img': widget.img,
                                  'mob': mob.text,
                                  'category': valuechoose,
                                  'time': time.text,
                                  'notes': notes.text,
                                  'user': {
                                    'uid': user.uid,
                                    'email': user.email,
                                 //   'name':currentUser.toString(),
                                  }
                                });
                                Firestore.instance.collection('chat').where("name", isEqualTo:widget.name).get().then((snapshot){
                                  snapshot.docs.first.reference.delete();
                                });
                              }
                             /* final user = FirebaseAuth.instance.currentUser;
                              final userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
                              String ud=userData['email'];
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>ChatScreen2(ud)));*/
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
