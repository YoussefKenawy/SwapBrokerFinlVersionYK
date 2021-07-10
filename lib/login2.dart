//import 'package:fire99/ResetPassword.dart';
import 'package:fire99/register.dart';
import 'package:fire99/register2.dart';
import 'package:fire99/reset.dart';
import 'package:fire99/routeOnCondition.dart';
import 'package:fire99/saveCredentials.dart';
import 'package:fire99/slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'dashboard.dart';
import 'isRememberMe.dart';

class LoginScreen2 extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen2> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool isRememberMe;
  bool isLoadingPage = false;
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      myInit();
    });
  }

  myInit() async {
    isRememberMe = await getIsRememberMe();
    if (isRememberMe) {
      isLoadingPage = true;
    }
    setState(() {});
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      postFrame();
    });
  }

  postFrame() async {
    if (isRememberMe) {
      isLoadingPage = true;
      try {
        await routeOnCondition(context: context, isRememberMe: isRememberMe);
      } on Exception catch (e) {
        setState(() {
          isLoadingPage = false;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Something went wrong, Please try again")));
        });
      }
    }
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }

  Future<void> changeSetRememberMe(
      {bool v, String email, String password}) async {
    await setIsRememberMe(v);
    bool isRememberMe = await getIsRememberMe();

    if (isRememberMe) {
      await setPassword(password);
      await setEmail(email);
    } else {
      await setEmail('');
      await setPassword('');
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return isLoadingPage
        ? Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    )
        : Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formkey,
            child: ListView(
              children: <Widget>[
                /* SizedBox(
           height:75,
          ),*/
                Container(
                  margin: EdgeInsets.only(top: height * 0.15),
                  height: height * 0.11,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: RichText(
                    /*Swap Broker*/
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Sw',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue),
                      children: [
                        TextSpan(
                          text: 'ap',
                          style: TextStyle(
                              color: Colors.black, fontSize: 30),
                        ),
                        TextSpan(
                          text: ' Broker',
                          style:
                          TextStyle(color: Colors.blue, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
                /*SizedBox(
        height:30,
      ),*/

                TextFormField(
                  /*/Email*/
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    /*border: InputBorder.none,*/
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Email or Phone',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Fill Email Input';
                    }
                  },
                ),
                Container(
                  color: Colors.white,
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                TextFormField(
                  /*Password*/
                  obscureText: true,
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    /*border: InputBorder.none,*/
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Fill Password Input';
                    }
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                CheckboxListTile(
                    title: Text("Remember me"),
                    value: isRememberMe ?? false,
                    tristate: false,
                    onChanged: (v) {
                      isRememberMe = v;
                      print("Changed isRememberMestate $isRememberMe");
                      setIsRememberMe(v);
                      changeSetRememberMe(
                          v: v,
                          email: _emailcontroller.text.trim(),
                          password: _passwordcontroller.text.trim());
                      setState(() {});
                    }),
                FlatButton(
                  /*Login button*/

                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      WidgetsFlutterBinding.ensureInitialized();
                      await Firebase.initializeApp();

                      var result = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                          email: _emailcontroller.text,
                          password: _passwordcontroller.text);

                      if (result != null) {
                        //if isRememberMe is true, save credentials
                        if (isRememberMe) {
                          await saveCredentials(
                              email: _emailcontroller.text.trim(),
                              password: _passwordcontroller.text.trim());
                        } else {
                          await removeCredentials();
                        }
                        // pushReplacement
                        print('welcomee');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SliderScreen()),
                        );
                      } else {
                        print('user not found');
                      }
                    }
                  },
                  child: Container(
                    //width: MediaQuery.of(context).size.width,/
                    padding: EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(30)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.shade200,
                              offset: Offset(2, 4),
                              blurRadius: 5,
                              spreadRadius: 2)
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.blue,
                              Colors.lightBlueAccent
                            ])),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                FlatButton(
                  //Forget password button/
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password ?',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                  ),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => ResetScreen()),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 20,
                        ),
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
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: SignInButton(
                    Buttons.Google,
                    onPressed: () async {
                      await sginInWithGoogle();
                    },

                    /*child: Container(
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
        ),*/
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  //Register button/
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen2()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Don\'t have an account ?',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Future<void> sginInWithGoogle() async /* Sgin in with google method*/
  {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
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
