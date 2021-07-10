import 'dart:io';
import 'package:flutter/material.dart';
import 'chat/userImagePicker.dart';


class AuthForm extends StatefulWidget {

  bool isLoading;

 final void Function(String email,String password, String username, bool isLogin, BuildContext ctx) submitFuc;

  AuthForm(this.submitFuc, this.isLoading);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
   final _formkey =GlobalKey<FormState>();
   bool _isLogin =true;
   String _email="";
   String _password="";
   String _username="";
   File _userImageFile;

    void _pickedImage(File pickedImage){
      _userImageFile=pickedImage;
    }



   void _submit(){
     final isValid = _formkey.currentState.validate();
     FocusScope.of(context).unfocus();



      if(!_isLogin && _userImageFile == null){

        Scaffold.of(context).showSnackBar(
            SnackBar(
                content:Text("please pick an Image ",style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),),
                backgroundColor:Colors.black));
        return;
      }

     if(isValid){
       _formkey.currentState.save();
       widget.submitFuc(
         _email.trim(),_password.trim(),_username.trim(),_isLogin,context
       );
     }
   }


  @override
  Widget build(BuildContext context) {
    return Center(
      child:Card(
        margin:EdgeInsets.all(20),
        child:SingleChildScrollView(
          padding:EdgeInsets.all(12),
          child:Form(
            key:_formkey,
            child:Column(
              mainAxisSize:MainAxisSize.min,
              children:<Widget>[
                 if(!_isLogin)userImagePicker(_pickedImage),
                TextFormField(
                key:ValueKey('email'),
                  validator:(val){
                  if(val.isEmpty || !val.contains('@')){
                    return "Please enter valid email";
                  }
                  return null;
                  },
                  onSaved:(val)=> _email=val,
                  keyboardType:TextInputType.emailAddress,
                  decoration:InputDecoration(labelText:"Email Address"),
                ),
                if(!_isLogin)
                TextFormField(
                  key:ValueKey('username'),
                  validator:(val){
                    if(val.isEmpty || val.length <4){
                      return "Please enter at least 4 charcters";
                    }
                    return null;
                  },
                  onSaved:(val)=> _username=val,
                  keyboardType:TextInputType.emailAddress,
                  decoration:InputDecoration(labelText:"Username"),
                ),


                TextFormField(
                  key:ValueKey('password'),
                  validator:(val){
                    if(val.isEmpty || val.length <4){
                      return "Please enter at least 4 charcters";
                    }
                    return null;
                  },
                  onSaved:(val)=> _password=val,
                  obscureText:true,
                  //keyboardType:TextInputTyp,
                  decoration:InputDecoration(labelText:"Password"),
                ),




                SizedBox(
                  height:10,
                ),
                if(widget.isLoading)
                  CircularProgressIndicator(),


                if(!widget.isLoading)
                RaisedButton(

                   color:Colors.redAccent,
                    child:Text(_isLogin ? 'Login ' : 'sign up',style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),),
                    onPressed:_submit,

                ),
                if(!widget.isLoading)
                FlatButton(
                  child:Text(_isLogin ? 'create new account ' : 'I already have an account'),
                  onPressed:(){
                    setState(() {
                      _isLogin = !_isLogin;
                    });

                  },
                )
              ]
            )
          )
        )
      )
    );
  }
}
