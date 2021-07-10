
import 'package:fire99/register2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dashboard.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }


  final _formkey = GlobalKey<FormState>();


  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose()
  {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
            SizedBox(
            height:50,
          ),
          RichText( /*Swap Broker*/
          textAlign: TextAlign.center,
          text: TextSpan(
          text: 'Sw',
          style:TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.blue),
          children: [
            TextSpan(
              text: 'ap',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: ' Broker',
              style: TextStyle(color: Colors.blue, fontSize: 30),
            ),
          ],
        ),

      ),
      SizedBox(
        height:25,
      ),

      TextFormField(/*/Email*/
      controller: _emailcontroller,
      decoration: InputDecoration(
      border: InputBorder.none,
      fillColor: Color(0xfff3f3f4),
      filled: true,
      hintText: 'Email or Phone',
      prefixIcon: Icon(Icons.person),
    ),
    validator: (value) {
    if(value.isEmpty){
    return 'Please Fill Email Input';
    }


    },
    ),
    SizedBox(
    height: 25,
    ),
    TextFormField(/*Password*/
    obscureText: true,
    controller: _passwordcontroller,
    decoration: InputDecoration(
    border: InputBorder.none,
    fillColor: Color(0xfff3f3f4),
    filled: true,
    hintText: 'Password',
    prefixIcon: Icon(Icons.lock),
    ),
    validator: (value){
    if(value.isEmpty){
    return 'Please Fill Password Input';
    }
    },
    ),
    SizedBox(
    height: 25,
    ),



    FlatButton(/*Login button*/

    onPressed: () async {

    if(_formkey.currentState.validate()){

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);

    if(result != null)
    {
    // pushReplacement
    print('welcomee');
    Navigator. pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => DashboardScreen()),
    );

    }
    else{
    print('user not found');
    }
    }
    },

    child: Container(
    //width: MediaQuery.of(context).size.width,/
    padding: EdgeInsets.symmetric(vertical:15),
    alignment: Alignment.center,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    boxShadow: <BoxShadow>[
    BoxShadow(
    color: Colors.grey.shade200,
    offset: Offset(2,4),
    blurRadius: 5,
    spreadRadius: 2 )
    ],
    gradient: LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Colors.blue,Colors.lightBlueAccent])),
    child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.white),
    ),
    ),
    ),
    FlatButton(//Forget password button/
    onPressed: () {  },
    child:Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    alignment: Alignment.centerRight,
    child: Text('Forgot Password ?',
    style: TextStyle(
    fontSize: 14, fontWeight: FontWeight.w400)),
    ),
    ),
    SizedBox(
    height:5,
    ),

    Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Row(
    children: <Widget>[
    SizedBox(width:20,),
    Expanded(
    child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Divider(
    thickness: 1,
    ),
    ),
    ),
    Text('or'),
    Expanded(
    child: Padding(
    padding: EdgeInsets.symmetric(horizontal:10),
    child: Divider(
    thickness:1,
    ),
    ),
    ),
    SizedBox(
    width:20,
    ),
    ],
    )
    ),
    SizedBox(
    height:5,
    ),
    FlatButton(//FacebookButton/
    onPressed: () {  },
    child: Container(
    height: 50,
    margin: EdgeInsets.symmetric(vertical:20),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Row(
    children: <Widget>[
    Expanded(
    flex: 1,
    child: Container(
    decoration: BoxDecoration(
    color: Color(0xff1959a9),
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),topLeft: Radius.circular(5)),
    ),
    alignment: Alignment.center,
    child: Text('f',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w400)),
    ),
    ),
    Expanded(
    flex: 5,
    child: Container(
    decoration: BoxDecoration(
    color: Color(0xff2872ba),
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),topRight: Radius.circular(5)),
    ),
    alignment: Alignment.center,
    child: Text(
    'Log in with Facebook',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400)
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    SizedBox(
    height:20,
    ),
    FlatButton(//Register button/
    onPressed: () async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen2() ) );
    },
    child: Container(
    margin: EdgeInsets.symmetric(vertical:20),
    padding: EdgeInsets.all(15),
    alignment: Alignment.bottomCenter,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Text(
    'Don\'t have an account ?',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),
    ),
    SizedBox(
    width: 10,
    ),
    Text('Register',style: TextStyle(color:Colors.blue ,fontSize: 13,fontWeight: FontWeight.w600),
    ),
    ],
    ),
    ),
    )

    ],
    )
    ),
    ),
    );
  }



}


/*import 'package:fire99/new1.dart';
import 'package:fire99/register.dart';
import 'package:fire99/register2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashboard.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() { 
      print("completed");
      setState(() {});
    });
  }


  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose()
  {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Login To My Account'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  validator: (value) {
                    if(value.isEmpty){
                      return 'Please Fill Email Input';
                    }
                   
                    
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Please Fill Password Input';
                    }
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text('Login',style: TextStyle(color: Colors.white),),
                  onPressed: () async {

                    if(_formkey.currentState.validate()){
                  
                    WidgetsFlutterBinding.ensureInitialized();
                     await Firebase.initializeApp();
                     
                      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);

                     if(result != null)
                     {
                        // pushReplacement
                          print('welcomee');
                        Navigator. push(
                           context,
                          MaterialPageRoute(builder: (context) => DashboardScreen()),
                       );

                     }
                     else{
                       print('user not found');
                      }
                    }
                  },
                ),
                RaisedButton(
                    child: Text('start '),
                    color: Colors.blue,
                    onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
                    }

                ),

                RaisedButton(
                    child: Text('show '),
                    color: Colors.blue,
                    onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => new1()));
                    }

                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text('Register New Account',style: TextStyle(color: Colors.white),),
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen() ) );
                  },
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text('Register New Account 2 ',style: TextStyle(color: Colors.white),),
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen2() ) );
                  },
                )

              ],
            )
        ),
      ),
    );
  }

}
*/