import 'package:flutter/material.dart';

void main() => runApp(new1());

class new1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      home: DefaultTabController(
        length:4,

        child: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
            centerTitle:true,
            leading:IconButton(
              icon:Icon(Icons.menu),
              onPressed:(){

              },
            ),
            actions:[
              IconButton(
                icon:Icon(Icons.menu),

                onPressed:(){

                },
              ),



              IconButton(
                icon:Icon(Icons.search),

                onPressed:(){

                },
              ),

            ],
            //backgroundColor:Colors.red,
            flexibleSpace:Container(
              decoration:BoxDecoration(
                  gradient: LinearGradient(
                    colors:[Colors.purple,Colors.red],
                    begin:Alignment.bottomRight,

                  )
              ),
            ),

            bottom:TabBar(
                indicatorColor:Colors.white,
                indicatorWeight:5,
                tabs:[
                  Tab(icon:Icon(Icons.home),text:'Home'),
                  Tab(icon:Icon(Icons.star),text:'Feed'),
                  Tab(icon:Icon(Icons.face),text:'Profile'),
                  Tab(icon:Icon(Icons.settings),text:'Settings'),
                ]
            ),
            elevation:10,

          ),

          body: TabBarView(
              children:[
                buildPage('Home page'),
                buildPage('Feed page'),
                buildPage('profile page'),
                buildPage('settings')
              ]
          ),
        ),
      ),

    );

  }
  Widget buildPage(String text)=>Center(
      child:Text(
        text,
        style:TextStyle(fontSize:28),

      )
  );
}
