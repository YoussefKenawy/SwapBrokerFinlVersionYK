import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class RegisterScreen2 extends StatefulWidget{
  @override
  _RegisterScreen2State createState() => _RegisterScreen2State();
}

class _RegisterScreen2State extends State<RegisterScreen2> {
  void initState()
  {
    super.initState();
  }


  final _formkey = GlobalKey<FormState>();

  TextEditingController _namecontroller = TextEditingController();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  TextEditingController _countrycontroller = TextEditingController();

  TextEditingController _phonenumber = TextEditingController();

  TextEditingController _dateofbirth = TextEditingController();

  TextEditingController _gender = TextEditingController();


  @override
  void dispose()
  {
    _namecontroller.dispose();

    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    _countrycontroller.dispose();

    _phonenumber.dispose();

    _dateofbirth.dispose();

    _gender.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
        title: Text('Registeration'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        leading: Icon(Icons.app_registration),
        //elevation:0,
        actions: <Widget> [
          IconButton(
              icon: Icon(Icons.login),
              onPressed: null)],
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
        child: Form(
          key: _formkey,
          child:ListView(
            children: <Widget>[

              TextFormField(
                controller: _namecontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Name',
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Fill Name';
                  }
                  // return 'Valid Name';
                },
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailcontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue)),
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Fill Email ';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: _passwordcontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue)),
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Fill Password';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: _countrycontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_on),
                  labelText: 'Country',
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent)),
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Fill Country';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: _phonenumber,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  labelText: 'Phone Number',
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent)),
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Fill Number';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: _dateofbirth,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.cake),
                  labelText: 'Date of Birth',
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent)),
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Fill Date of Birth';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: _gender,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Gender',
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Fill Gender';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),

              RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
                color: Colors.lightBlueAccent,
                child: Text('Submit',style: TextStyle(color: Colors.white,fontSize:21),),
                onPressed: () async{
                  if(_formkey.currentState.validate()){
                    var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);
                    if(result != null)
                    {
                      Firestore.instance.collection('users').document(result.user.uid).setData({
                        'name':_namecontroller.text,
                        'email':_emailcontroller.text
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }),
                      );

                    }else{
                      print('please try later');
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}