

import 'package:fire99/add_post.dart';
import 'package:fire99/isRememberMe.dart';
import 'package:fire99/login2.dart';
import 'package:fire99/posts.dart';
import 'package:fire99/profile.dart';
import 'package:fire99/save2.dart';
import 'package:fire99/saveCredentials.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'dart:math' as math show pi;
import 'package:collapsible_sidebar/collapsible_sidebar.dart';

class SidebarPage extends StatefulWidget {
  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  List<CollapsibleItem> _items;
  String _headline;
  NetworkImage _avatarImg =
  NetworkImage('https://www.w3schools.com/howto/img_avatar.png');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.assessment,
        onPressed: () => setState(() => _headline = 'DashBoard'),
        isSelected: true,
      ),
      CollapsibleItem(
          text: 'Errors',
          icon: Icons.cancel,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return AddPost();
                }));
          }
      ),

      CollapsibleItem(
        text: 'Notifications',
        icon: Icons.notifications,
        onPressed: () => setState(() => _headline = 'Notifications'),
      ),
      CollapsibleItem(
        text: 'Settings',
        icon: Icons.settings,
        onPressed: () => setState(() => _headline = 'Settings'),
      ),
      CollapsibleItem(
        text: 'Home',
        icon: Icons.home,
        onPressed: () => setState(() => _headline = 'Home'),
      ),
      CollapsibleItem(
        text: 'Categories',
        icon: Icons.account_tree,
        onPressed: () => setState(() => _headline = 'cat'),
      ),
      CollapsibleItem(
        text: 'Eco',
        icon: Icons.eco,
        onPressed: () => setState(() => _headline = 'Eco'),
      ),
      CollapsibleItem(
        text: 'Event',
        icon: Icons.event,
        onPressed: () => setState(() => _headline = 'Event'),
      ),
      CollapsibleItem(
        text: 'Email',
        icon: Icons.email,
        onPressed: () => setState(() => _headline = 'Email'),
      ),
      CollapsibleItem(
        text: 'Face',
        icon: Icons.face,
        onPressed: () => setState(() => _headline = 'Face'),
      ),
      CollapsibleItem(
          text: 'Profile',
          icon: Icons.supervised_user_circle,
          onPressed:() => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return profile(context); //ud

              }))

      ),

      CollapsibleItem(
          text: 'Deals',
          icon: Icons.support_agent_rounded,
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return save2(context);//ud

              }))

      ),
      CollapsibleItem(
          text: 'Log Out',
          icon: Icons.logout,
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            await setIsRememberMe(false);
            await removeCredentials();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen2()));
          }

      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        items: _items,
        avatarImg: _avatarImg,
        title: '',
        body: Container(),
        backgroundColor: Colors.black26,

        selectedTextColor: Colors.white,
        textStyle: TextStyle(color:Colors.black,fontSize: 15, fontStyle: FontStyle.italic),
        titleStyle: TextStyle(

            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        toggleTitleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }


}
class getCustomAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      PreferredSize( preferredSize: Size.fromHeight(50),
          child:Container(
            decoration:BoxDecoration(
                gradient: LinearGradient(

                )
            ),
          )


      );
  }

}